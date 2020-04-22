import Foundation

/**
 A type-erased reference to a selection (either `SelectionSet` or `Add` that allows them to be put into arrays/
 individually called for their 'render' strings to build queries.
*/
protocol Selection {
	var items: [Selection] { get }
	var renderedFragmentDeclarations: [String] { get }
	var error: GraphQLError? { get }
	func render() -> String
}
extension Selection {
	var renderedFragmentDeclarations: [String] {
		return self.items.flatMap { $0.renderedFragmentDeclarations }
	}
	
	var error: GraphQLError? {
		return self.items.compactMap { $0.error }.first
	}
	
	func render() -> String {
		return "\(self.items.map { "\($0.render())" }.joined(separator: ","))"
	}
}

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
public struct SelectionSet<Result>: Selection {
    var items: [Selection]
	var resultBuilder: ([String: Any]) throws -> Result
	
	public func createResult(from: [String : Any]) throws -> Result {
		try self.resultBuilder(from)
	}
}
