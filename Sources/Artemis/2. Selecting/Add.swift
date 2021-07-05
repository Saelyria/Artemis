import Foundation

/**
A type that adds a field to a selection set.

Instances of this type are created inside an operation's selection set to specify the fields that are being queried
for on the operation. They are created using `KeyPath` objects of the type being queried. If the value of the keypath
is an object (i.e. non-scalar value), an additional sub-selection builder of `Add` objects is also given to the `Add`
instance.

- `T`: The GraphQL object type that we are selecting fields on. For example, a `User` type.
- `F`: The specific `Field` type (i.e. property) that this 'add' object is selecting. For example, the `name` field on
	the `User`, which could be a `Field<String, NoArguments>`.
*/
@dynamicMemberLookup
public class Add<T: Object, Result, Args: ArgumentsList>: Selection {	
	enum FieldType {
        case field(key: String, alias: String?, renderedSelectionSet: String?, createResult: (Any) throws -> Result)
		case fragment(inline: String, rendered: String, createResult: (Any) throws -> Result)
	}
	
	let fieldType: FieldType
	var key: String {
		switch self.fieldType {
		case .field(let key, let alias, _, _): return alias ?? key
		case .fragment: return ""
		}
	}
    public var items: [SelectionBase] = []
    public var renderedFragmentDeclarations: [String] {
		var frags: [String] = []
		switch self.fieldType {
		case .fragment(_, let rendered, _):
			frags = [rendered]
		case .field: break
		}
		frags.append(contentsOf: self.items.flatMap { $0.renderedFragmentDeclarations })
		return frags
	}
    public let error: GraphQLError?
	private var renderedArguments: [String] = []
	
	internal init(fieldType: FieldType, items: [SelectionBase], error: GraphQLError? = nil) {
		self.fieldType = fieldType
		self.items = items
		self.error = error
	}
}

extension Add {
    /**
    Adds an argument to the queried field.

    This subscript returns a closure that is called with the value to supply for the argument. Keypaths usable with this
    subscript method are keypaths on the field's `Argument` type.
    */
    public subscript<V>(
        dynamicMember keyPath: KeyPath<Args, Argument<V>>
    ) -> (V) -> Add<T, Result, Args> {
        return { value in
            let renderedArg = Args()[keyPath: keyPath].render(value: value)
            self.renderedArguments.append(renderedArg)
            return self
        }
    }

    /**
    Adds an argument wrapped as a variable to the queried field.

    This subscript returns a closure that is called with a `Variable` wrapping the value to supply for the argument.
    Keypaths usable with this subscript method are keypaths on the field's `Argument` type.
    */
    //    public subscript<V>(dynamicMember keyPath: KeyPath<F.Argument, Argument<V>>) -> (Variable<V>) -> Add<T, F, SelectionSet> {
    //        return { variable in
    //            let renderedArg = F.Argument()[keyPath: keyPath].render(value: variable)
    //            self.renderedArguments.append(renderedArg)
    //            return self
    //        }
    //    }

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
    public subscript<V>(
        dynamicMember keyPath: KeyPath<Args, Argument<V>>
    ) -> ( (InputBuilder<V>) -> Void ) -> Add<T, Result, Args> where V: Input {
        return { inputBuilder in
            let b = InputBuilder<V>()
            inputBuilder(b)
            let key = Args()[keyPath: keyPath].name
            let value = "{\(b.addedInputFields.joined(separator: ","))}"
            self.renderedArguments.append("\(key):\(value)")
            return self
        }
    }
}

extension Add {
	/**
	Adds the given field to the operation.
	
	- parameter keyPath: The keypath referring to the field on the object type. The `Value` associated type of this
	keypath object must be a GraphQL 'scalar' type.
	- parameter alias: The alias to use for this field in the rendered GraphQL document.
	*/
    public convenience init<Value: Scalar>(
        _ keyPath: KeyPath<T.Schema, Field<Value, Args>>,
        alias: String? = nil
    ) where Result == Value.Result {
		let field = T.Schema()[keyPath: keyPath]
        let fieldType: FieldType = .field(
            key: field.key,
            alias: alias,
            renderedSelectionSet: nil,
            createResult: { dict in
                return try Value.createUnsafeResult(from: dict, key: field.key)
            }
        )
        self.init(fieldType: fieldType, items: [])
	}
}

