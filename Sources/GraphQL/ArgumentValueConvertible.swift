import Foundation

protocol ArgumentValueConvertible {
    var argumentValueString: String { get }
}

extension ArgumentValueConvertible where Self: RawRepresentable, Self.RawValue == String {
    var argumentValueString: String { return self.rawValue }
}
extension String: ArgumentValueConvertible {
    var argumentValueString: String { return "\"\(self)\"" }
}
extension Int: ArgumentValueConvertible {
    var argumentValueString: String { return "\(self)" }
}
extension Float: ArgumentValueConvertible {
    var argumentValueString: String { return "\(self)" }
}
extension Double: ArgumentValueConvertible {
    var argumentValueString: String { return "\(self)" }
}
extension Bool: ArgumentValueConvertible {
    var argumentValueString: String { return "\(self)" }
}

func argumentString(for arg: Any) throws -> String {
    guard !(arg is Void) else { return "" }
    
    let mirror = Mirror(reflecting: arg)
    let argString = try mirror.children
        .compactMap { child -> (String, Any)? in
            return (child.label == nil) ? nil : (child.label!, child.value)
        }.map { (label, value) -> String in
            guard let value = value as? ArgumentValueConvertible else { throw GraphQLError.argumentValueNotConvertible }
            return "\(label):\(value.argumentValueString)"
        }.joined(separator: ",")
    return "(\(argString))"
}
