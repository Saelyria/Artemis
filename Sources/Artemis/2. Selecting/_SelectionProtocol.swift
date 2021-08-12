import Foundation

public protocol _SelectionProtocol: _SelectionBase {
    associatedtype Result

    func createResult(from: [String : Any]) throws -> Result
}

/**
A type that can be the value of a field selectable for an operation.

'Output' types are, in GraphQL terms, 'objects', 'interfaces', 'unions', 'scalars', or 'enums'. Types conforming to
this protocol (done by conforming to the protocol for one of the aforementioned protocols) are able to be used as the
'return value' for a field selected in an operation (query or mutation).
*/
public protocol _SelectionOutput {
    associatedtype Result = Partial<Self>
    static func createUnsafeResult(from: Any, key: String) throws -> Result

    static var `default`: Self { get }
}

/**
A type that can be used as the input for an argument to a field.

'Input' types are, in GraphQL terms, 'input objects', 'scalars', or 'enums'. Types conforming to this protocol (done by
conforming to the protocol for one of the aforementioned protocols) are able to be used as arguments on a field.
*/
public protocol _SelectionInput {
    /// Renders the instance for use in a GraphQL query.
    func render() -> String
}

/**
 A type-erased reference to a selection (either `_SelectionSet` or `Add`) that allows them to be put into arrays/
 individually called for their 'render' strings to build queries.
*/
public protocol _SelectionBase {
    var items: [_SelectionBase] { get }
    var renderedFragmentDeclarations: [String] { get }
    var error: GraphQLError? { get }
    func render() -> String
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
public class _SelectionSet<Result>: _SelectionProtocol {
    public var items: [_SelectionBase]
    var rendered: String
	var resultBuilder: ([String: Any]) throws -> Result

    init(items: [_SelectionBase], rendered: String, resultBuilder: @escaping ([String: Any]) throws -> Result) {
        self.items = items
        self.rendered = rendered
        self.resultBuilder = resultBuilder
    }
	
	public func createResult(from: [String : Any]) throws -> Result {
		try self.resultBuilder(from)
	}

    public var renderedFragmentDeclarations: [String] {
        return self.items.flatMap { $0.renderedFragmentDeclarations }
    }

    public var error: GraphQLError? {
        return self.items.compactMap { $0.error }.first
    }

    public func render() -> String {
        return rendered
    }
}
