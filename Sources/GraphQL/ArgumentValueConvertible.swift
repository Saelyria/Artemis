import Foundation

public protocol ArgumentValueConvertible {
    var argumentValueString: String { get }
}

extension String: ArgumentValueConvertible {
    public var argumentValueString: String { return "\"\(self)\"" }
}
extension Int: ArgumentValueConvertible {
    public var argumentValueString: String { return "\(self)" }
}
extension Float: ArgumentValueConvertible {
    public var argumentValueString: String { return "\(self)" }
}
extension Double: ArgumentValueConvertible {
    public var argumentValueString: String { return "\(self)" }
}
extension Bool: ArgumentValueConvertible {
    public var argumentValueString: String { return "\(self)" }
}


func argumentString(forEnumArgument arg: Any) throws -> String {
    guard !(arg is Void) else { return "" }
    
    let mirror = Mirror(reflecting: arg)
    guard let (name, value): (String, Any) = mirror.children.first.flatMap({ child -> (String, Any)? in
        return (child.label == nil) ? nil : (child.label!, child.value)
    }) else { return "" }
    guard let valueString = (value as? ArgumentValueConvertible)?.argumentValueString else { throw GraphQLError.argumentValueNotConvertible }
    
    return "\(name):\(valueString)"
}
