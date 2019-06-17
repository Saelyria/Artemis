import Foundation

public protocol AnyField {
    associatedtype Value: GraphQLCompatibleValue
    associatedtype Argument = Void
    
    var key: String { get }
    static func string(for argument: Argument) throws -> String
}

@propertyDelegate
public struct Field<Value: GraphQLCompatibleValue, ArgType>: AnyField {
    public typealias Argument = ArgType
    
    public let key: String
    public var value: Value!
    public init(_ key: String, type valueType: Value.Type, argumentType: ArgType.Type) {
        self.key = key
    }
    
    public static func string(for argument: ArgType) throws -> String {
        return try argumentString(for: argument)
    }
}
public extension Field where ArgType == Void {
    init(_ key: String, type valueType: Value.Type) {
        self.key = key
    }
}
