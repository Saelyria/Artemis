import Foundation

public protocol ArgumentsList {
    init()
}

@propertyWrapper
public struct Argument<Value: SelectionInput> {
    public let name: String
	public var projectedValue: Argument<Value> { return self }
    public var wrappedValue: Value?
    let defaultValue: Value?
    
    //    public init(initialValue: Value?, _ name: String) {
    //        self.defaultValue = initialValue
    //        self.name = name
    //    }
    
    public init(_ name: String, default: Value? = nil) {
        self.name = name
        self.defaultValue = `default`
    }
    
    func render(value: Value) -> String {
        return "\(name):\(value.render())"
    }
    
    func render(value: Variable<Value>) -> String {
        return "\(name):\(value.name)"
    }
}

public struct NoArguments: ArgumentsList {
    public init() { }
}

public protocol AnyField {
    associatedtype Value: SelectionOutput
    associatedtype Argument: ArgumentsList = NoArguments
    
    var key: String { get }
}

@propertyWrapper
public struct Field<Value: SelectionOutput, ArgType: ArgumentsList>: AnyField {
    public typealias Argument = ArgType
    
    public let key: String
    public var wrappedValue: Value?
	public var projectedValue: Field<Value, ArgType> { return self }
    
    public init(_ key: String, _ arguments: ArgType.Type) {
        self.key = key
    }
}
public extension Field where ArgType == NoArguments {
    init(_ key: String) {
        self.key = key
    }
}
