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
    var key: String
    var alias: String?
    var arguments: [Argument]
    var renderedSelectionSet: String?
    var createResultClosure: (Any) throws -> Result
    public var items: [_SelectionBase]
    public var renderedFragmentDeclarations: [String]
    public var error: GraphQLError?

    internal init(
        key: String,
        alias: String?,
        arguments: [Argument],
        renderedSelectionSet: String?,
        createResult: @escaping (Any) throws -> Result,
        items: [_SelectionBase],
        renderedFragmentDeclarations: [String],
        error: GraphQLError?
    ) {
        self.key = key
        self.alias = alias
        self.arguments = arguments
        self.renderedSelectionSet = renderedSelectionSet
        self.createResultClosure = createResult
        self.items = items
        self.renderedFragmentDeclarations = renderedFragmentDeclarations
        self.renderedFragmentDeclarations.append(contentsOf: items.flatMap { $0.renderedFragmentDeclarations })
        self.error = error
    }
}

extension _Selection {
	/**
	Renders this added field and its sub-selected fields into a string that can be added to a document.
	*/
    public func render() -> String {
        let name: String = (alias == nil) ? key : "\(alias!):\(key)"
        let _SelectionSet = (renderedSelectionSet == nil) ? "" : "{\(renderedSelectionSet!)}"
        var renderedArgs = arguments.map {
            "\($0.name):\($0.value)"
        }.joined(separator: ",")
        renderedArgs = renderedArgs.isEmpty ? renderedArgs : "(\(renderedArgs))"

        return "\(name)\(renderedArgs)\(_SelectionSet)"
	}
	
	/**
	Creates the appropriate response object type (likely a `Partial` object specialized with this instance's `Value`
	type) from the response JSON.
	*/
    public func createResult(from dict: [String : Any]) throws -> Result {
        try createResultClosure(dict[self.alias ?? self.key] as Any)
	}
}
