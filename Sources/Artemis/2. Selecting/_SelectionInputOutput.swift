import Foundation

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
 A type-erased reference to a selection (either `_SelectionSet`, `_FragmentSelection`, or `_Selection`) that allows them
 to be put into arrays/individually called for their 'render' strings to build queries.
*/
struct _AnySelection {
    var items: [_AnySelection]
    var renderedFragmentDeclarations: [String]
    var error: GraphQLError?
    var render: () -> String
}
