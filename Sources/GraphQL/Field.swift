import Foundation

public protocol AnyField {
    associatedtype Value: CompatibleValue
    associatedtype Argument = Void
    
    var key: String { get }
    static func string(for argument: Argument) throws -> String
}

@propertyWrapper
public struct Field<Value: CompatibleValue, ArgType>: AnyField {
    public typealias Argument = ArgType
    
    public let key: String
    public var wrappedValue: Value?
    
    public init(_ key: String, _ arguments: ArgType.Type) {
        self.key = key
    }
    
    public static func string(for argument: ArgType) throws -> String {
        return try argumentString(for: argument)
    }
}
public extension Field where ArgType == Void {
    init(_ key: String) {
        self.key = key
    }
}
