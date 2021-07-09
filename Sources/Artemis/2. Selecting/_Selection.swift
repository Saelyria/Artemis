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
public class _Selection<T: Object, Result, Args: ArgumentsList>: _SelectionProtocol {	
	enum FieldType {
        case field(key: String, alias: String?, renderedSelectionSet: String?, createResult: (Any) throws -> Result)
		case fragment(inline: String, rendered: String)
	}
	
	let fieldType: FieldType
	var key: String {
		switch self.fieldType {
		case .field(let key, let alias, _, _): return alias ?? key
		case .fragment: return ""
		}
	}
    public var items: [_SelectionBase] = []
    public var renderedFragmentDeclarations: [String] {
		var frags: [String] = []
		switch self.fieldType {
		case .fragment(_, let rendered):
			frags = [rendered]
		case .field: break
		}
		frags.append(contentsOf: self.items.flatMap { $0.renderedFragmentDeclarations })
		return frags
	}
    public let error: GraphQLError?
	private var renderedArguments: [String] = []
	
	internal init(fieldType: FieldType, items: [_SelectionBase], error: GraphQLError? = nil) {
		self.fieldType = fieldType
		self.items = items
		self.error = error
	}
}

extension _Selection {
    /**
    Adds an argument to the queried field.

    This subscript returns a closure that is called with the value to supply for the argument. Keypaths usable with this
    subscript method are keypaths on the field's `Argument` type.
    */
    public subscript<V: _SelectionInput>(
        dynamicMember keyPath: KeyPath<Args, V>
    ) -> (V) -> _Selection<T, Result, Args> {
        return { value in
            let args: Args = Args.instance
            // Accessing the keypath makes the Argument property wrapper populate a dictionary for the ArgumentsList
            // instance with the string name of the keypath.
            let _ = args[keyPath: keyPath]
            let argName = Args.name(forPath: keyPath)
            let renderedArg = "\(argName):\(value.render())"
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
    public subscript<V: Input>(
        dynamicMember keyPath: KeyPath<Args, V>
    ) -> ( (_InputBuilder<V>) -> Void ) -> _Selection<T, Result, Args> {
        return { inputBuilder in
            let b = _InputBuilder<V>()
            inputBuilder(b)

            let args: Args = Args.instance
            // Accessing the keypath makes the Argument property wrapper populate a dictionary for the ArgumentsList
            // instance with the string name of the keypath.
            let _ = args[keyPath: keyPath]
            let argName = Args.name(forPath: keyPath)
            let value = "{\(b.addedInputFields.joined(separator: ","))}"
            self.renderedArguments.append("\(argName):\(value)")
            return self
        }
    }
}

extension _Selection {
	/**
	Renders this added field and its sub-selected fields into a string that can be added to a document.
	*/
    public func render() -> String {
		switch self.fieldType {
		case .field(let key, let alias, let rendered_SelectionSet, _):
			let args: String
			if self.renderedArguments.isEmpty {
				args = ""
			} else {
				args = "(\(self.renderedArguments.joined(separator: ",")))"
			}
			
			let name: String = (alias == nil) ? key : "\(alias!):\(key)"
			let _SelectionSet = (rendered_SelectionSet == nil) ? "" : "{\(rendered_SelectionSet!)}"
			return "\(name)\(args)\(_SelectionSet)"
		case .fragment(let renderedInlineFragment, _):
			return renderedInlineFragment
		}
	}
	
	/**
	Creates the appropriate response object type (likely a `Partial` object specialized with this instance's `Value`
	type) from the response JSON.
	*/
    public func createResult(from dict: [String : Any]) throws -> Result {
        switch self.fieldType {
        case .field(_, _, _, let createResult):
            return try createResult(dict[self.key] as Any)
        case .fragment: throw GraphQLError.malformattedResponse(reason: "Shouldn't need to get result from a fragment")
        }
	}
}
