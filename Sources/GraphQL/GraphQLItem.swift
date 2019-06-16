import Foundation

/// A protocol representing one piece of a GraphQL query. The associated `T` type refers to the type we're building a query for.
public protocol GraphQLItem: AnyGraphQLItem {
    associatedtype T: Queryable // The type whose keys are being queried
    
    func includedKeyPaths() -> [(String, PartialKeyPath<T.QueryableType>)]
}
public extension GraphQLItem {
    func unsafeIncludedKeyPaths() -> [(String, AnyKeyPath)] {
        return self.includedKeyPaths()
    }
}

public protocol AnyGraphQLItem {
    func render() -> String
    func renderDebug() -> String
    func unsafeIncludedKeyPaths() -> [(String, AnyKeyPath)]
}

public struct AggregateGraphQLItem<T: Queryable>: GraphQLItem {
    let items: [AnyGraphQLItem]
    
    init(_ items: [AnyGraphQLItem]) {
        self.items = items
    }
    
    public func render() -> String {
        return self.items.map { "\($0.render())" }.joined(separator: ", ")
    }
    
    public func renderDebug() -> String {
        return self.items.reduce(into: "", { $0.append("\($1.render())\n") })
    }
    
    public func includedKeyPaths() -> [(String, PartialKeyPath<T.QueryableType>)] {
        var keyPaths: [(String, PartialKeyPath<T.QueryableType>)] = []
        for item in items {
            if let itemKeyPaths = item.unsafeIncludedKeyPaths() as? [(String, PartialKeyPath<T.QueryableType>)] {
                keyPaths.append(contentsOf: itemKeyPaths)
            }
        }
        return keyPaths
    }
}

public struct EmptyGraphQLItem<T: Queryable>: GraphQLItem {
    public func includedKeyPaths<T>() -> [(String, PartialKeyPath<T>)] {
        return []
    }
    
    public func render() -> String {
        return ""
    }
    
    public func renderDebug() -> String {
        return ""
    }
}

