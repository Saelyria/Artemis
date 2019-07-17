import Foundation

/*
public protocol KeyPathListable {
    init()
    
    static var allKeyPaths: [(String, KeyPath<Self, Any?>)] { get }
}

extension KeyPathListable {
    var _keyPathReadableFormat: [String: Any] {
        let mirror = Mirror(reflecting: self)
        var description: [String: Any] = [:]
        for case let (label?, value) in mirror.children {
            description[label] = value
        }
        return description
    }
    
    public static var allKeyPaths: [(String, KeyPath<Self, Any?>)] {
        var keyPaths: [(String, KeyPath<Self, Any?>)] = []
        let instance = Self()
        for (key, _) in instance._keyPathReadableFormat {
            keyPaths.append((key, \Self._keyPathReadableFormat[key]))
        }
        return keyPaths
    }
}

public extension KeyPathListable where Self: Schema, Self.QueryableType == Self {
    static func string(for keyPath: PartialKeyPath<Self>) -> String {
        guard let keyString = Self.allKeyPaths.first(where: { $0.1 == keyPath })?.0 else { return "" }
        return keyString
    }
}
*/
