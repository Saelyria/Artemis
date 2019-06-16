import Foundation

public protocol Schema: GraphQLCompatibleValue, AnyFieldValue {
    /// The type whose keypaths can be used to construct GraphQL queries. Defaults to `Self`.
    associatedtype QueryableType: Schema = Self
    /// An enum type that is used to provide arguments to queries for this object. Defaults to `Void`.
    associatedtype Args = Void
    
    associatedtype Result = Partial<Self>
    
    static func string(for keyPath: PartialKeyPath<QueryableType>) -> String
    static func string(for argument: Args) -> String
}

public extension Schema {
    static func string(for argument: Args) -> String {
        return String(describing: argument)
            .replacingOccurrences(of: "(", with: ": ")
            .replacingOccurrences(of: ")", with: "")
    }
    
    static func createUnsafeResult<R>(from dict: [String : Any], key: String) throws -> R {
        guard R.self == Result.self else { throw GraphQLError.invalidOperation }
        guard let dictRepresentation = dict[key] as? [String: Any] else { throw GraphQLError.singleItemParseFailure(operation: key) }
        return Partial<Self>(values: dictRepresentation) as! R
    }
}
public extension Schema where Result == Partial<Self> {
    static func createResult(from dict: [String: Any], key: String) throws -> Partial<Self> {
        guard let dictRepresentation = dict[key] as? [String: Any] else { throw GraphQLError.singleItemParseFailure(operation: key) }
        return Partial(values: dictRepresentation)
    }
}

extension Array: Schema where Element: Schema {
    public typealias QueryableType = Element.QueryableType
    public typealias Args = Element.Args
    
    public static func string(for keyPath: PartialKeyPath<Element.QueryableType>) -> String {
        return Element.string(for: keyPath)
    }
    
    public static func string(for argument: Args) -> String {
        return Element.string(for: argument)
    }
    
    public static func createResult(from dict: [String : Any], key: String) throws -> [Partial<Element>] {
        if let value = dict[key], !(value is NSNull) {
            guard let objectsArray = value as? [[String: Any]] else { throw GraphQLError.arrayParseFailure(operation: key) }
            return objectsArray.map {
                return Partial(values: $0)
            }
        }
        return []
    }
}

extension Array: GraphQLScalarValue where Element: GraphQLScalarValue { }
extension Array: GraphQLCompatibleValue, AnyFieldValue where Element: GraphQLCompatibleValue {
    public typealias Result = [Element.Result]
    public typealias Value = Self
    
    public static func createUnsafeResult<R>(from dict: [String : Any], key: String) throws -> R {
        guard R.self == Result.self else { throw GraphQLError.invalidOperation }
        return dict[key] as! R
    }
}

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

public protocol GraphQLCompatibleValue {
    associatedtype Result = Partial<Self>
    static func createUnsafeResult<R>(from dict: [String: Any], key: String) throws -> R
}

public protocol GraphQLScalarValue: GraphQLCompatibleValue, AnyFieldValue {
    associatedtype Result = Self
}
public extension GraphQLScalarValue {
    static func createUnsafeResult<R>(from dict: [String: Any], key: String) throws -> R {
        guard R.self == Result.self else { throw GraphQLError.invalidOperation }
        return dict[key] as! R
    }
}

extension String: GraphQLScalarValue {
    public typealias Result = String
    public typealias Value = String
}
extension Int: GraphQLScalarValue {
    public typealias Result = Int
    public typealias Value = Int
}
extension Float: GraphQLScalarValue {
    public typealias Result = Float
    public typealias Value = Float
}
extension Double: GraphQLScalarValue {
    public typealias Result = Double
    public typealias Value = Double
}
extension Bool: GraphQLScalarValue {
    public typealias Result = Bool
    public typealias Value = Bool
}

