import Foundation

extension Optional: _SelectionOutput where Wrapped: _SelectionOutput {
    public typealias Result = Wrapped.Result
    public static func createUnsafeResult(from: Any, key: String) throws -> Result {
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
