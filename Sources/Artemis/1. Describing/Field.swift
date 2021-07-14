import Foundation

/**
An object containing the information about a field on a GraphQL type.

Instances of this type are added as properties on a GraphQL type to represent the fields that can be queried or mutated
on that oject. Via generic associated types, `Field` objects contain type information for the value that is returned
when this field is queried as well as the type whose properties represent the arguments to this field.
*/
@propertyWrapper
public struct Field<T, Value: _SelectionOutput, ArgType: ArgumentsList> {
    public static subscript<OuterSelf: Object>(
        _enclosingInstance object: OuterSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<OuterSelf, T>,
        storage storageKeyPath: ReferenceWritableKeyPath<OuterSelf, Self>
    ) -> T {
        get {
            OuterSelf.set(key: object[keyPath: storageKeyPath].key, forPath: wrappedKeyPath)
            return object[keyPath: storageKeyPath].throwawayValue()
        }
        set { }
    }
    
	/// The string name of the field as it should appear in a document.
    public let key: String
    @available(*, unavailable, message: "Fields are only available on classes conforming to Object, Interface, or Input")
    public var wrappedValue: T {
        get { fatalError() }
        set { fatalError() }
    }
    private let throwawayValue: () -> T
}

extension Field where T == (Value, ArgType.Type) {
    public init(_ key: String) {
        self.key = key
        self.throwawayValue = { (.default, ArgType.self) }
    }
}

extension Field where Value: _SelectionOutput, ArgType == NoArguments, T == Value {
    public init(_ key: String) {
        self.key = key
        self.throwawayValue = { .default }
    }
}

/**
A protocol that a type whose properties represent arguments for a `Field` must conform to.
*/
public protocol ArgumentsList: Encodable { }

/// For optimization, instantiated `ArgumentsList` objects are stored here under the string names of their parent
/// `ArgumentsList` types.
private var cachedArgListsForTypes: [String: Any] = [:]
/// Since there's no way to get string names for `KeyPath` instances, we store them here after pulling them from
/// `Argument` instances, under the string names of their parent `ArgumentsList` types. The `AnyKeyPath`s here are paths
///  on the `ArgumentsList`, and the `String` value returned is the string name of the keypath we can use with GraphQL.
private var nameStringsForArgumentKeyPaths: [String: [AnyKeyPath: String]] = [:]

extension ArgumentsList {
    private static var typeName: String { String(describing: Self.self) }

    static var instance: Self {
//        let instance: Self
//        if let i = cachedArgListsForTypes[typeName] as? Self {
//            instance = i
//        } else {
//            instance = Self.init()
//            cachedArgListsForTypes[typeName] = instance
//        }
//        return instance
        fatalError()
    }

    static func set(name: String, forPath keyPath: AnyKeyPath) {
        if nameStringsForArgumentKeyPaths[typeName] == nil {
            nameStringsForArgumentKeyPaths[typeName] = [:]
        }
        nameStringsForArgumentKeyPaths[typeName]?[keyPath] = name
    }

    static func name(forPath keyPath: AnyKeyPath) -> String {
        return nameStringsForArgumentKeyPaths[typeName]![keyPath]!
    }
}

/**
A type that can be used with a `Field` instance to indicate that the field takes no arguments.
*/
public struct NoArguments: ArgumentsList {
    public func encode(to encoder: Encoder) throws { }
}
