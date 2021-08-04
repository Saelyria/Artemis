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
public class _Selection<T: Object, Result>: _SelectionProtocol {	
	enum FieldType {
        case field(
            key: String,
            alias: String?,
            arguments: [Argument],
            renderedSelectionSet: String?,
            createResult: (Any) throws -> Result
        )
		case fragment(
            inline: String,
            rendered: String
        )
	}
	
	let fieldType: FieldType
	var key: String {
		switch self.fieldType {
		case .field(let key, let alias, _, _, _): return alias ?? key
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
	
	internal init(fieldType: FieldType, items: [_SelectionBase], error: GraphQLError? = nil) {
		self.fieldType = fieldType
		self.items = items
		self.error = error
	}
}

extension _Selection {
	/**
	Renders this added field and its sub-selected fields into a string that can be added to a document.
	*/
    public func render() -> String {
		switch self.fieldType {
		case .field(let key, let alias, let arguments, let renderedSelectionSet, _):
			let name: String = (alias == nil) ? key : "\(alias!):\(key)"
			let _SelectionSet = (renderedSelectionSet == nil) ? "" : "{\(renderedSelectionSet!)}"
            let renderedArgs = arguments.map {
                
            }
			return "\(name)\(renderedArguments)\(_SelectionSet)"
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
        case .field(_, _, _, _, let createResult):
            return try createResult(dict[self.key] as Any)
        case .fragment: throw GraphQLError.malformattedResponse(reason: "Shouldn't need to get result from a fragment")
        }
	}
}
