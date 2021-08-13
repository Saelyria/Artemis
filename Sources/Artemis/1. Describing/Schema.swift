import Foundation

/**
 A type that represents a GraphQL schema that declares the API's 'query' and (optionally) 'mutation' types.
 */
public protocol Schema {
    associatedtype QueryType: Object
    associatedtype MutationType = Never

    /// The API's query type whose keypaths are used for field selection on query operations.
    static var query: QueryType { get }
    /// The API's mutation type whose keyparths are used for field selection on mutation operations.
    static var mutation: MutationType { get }
}

extension Schema where MutationType == Never {
    public static var mutation: MutationType { fatalError() }
}
