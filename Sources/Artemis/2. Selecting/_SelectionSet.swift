import Foundation

/**
 A type that holds the generic values for a set of one or more selected fields on a type.

 For example, given a selection set like:
 ```
 user {
    name
    age
 }
 ```
 The 'selection set' is an object that represents 'the selection of the 'name' and 'age' fields on a 'user' type'.
*/
public class _SelectionSet<Result> {
    var items: [_AnySelection]
    var rendered: String
    var resultBuilder: ([String: Any]) throws -> Result

    init(items: [_AnySelection], rendered: String, resultBuilder: @escaping ([String: Any]) throws -> Result) {
        self.items = items
        self.rendered = rendered
        self.resultBuilder = resultBuilder
    }

    func createResult(from: [String : Any]) throws -> Result {
        try self.resultBuilder(from)
    }

    var renderedFragmentDeclarations: [String] {
        return self.items.flatMap { $0.renderedFragmentDeclarations }
    }

    var error: GraphQLError? {
        return self.items.compactMap { $0.error }.first
    }

    func render() -> String {
        return rendered
    }
}
