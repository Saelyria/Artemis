import Foundation

public protocol Interface: Schema {
    
}

public protocol AnyInterfaces {
    associatedtype I1; associatedtype I2; associatedtype I3
}
public struct Interfaces<I1, I2, I3>: AnyInterfaces {
    init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type) { }
}
public extension Interfaces where I3 == Void {
    init(_ i1: I1.Type, _ i2: I2.Type) { }
}
public extension Interfaces where I2 == Void, I3 == Void {
    init(_ i1: I1.Type) { }
}
public extension Interfaces where I1 == Void, I2 == Void, I3 == Void {
    init() { }
}

public protocol Schema: GraphQLCompatibleValue {
    /// The type whose keypaths can be used to construct GraphQL queries. Defaults to `Self`.
    associatedtype QueryableType: Schema = Self
    associatedtype Result = Partial<Self>
    associatedtype ImplementedInterfaces: AnyInterfaces = Interfaces<Void, Void, Void>
    
    static var implements: ImplementedInterfaces { get }
    
    // TODO: figure out how this could work with aliases
//    associatedtype Complete = Void
//    static func createCompleteInstance(fromPartial: Partial<Self>) -> Complete?
    
    init()
}

public extension Schema where ImplementedInterfaces == Interfaces<Void, Void, Void> {
    static var implements: ImplementedInterfaces { return Interfaces() }
}

//public extension Schema where Complete == Void {
//    static func createCompleteInstance(fromPartial: Partial<Self>) -> Complete? {
//        return ()
//    }
//}

public extension Schema {
    static func createUnsafeResult<R>(from object: Any, key: String) throws -> R {
        guard R.self == Result.self else { throw GraphQLError.invalidOperation }
        guard let dictRepresentation = object as? [String: Any] else { throw GraphQLError.singleItemParseFailure(operation: key) }
        return Partial<Self>(values: dictRepresentation) as! R
    }
}

extension Array: Schema where Element: Schema {
    public typealias QueryableType = Element.QueryableType
}

extension Array: GraphQLScalarValue where Element: GraphQLScalarValue { }
extension Array: GraphQLCompatibleValue where Element: GraphQLCompatibleValue {
    public typealias Result = [Element.Result]
    public typealias Value = Self
    
    public static func createUnsafeResult<R>(from object: Any, key: String) throws -> R {
        guard R.self == Result.self else { throw GraphQLError.invalidOperation }
        guard let resultArray = object as? [Any] else { throw GraphQLError.arrayParseFailure(operation: key) }
        let mappedArray: [Element.Result] = try resultArray.map { try Element.createUnsafeResult(from: $0, key: key) }
        guard let returnedArray = mappedArray as? R else { throw GraphQLError.arrayParseFailure(operation: key) }
        return returnedArray
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
    static func createUnsafeResult<R>(from: Any, key: String) throws -> R
}

public protocol GraphQLScalarValue: GraphQLCompatibleValue {
    associatedtype Result = Self
}
public extension GraphQLScalarValue {
    static func createUnsafeResult<R>(from object: Any, key: String) throws -> R {
        guard R.self == Result.self else { throw GraphQLError.invalidOperation }
        guard let returnValue = object as? R else { throw GraphQLError.singleItemParseFailure(operation: key) }
        return returnValue
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
