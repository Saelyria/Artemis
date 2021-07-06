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
public class Selection<T: Object, Result, Args: ArgumentsList>: SelectionProtocol {	
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
    public var items: [SelectionBase] = []
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
	
	internal init(fieldType: FieldType, items: [SelectionBase], error: GraphQLError? = nil) {
		self.fieldType = fieldType
		self.items = items
		self.error = error
	}
}

extension Selection {
    /**
    Adds an argument to the queried field.

    This subscript returns a closure that is called with the value to supply for the argument. Keypaths usable with this
    subscript method are keypaths on the field's `Argument` type.
    */
    public subscript<V>(
        dynamicMember keyPath: KeyPath<Args, Argument<V>>
    ) -> (V) -> Selection<T, Result, Args> {
        return { value in
            let renderedArg = Args()[keyPath: keyPath].render(value: value)
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
    public subscript<V>(
        dynamicMember keyPath: KeyPath<Args, Argument<V>>
    ) -> ( (InputBuilder<V>) -> Void ) -> Selection<T, Result, Args> where V: Input {
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

extension Selection {
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
