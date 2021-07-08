import Foundation

/**
A protocol that identifies a type as representing a GraphQL 'scalar'.

'Scalars' are base types like `String`, `Int`, or `Bool` that can be used as the leaves for an operation.
*/
public protocol Scalar: _SelectionOutput, _SelectionInput {
    associatedtype Result = Self
}

public extension Scalar {
    static func createUnsafeResult<R>(from object: Any, key: String) throws -> R {
        guard R.self == Result.self else { throw GraphQLError.invalidOperation }
        guard let returnValue = object as? R else { throw GraphQLError.singleItemParseFailure(operation: key) }
        return returnValue
    }
}

// MARK: Standard type Scalar conformance

extension Array: Scalar where Element: Scalar { }

extension Optional: Scalar where Wrapped: Scalar { }

public typealias ID = String

extension String: Scalar {
    public typealias Result = String
    public typealias Value = String
    public func render() -> String {
        return "\"\(self)\""
    }
    public static var `default`: String { "" }
}
extension Int: Scalar {
    public typealias Result = Int
    public typealias Value = Int
    public func render() -> String {
        return String(describing: self)
    }
    public static var `default`: Int { 0 }
}
extension Float: Scalar {
    public typealias Result = Float
    public typealias Value = Float
    public func render() -> String {
        return String(describing: self)
    }
    public static var `default`: Float { 0 }
}
extension Double: Scalar {
    public typealias Result = Double
    public typealias Value = Double
    public func render() -> String {
        return String(describing: self)
    }
    public static var `default`: Double { 0 }
}
extension Bool: Scalar {
    public typealias Result = Bool
    public typealias Value = Bool
    public func render() -> String {
        return String(describing: self)
    }
    public static var `default`: Bool { false }
}
