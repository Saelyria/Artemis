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
    
    guard let (enumName, enumArgs) = getNameAndValue(from: arg) else { return "" }
    
    let valueMirror = Mirror(reflecting: enumArgs)
    
//    guard let valueString = (value as? ArgumentValueConvertible)?.argumentValueString else { throw GraphQLError.argumentValueNotConvertible }
//
//    return "\(name):\(valueString)"
    return ""
}

func getNameAndValue(from object: Any) -> (String, Any)? {
    let mirror = Mirror(reflecting: object)
    return mirror.children.first.flatMap({ child -> (String, Any)? in
        return (child.label == nil) ? nil : (child.label!, child.value)
    })
}
