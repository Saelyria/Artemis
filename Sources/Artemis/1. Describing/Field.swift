import Foundation

public typealias _FieldArgValue<V: SelectionOutput, A: ArgumentsList> = (V, A)

/**
An object containing the information about a field on a GraphQL type.

Instances of this type are added as properties on a GraphQL type to represent the fields that can be queried or mutated
on that oject. Via generic associated types, `Field` objects contain type information for the value that is returned
when this field is queried as well as the type whose properties represent the arguments to this field.
*/
@propertyWrapper
public struct Field<T, Value: SelectionOutput, ArgType: ArgumentsList> {
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
    @available(*, unavailable, message: "Values are not accessed on Fields")
    public var wrappedValue: T {
        get { fatalError() }
        set { fatalError() }
    }
    private let throwawayValue: () -> T

    public var projectedValue: Self { self }
}

extension Field where T == _FieldArgValue<Value, ArgType> {
    public init(wrappedValue: T! = nil, _ key: String) {
        self.key = key
        self.throwawayValue = { (.default, .init()) }
    }
}

extension Field where Value: SelectionOutput, ArgType == NoArguments, T == Value {
    public init(wrappedValue: T! = nil, _ key: String) {
        self.key = key
        self.throwawayValue = { .default }
    }
}

/**
A protocol that a type whose properties represent arguments for a `Field` must conform to.
*/
public protocol ArgumentsList {
    init()
}
private var argumentNames: [TypeName: [AnyKeyPath: String]] = [:]
extension ArgumentsList {
    private static var typeName: TypeName { String(describing: Self.self) }

    static func set(key: String, forPath keyPath: AnyKeyPath) {
        if argumentNames[typeName] == nil {
            argumentNames[typeName] = [:]
        }
        argumentNames[typeName]?[keyPath] = key
    }

    static func key(forPath keyPath: AnyKeyPath) -> String {
        return argumentNames[typeName]?[keyPath] ?? ""
    }
}

/**
A type that can be used with a `Field` instance to indicate that the field takes no arguments.
*/
public struct NoArguments: ArgumentsList {
    public init() { }
}

/**
An object containing the information about an argument on a field.
*/
@propertyWrapper
public struct Argument<Value: SelectionInput> {
	/// The string name of the argument as it should appear in a document.
    public let name: String
    let defaultValue: Value?
    public var projectedValue: Self { self }
    private let throwawayValue: () -> Value
    
    public init(wrappedValue: Value! = nil, _ name: String, default d: Value? = nil) {
        self.name = name
        self.defaultValue = d
        self.throwawayValue = { .default }
    }

    public static subscript<OuterSelf: ArgumentsList>(
        _enclosingInstance object: OuterSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<OuterSelf, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<OuterSelf, Self>
    ) -> Value {
      get {
        OuterSelf.set(key: object[keyPath: storageKeyPath].name, forPath: wrappedKeyPath)
        return object[keyPath: storageKeyPath].throwawayValue()
      }
      set { }
    }

    @available(*, unavailable, message: "Values are not accessed on Arguments")
    public var wrappedValue: Value {
        get { fatalError() }
        set { fatalError() }
    }
    
	/**
	Renders the argument into a string that can be added to a rendered field in a document.
	*/
    func render(value: Value) -> String {
        return "\(name):\(value.render())"
    }
}
