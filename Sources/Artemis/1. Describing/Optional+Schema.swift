import Foundation

extension Optional: _SelectionOutput where Wrapped: _SelectionOutput {
    public typealias Result = Wrapped.Result
    public static func createUnsafeResult<R>(from: Any, key: String) throws -> R {
        return try Wrapped.createUnsafeResult(from: from, key: key)
    }
}
extension Optional: _SelectionInput where Wrapped: _SelectionInput {
    public func render() -> String {
        switch self {
        case .some(let wrapped): return wrapped.render()
        case .none: return "null"
        }
    }
}
extension Optional {
    public static var `default`: Optional<Wrapped> { nil }
}

extension Optional: _ObjectSchema where Wrapped: _ObjectSchema {
    public typealias ImplementedInterfaces = Wrapped.ImplementedInterfaces

    public static var implements: ImplementedInterfaces { Wrapped.implements }

    public init() {
        self = nil
    }
}

extension Optional: _AnyObject where Wrapped: _AnyObject {
    public static var _schemaName: String { Wrapped._schemaName }
}

extension Optional: Object where Wrapped: Object {
    public typealias SubSchema = Wrapped.SubSchema
}

extension Optional: Input where Wrapped: Input {

}
extension Optional: RawRepresentable where Wrapped: RawRepresentable, Wrapped.RawValue == String {
    public init?(rawValue: String) {
        if let wrapped = Wrapped.init(rawValue: rawValue) {
            self = .some(wrapped)
        }
        self = .none
    }

    public var rawValue: String {
        switch self {
        case .some(let wrapped): return wrapped.rawValue
        case .none: return ""
        }
    }
}

extension Optional: CaseIterable where Wrapped: Enum {
    public typealias AllCases = [Self]

    public static var allCases: AllCases {
        return Wrapped.allCases.map { $0 }
    }
}

extension Optional: Enum where Wrapped: Enum { }

//extension Optional: Queryable where Wrapped: Queryable {
//    typealias QueryableType = Wrapped.QueryableType
//    typealias Args = Wrapped.Args
//    typealias Result = Partial<Wrapped>?
//
//    static func string(for keyPath: PartialKeyPath<Wrapped.QueryableType>) -> String {
//        return Wrapped.string(for: keyPath)
//    }
//
//    static func string(for argument: Wrapped.Args) -> String {
//        return Wrapped.string(for: argument)
//    }
//
//    static func createResult(from dict: [String : Any], key: String) throws -> Partial<Wrapped>? {
//        if let value = dict[key], !(value is NSNull) {
//            guard let selfDict = value as? [String: Any] else { throw GraphQLError.singleItemParseFailure(operation: key) }
//            return Partial(values: selfDict)
//        }
//        return nil
//    }
//}
//extension Optional where Wrapped: Collection, Wrapped.Element: Queryable {
//    static func createResult(from dict: [String : Any], key: String) throws -> [Partial<Wrapped.Element>]? {
//        if let value = dict[key], !(value is NSNull) {
//            guard let objectsArray = value as? [[String: Any]] else { throw GraphQLError.arrayParseFailure(operation: key) }
//            return objectsArray.map {
//                return Partial(values: $0)
//            }
//        }
//        return nil
//    }
//}
//extension Optional: GraphQLScalarValue where Wrapped: GraphQLScalarValue { }
//extension Optional: GraphQLCompatibleValue where Wrapped: GraphQLCompatibleValue { }

