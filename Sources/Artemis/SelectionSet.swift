import Foundation

/**
A type that holds the generic values for a set of one or more selected fields on a type.

For example, given a selection set like:
user {
	name
	age
}

The 'selection set' is an object that represents 'the selection of the 'name' and 'age' fields on a 'user' type'.
Concrete types conforming to this protocol are returned from the 'sub selection function builders'.
*/
public protocol SelectionSet: AnySelectionSet {
	/// The object type that the fields selected from this aggregate are on.
	associatedtype T: Object
	/// The combined 'result' of the selected fields. For example, in the above example selection set of 'name' and
	/// 'age', this would be a `(String, Int)` tuple.
	associatedtype Result
	
	func createResult(from: [String : Any]) throws -> Result
}
/**
A type-erased reference to a selection set that allows them to be put into arrays/individually called for their
'render' strings to build queries.
*/
public protocol AnySelectionSet {
	var items: [AnySelectionSet] { get }
	var renderedFragmentDeclarations: [String] { get }
	var error: GraphQLError? { get }
	func render() -> String
}
public extension AnySelectionSet {
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

public struct SelectionSetItem<T: Object, Result>: SelectionSet {
	public var items: [AnySelectionSet]
	var resultBuilder: ([String: Any]) throws -> Result
	
	public func createResult(from: [String : Any]) throws -> Result {
		try self.resultBuilder(from)
	}
}