extension Add {
	/**
	Adds the given field to the operation.
	
	- parameter keyPath: The keypath referring to the field on the object type. The `Value` associated type of this
	keypath object must be a GraphQL 'object' type.
	- parameter alias: The alias to use for this field in the rendered GraphQL document.
	- parameter selectionSet: A function builder that additional `Add` components can be given in to select fields on
	this `Add` instance's returned value.
	*/
    public convenience init<S: Selection, Value: Object>(
        _ keyPath: KeyPath<T.Schema, Field<Value, Args>>,
        alias: String? = nil,
        @SelectionSetBuilder<Value> selectionSet: () -> S
    ) where Result == Value.Result {
		let field = T.Schema()[keyPath: keyPath]
		let ss = selectionSet()
        let fieldType: FieldType = .field(
            key: field.key,
            alias: alias,
            renderedSelectionSet: ss.render(),
            createResult: { dict in
                return try Value.createUnsafeResult(from: dict, key: field.key)
            }
        )
        self.init(fieldType: fieldType, items: ss.items)
	}
}

//extension Add where F.Value: Collection, SS.T.Schema == F.Value.Element, F.Value.Element: Object {
	/**
	Adds the given field to the operation.
	
	- parameter keyPath: The keypath referring to the field on the object type. The `Value` associated type of this
	keypath object must be a GraphQL 'object' type.
	- parameter alias: The alias to use for this field in the rendered GraphQL document.
	- parameter SelectionSet: A function builder that additional `Add` components can be given in to select fields on
	this `Add` instance's returned value.
	*/
//	public convenience init(_ keyPath: KeyPath<T.Schema, F>, alias: String? = nil, @SelectionSetBuilder SelectionSet: () -> SelectionSet) {
//		let field = T.Schema()[keyPath: keyPath]
//		let ss = SelectionSet()
//		self.init(fieldType:  .field(key: field.key, alias: alias, renderedSelectionSet: ss.render()), items: ss.items)
//	}
//}

extension Add {
	/**
	Renders this added field and its sub-selected fields into a string that can be added to a document.
	*/
    public func render() -> String {
		switch self.fieldType {
		case .field(let key, let alias, let renderedSelectionSet, _):
			let args: String
			if self.renderedArguments.isEmpty {
				args = ""
			} else {
				args = "(\(self.renderedArguments.joined(separator: ",")))"
			}
			
			let name: String = (alias == nil) ? key : "\(alias!):\(key)"
			let SelectionSet = (renderedSelectionSet == nil) ? "" : "{\(renderedSelectionSet!)}"
			return "\(name)\(args)\(SelectionSet)"
		case .fragment(let renderedInlineFragment, _, _):
			return renderedInlineFragment
		}
	}
	
	/**
	Creates the appropriate response object type (likely a `Partial` object specialized with this instance's `Value`
	type) from the response JSON.
	*/
    public func createResult(from dict: [String : Any]) throws -> Result {
        switch self.fieldType {
        case .field(_, _, _, let createResult), .fragment(_, _, let createResult):
            return try createResult(dict[self.key] as Any)
        }
	}
}

/// A type that can be used as the sub-selection type for `Add` instances whose value type is a scalar (so can't include
/// a sub-selection).
//public struct EmptySelectionSet: SelectionSet {
//	public struct T: Object {
//		public struct Schema: ObjectSchema {
//			public init() { }
//		}
//	}
//	public typealias Result = Never
//
//	public var items: [AnySelectionSet] = []
//
//	public func includedKeyPaths<T>() -> [(String, PartialKeyPath<T>)] {
//		return []
//	}
//
//	public func render() -> String {
//		return ""
//	}
//
//	public func createResult(from: [String : Any]) throws -> Never {
//		fatalError()
//	}
//}
