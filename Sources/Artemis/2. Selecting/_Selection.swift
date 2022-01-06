import Foundation

/**
 A type that adds a field to a selection set.

 Instances of this type are created inside an operation's selection set to specify the fields that are being queried
 for on the operation.

 - `T`: The GraphQL object type that we are selecting fields on. For example, a `User` type.
 - `Result`: The type returned to the response as a result of selecting this field.
*/
public class _Selection<T: Object, Result> {
    let key: String
    let createResultClosure: (Any) throws -> Result

    var erased: _AnySelection

    internal init(
        key: String,
        alias: String?,
        arguments: [Argument],
        renderedSelectionSet: String?,
        createResult: @escaping (Any) throws -> Result,
        items: [_AnySelection],
        renderedFragmentDeclarations: [String],
        error: GraphQLError?
    ) {
        self.key = alias ?? key
        self.createResultClosure = createResult

        let fragmentDeclarations = renderedFragmentDeclarations + items.flatMap { $0.renderedFragmentDeclarations }
        self.erased = _AnySelection(
            items: items,
            renderedFragmentDeclarations: fragmentDeclarations,
            error: error,
            render: {
                var name = key
                if let alias = alias {
                    name = "\(alias):\(key)"
                }
                var selectionSet = ""
                if let renderedSelectionSet = renderedSelectionSet {
                    selectionSet = "{\(renderedSelectionSet)}"
                }
                var renderedArgs = arguments
                    .map { "\($0.name):\($0.value)" }
                    .joined(separator: ",")
                renderedArgs = renderedArgs.isEmpty ? renderedArgs : "(\(renderedArgs))"

                return "\(name)\(renderedArgs)\(selectionSet)"
            }
        )
    }

    func createResult(from dict: [String: Any]) throws -> Result {
        try createResultClosure(dict[self.key] as Any)
	}
}
