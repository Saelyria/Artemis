import Foundation

public protocol Schema {
    associatedtype QueryType: Object
    associatedtype MutationType = Never

    static var query: QueryType { get }
    static var mutation: MutationType { get }
}

extension Schema where MutationType == Never {
    static var mutation: MutationType { fatalError() }
}
