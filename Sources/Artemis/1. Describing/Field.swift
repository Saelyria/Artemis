import Foundation

/**
 A property wrapper that marks a property on an `Object` as a GraphQL field.

 This property wrapper must be applied to properties on an `Object` for its properties to be selectable for a query.
 Failure to add this wrapper results in a runtime error. This property wrapper can only be applied to `Object` or
 `Interface` types.
*/
@propertyWrapper
public struct Field<T, Value: _SelectionOutput, ArgType: ArgumentsList> {
    /// The field's wrapped value. This will not return a real value; it is only used for triggering the caching of the
    /// field's string name.
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

    /// The wrapped value of the field. This should not be accessible.
    @available(*, unavailable, message: "Fields are available on classes conforming to Object, Interface, or Input")
    public var wrappedValue: T {
        get { fatalError("wrappedValue is unavailable") }
        // swiftlint:disable:next unused_setter_value
        set { fatalError("wrappedValue is unavailable") }
    }
    private let throwawayValue: () -> T
}

extension Field where T == (Value, ArgType.Type) {
    /**
     Instantiates a new field with the given name.
     - parameter key: The string name of the field as it will appear in GraphQL documents.
     */
    public init(_ key: String) {
        self.key = key
        self.throwawayValue = { (.default, ArgType.self) }
    }
}

extension Field where Value: _SelectionOutput, ArgType == NoArguments, T == Value {
    /**
     Instantiates a new field with the given name.
     - parameter key: The string name of the field as it will appear in GraphQL documents.
     */
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

/**
 A type that can be used with a `Field` instance to indicate that the field takes no arguments. If an argument type is
 not
*/
public struct NoArguments: ArgumentsList {
    public func encode(to encoder: Encoder) throws { }
}

internal struct Argument {
    var occurence: Int = 0
    var name: String
    var value: String
}
