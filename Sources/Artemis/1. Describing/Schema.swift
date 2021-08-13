import Foundation

/**
 A type that represents a GraphQL schema that declares the API's 'query' and (optionally) 'mutation' types.
 */
public protocol Schema {
    /// The type to use for queries on this schema.
    associatedtype QueryType: Object
    /// The type to use for mutations on this schema. Leave as `Never` if this schema does not support mutations.
    associatedtype MutationType = Never

    /// The API's query type whose keypaths are used for field selection on query operations.
    static var query: QueryType { get }
    /// The API's mutation type whose keypaths are used for field selection on mutation operations.
    static var mutation: MutationType { get }
}

extension Schema where MutationType == Never {
    /// The API's mutation type whose keypaths are used for field selection on mutation operations.
    public static var mutation: MutationType { fatalError("This should not be possible") }
}
