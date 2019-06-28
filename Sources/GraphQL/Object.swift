import Foundation

public protocol Interface: Object, ObjectSchema {
    
}

public protocol AnyInterfaces {
    associatedtype I1; associatedtype I2; associatedtype I3; associatedtype I4; associatedtype I5
}
public struct Interfaces<I1, I2, I3, I4, I5>: AnyInterfaces {
    init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type) { }
}
public extension Interfaces where I5 == Void {
    init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type, _ i4: I4.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void {
    init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void, I3 == Void {
    init(_ i1: I1.Type, _ i2: I2.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void, I3 == Void, I2 == Void {
    init(_ i1: I1.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void, I3 == Void, I2 == Void, I1 == Void {
    init() { }
}

public protocol Object: SelectionOutput {
    /// The type whose keypaths can be used to construct GraphQL queries. Defaults to `Self`.
    associatedtype Schema: ObjectSchema
    associatedtype Result = Partial<Self>
}

public extension Object where Self: ObjectSchema {
    typealias Schema = Self
}

public protocol ObjectSchema {
    associatedtype ImplementedInterfaces: AnyInterfaces = Interfaces<Void, Void, Void, Void, Void>
    
    static var implements: ImplementedInterfaces { get }
    
    init()
}

public extension ObjectSchema where ImplementedInterfaces == Interfaces<Void, Void, Void, Void, Void> {
    static var implements: ImplementedInterfaces { return Interfaces() }
}

public extension Object {
    static func createUnsafeResult<R>(from object: Any, key: String) throws -> R {
        guard R.self == Result.self else { throw GraphQLError.invalidOperation }
        guard let dictRepresentation = object as? [String: Any] else { throw GraphQLError.singleItemParseFailure(operation: key) }
        return Partial<Self>(values: dictRepresentation) as! R
    }
}

extension Array: Object where Element: Object {
    public typealias Schema = Element.Schema
}

extension Array: Scalar where Element: Scalar { }
extension Array: SelectionOutput where Element: SelectionOutput {
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
extension Array: SelectionInput where Element: SelectionInput {
    public func render() -> String {
        return "[\(self.map { $0.render() }.joined(separator: ","))]"
    }
}

extension Optional: SelectionOutput where Wrapped: SelectionOutput {
    public typealias Result = Wrapped.Result
    public static func createUnsafeResult<R>(from: Any, key: String) throws -> R {
        return try Wrapped.createUnsafeResult(from: from, key: key)
    }
}
extension Optional: SelectionInput where Wrapped: SelectionInput {
    public func render() -> String {
        switch self {
        case .some(let wrapped): return wrapped.render()
        case .none: return "null"
        }
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

/**
 A type that can be the value of a field selectable for an operation.
 
 'Output' types are, in GraphQL terms, 'objects', 'interfaces', 'unions', 'scalars', or 'enums'. Types conforming to
 this protocol (done by conforming to the protocol for one of the aforementioned protocols) are able to be used as the
 'return value' for a field selected in an operation (query or mutation).
 */
public protocol SelectionOutput {
    associatedtype Result = Partial<Self>
    static func createUnsafeResult<R>(from: Any, key: String) throws -> R
}

/**
 A type that can be used as the input for an argument to a field.
 
 'Input' types are, in GraphQL terms, 'input objects', 'scalars', or 'enums'. Types conforming to this protocol (done by
 conforming to the protocol for one of the aforementioned protocols) are able to be used as arguments on a field.
 */
public protocol SelectionInput {
    /// Renders the instance for use in a GraphQL query.
    func render() -> String
}

/**
 A protocol that identifies as a type as being a GraphQL 'scalar'.
 
 'Scalars' are base types like `String`, `Int`, or `Bool` that can be used as the leaves or an operation.
 */
public protocol Scalar: SelectionOutput, SelectionInput {
    associatedtype Result = Self
}
public extension Scalar {
    static func createUnsafeResult<R>(from object: Any, key: String) throws -> R {
        guard R.self == Result.self else { throw GraphQLError.invalidOperation }
        guard let returnValue = object as? R else { throw GraphQLError.singleItemParseFailure(operation: key) }
        return returnValue
    }
}

extension String: Scalar {
    public typealias Result = String
    public typealias Value = String
    public func render() -> String {
        return "\"\(self)\""
    }
}
extension Int: Scalar {
    public typealias Result = Int
    public typealias Value = Int
    public func render() -> String {
        return String(describing: self)
    }
}
extension Float: Scalar {
    public typealias Result = Float
    public typealias Value = Float
    public func render() -> String {
        return String(describing: self)
    }
}
extension Double: Scalar {
    public typealias Result = Double
    public typealias Value = Double
    public func render() -> String {
        return String(describing: self)
    }
}
extension Bool: Scalar {
    public typealias Result = Bool
    public typealias Value = Bool
    public func render() -> String {
        return String(describing: self)
    }
}
