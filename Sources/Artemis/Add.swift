import Foundation

/**
A type that adds a field to a selection set.
 
Instances of this type are created inside an operation's selection set to specify the fields that are being queried
for on the operation. They are created using `KeyPath` objects of the type being queried. If the value of the keypath
is an object (i.e. non-scalar value), an additional sub-selection builder of `Add` objects is also given to the `Add`
instance.
*/
@dynamicMemberLookup
public class Add<T: Object, F: AnyField, SubSelection: FieldAggregate>: FieldAggregate {
   /// The type of result object that adding this field gives when its surrounding operation is performed.
    public typealias Result = F.Value.Result
    
    enum FieldType {
        case field(key: String, alias: String?, renderedSubSelection: String?)
        case fragment(rendered: String)
    }
    
    let fieldType: FieldType
    var key: String {
        switch self.fieldType {
        case .field(let key, let alias, _): return alias ?? key
        case .fragment(_): return ""
        }
    }
    public var items: [AnyFieldAggregate] = []
    public let error: GraphQLError?
    private var renderedArguments: [String] = []
   
   /**
    Adds an argument to the queried field.
    
    This keypath returns a closure that is called with the value to supply for the argument. Keypaths usable with this
	subscript method are keypaths on the field's `Argument` type.
    */
    public subscript<V>(dynamicMember keyPath: KeyPath<F.Argument, Argument<V>>) -> (V) -> Add<T, F, SubSelection> {
        return { value in
            let renderedArg = F.Argument()[keyPath: keyPath].render(value: value)
            self.renderedArguments.append(renderedArg)
            return self
        }
    }
   
   /**
    Adds an argument wrapped as a variable to the queried field.
    
    This keypath returns a closure that is called with a `Variable` wrapping the value to supply for the argument.
	Keypaths usable with this subscript method are keypaths on the field's `Argument` type.
    */
    public subscript<V>(dynamicMember keyPath: KeyPath<F.Argument, Argument<V>>) -> (Variable<V>) -> Add<T, F, SubSelection> {
        return { variable in
            let renderedArg = F.Argument()[keyPath: keyPath].render(value: variable)
            self.renderedArguments.append(renderedArg)
            return self
        }
    }
    
	/**
	Adds an 'input' object argument to the queried field.
	 
	This keypath returns a closure that is called with a closure that builds the input object to supply for the
	argument. This second closure is passed in an 'input builder' object that values of the input object can be added
	to via callable keypaths. It will generally look something like this:
	
	```
	Add(\.somePath) {
		...
	}
	.inputObject {
		$0.propOnInput(1)
		$0.otherProp("")
	}
	```
	where the `$0` is referring to the 'input builder' object. The methods we are calling on it are keypaths on the
	input object type.
	 */
    public subscript<V>(dynamicMember keyPath: KeyPath<F.Argument, Argument<V>>) -> ( (InputBuilder<V>) -> Void ) -> Add<T, F, SubSelection> where V: Input {
        return { inputBuilder in
			let b = InputBuilder<V>()
            inputBuilder(b)
			let key = F.Argument()[keyPath: keyPath].name
			let value = "{\(b.addedInputFields.joined(separator: ","))}"
			self.renderedArguments.append("\(key):\(value)")
            return self
        }
    }
    
    internal init(fieldType: FieldType, error: GraphQLError? = nil) {
        self.fieldType = fieldType
        self.error = error
    }
}

/**
An object used when adding arguments to a field selection that builds a string of values for a given 'input' object.

This object is specialized with the type of an 'input' object being used as the value for an argument. It is passed into
the closure on that argument, where it is called with the keypaths of the wrapped 'input' type with the input's values.
*/
@dynamicMemberLookup
public class InputBuilder<I: Input> {
	internal var addedInputFields: [String] = []
	
	public subscript<V: Scalar, T>(dynamicMember keyPath: KeyPath<I.Schema, Field<V, T>>) -> (V) -> Void {
        return { value in
			let key = I.Schema()[keyPath: keyPath].key
			self.addedInputFields.append("\(key):\(value.render())")
        }
    }
	
    public subscript<V, T>(dynamicMember keyPath: KeyPath<I.Schema, Field<V, T>>) -> ( (InputBuilder<V>) -> Void ) -> Void where V: Input {
        return { inputBuilder in
			let b = InputBuilder<V>()
            inputBuilder(b)
			let key = I.Schema()[keyPath: keyPath].key
			let value = "{\(b.addedInputFields.joined(separator: ","))}"
			self.addedInputFields.append("\(key):\(value)")
        }
    }
}

extension Add where F.Value: Scalar, SubSelection == EmptySubSelection {
    /// Declares that the given property should be fetched on the queried object.
    public convenience init(_ keyPath: KeyPath<T.Schema, F>, alias: String? = nil) {
        let field = T.Schema()[keyPath: keyPath]
        self.init(fieldType: .field(key: field.key, alias: alias, renderedSubSelection: nil))
    }
}

extension Add where F.Value: Object, SubSelection.T == F.Value {
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    public convenience init(_ keyPath: KeyPath<T.Schema, F>, alias: String? = nil, @SubSelectionBuilder subSelection: () -> SubSelection) {
        let field = T.Schema()[keyPath: keyPath]
        self.init(fieldType: .field(key: field.key, alias: alias, renderedSubSelection: subSelection().render()))
    }
}

extension Add where F.Value: Collection, SubSelection.T.Schema == F.Value.Element, F.Value.Element: SelectionOutput {
    public convenience init(_ keyPath: KeyPath<T.Schema, F>, alias: String? = nil, @SubSelectionBuilder subSelection: () -> SubSelection) {
        let field = T.Schema()[keyPath: keyPath]
        self.init(fieldType:  .field(key: field.key, alias: alias, renderedSubSelection: subSelection().render()))
    }
}

extension Add {
    public func render() -> String {
        switch self.fieldType {
        case .field(let key, let alias, let renderedSubSelection):
            let args: String
            if self.renderedArguments.isEmpty {
                args = ""
            } else {
                args = "(\(self.renderedArguments.joined(separator: ",")))"
            }
            
            let name: String = (alias == nil) ? key : "\(alias!):\(key)"
            let subSelection = (renderedSubSelection == nil) ? "" : "{\(renderedSubSelection!)}"
            return "\(name)\(args)\(subSelection)"
        case .fragment(let renderedFragment):
            return renderedFragment
        }
    }
    
    public func createResult(from dict: [String : Any]) throws -> F.Value.Result {
        guard let object: Any = dict[self.key] else { throw GraphQLError.malformattedResponse(reason: "Response didn't include key for \(self.key)") }
        return try F.Value.createUnsafeResult(from: object, key: self.key)
    }
}

public struct EmptySubSelection: FieldAggregate {
    public struct T: Object {
        public struct Schema: ObjectSchema {
            public init() { }
        }
    }
    public typealias Result = Never
    
    public var items: [AnyFieldAggregate] = []
    
    public func includedKeyPaths<T>() -> [(String, PartialKeyPath<T>)] {
        return []
    }
    
    public func render() -> String {
        return ""
    }
    
    public func createResult(from: [String : Any]) throws -> Never {
        fatalError()
    }
}

