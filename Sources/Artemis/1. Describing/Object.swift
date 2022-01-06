import Foundation

/**
A protocol that identifies a type as representing a GraphQL 'object'.

'Objects' in GraphQL are any types that have selectable fields of other 'objects' or 'scalars'. This protocol is
conformed to by data types that are meant to represent the various objects of your GraphQL API.
*/
public protocol Object: _SelectionOutput, _AnyObject {
	/// The type whose keypaths can be used to construct GraphQL queries. Defaults to `Self`.
	associatedtype SubSchema: Object = Self
	associatedtype Result = Partial<Self>

    associatedtype ImplementedInterfaces: AnyInterfaces = Interfaces<Void, Void, Void, Void, Void>

    static var implements: ImplementedInterfaces { get }

    init()
}
// swiftlint:disable missing_docs
extension Object where SubSchema == Self {
    public static var `default`: Self {
        return self.schema
    }
}

/// For optimization, instantiated `Object.SubSchema` objects are stored here under the string names of their parent
/// `Object` types.
private var cachedSchemasForTypes: [String: Any] = [:]
/// Since there's no way to get string names for `KeyPath` instances, we store them here after pulling them from
/// `Field` instances, under the string names of their parent `Object` types. The `AnyKeyPath`s here are paths on the
/// `Object.SubSchema`, and the `String` value returned is the string name of the keypath we can use with GraphQL.
private var keyStringsForSchemaKeyPaths: [String: [AnyKeyPath: String]] = [:]

extension Object {
    public static var _schemaName: String { String(describing: SubSchema.self) }

    internal static var schema: SubSchema {
        let schema: SubSchema
        if let cachedSchema = cachedSchemasForTypes[_schemaName] as? SubSchema {
            schema = cachedSchema
        } else {
            schema = SubSchema()
            cachedSchemasForTypes[_schemaName] = schema
        }
        return schema
    }

    internal static func set(key: String, forPath keyPath: AnyKeyPath) {
        if keyStringsForSchemaKeyPaths[_schemaName] == nil {
            keyStringsForSchemaKeyPaths[_schemaName] = [:]
        }
        keyStringsForSchemaKeyPaths[_schemaName]?[keyPath] = key
    }

    internal static func key(forPath keyPath: AnyKeyPath) -> String? {
        print(keyStringsForSchemaKeyPaths)
        return keyStringsForSchemaKeyPaths[_schemaName]?[keyPath]
    }
}
// swiftlint:enable missing_docs

/**
A protocol that identifies a type as representing a GraphQL 'interface'.

'Interfaces' in GraphQL are like Swift protocols that GraphQL types can declare that they implement. In Artemis, GraphQL
types declare their conformance to interfaces via their static `implements` property.
*/
public protocol Interface: Object { }

/**
A protocol that designates a type as representing a GraphQL 'enum'.
*/
public protocol Enum: Scalar, CaseIterable, RawRepresentable, Encodable where Self.RawValue == String { }
// swiftlint:disable missing_docs
extension Enum where Result == Self {
    public static var `default`: Self {
        return self.allCases[self.allCases.startIndex]
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(_EncodedEnum(rawValue: self.rawValue))
    }

    public static func createUnsafeResult(from object: Any, key: String) throws -> Result {
        guard let raw = object as? String,
              let returnValue = Self(rawValue: raw)
        else { throw GraphQLError.singleItemParseFailure(operation: key) }
        return returnValue
    }
}
// swiftlint:enable missing_docs

internal struct _EncodedEnum: _SelectionInput, Encodable {
    internal var rawValue: String
    internal func render() -> String {
        return rawValue
    }
}

/**
A protocol that designates a type as representing a GraphQL 'input object' type.
*/
public protocol Input: _SelectionInput, Encodable { }

// MARK: -

/// An internal superprotocol for `Object` that allows referencing the schema name as a string.
public protocol _AnyObject {
    /// A string name for the `SubSchema` of this `Object`.
    static var _schemaName: String { get }
}

/**
A type used for objects to declare the interfaces that they implement.
*/
public struct Interfaces<I1, I2, I3, I4, I5>: AnyInterfaces { }

/**
 A type used to declare that an object conforms to no interfaces.
*/
public protocol AnyInterfaces {
    // swiftlint:disable missing_docs
	associatedtype I1; associatedtype I2; associatedtype I3; associatedtype I4; associatedtype I5
}

// MARK: -
extension Interfaces where I5: Interface, I4: Interface, I3: Interface, I2: Interface, I1: Interface {
    public init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type, _ i4: I4.Type, _ i5: I5.Type) { }
}
extension Interfaces where I5 == Void, I4: Interface, I3: Interface, I2: Interface, I1: Interface {
    public init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type, _ i4: I4.Type) { }
}
extension Interfaces where I5 == Void, I4 == Void, I3: Interface, I2: Interface, I1: Interface {
    public init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type) { }
}
extension Interfaces where I5 == Void, I4 == Void, I3 == Void, I2: Interface, I1: Interface {
    public init(_ i1: I1.Type, _ i2: I2.Type) { }
}
extension Interfaces where I5 == Void, I4 == Void, I3 == Void, I2 == Void, I1: Interface {
    public init(_ i1: I1.Type) { }
}
extension Interfaces where I5 == Void, I4 == Void, I3 == Void, I2 == Void, I1 == Void {
	public init() { }
}

extension Enum {
    func render() -> String {
		return self.rawValue
	}
}

extension Input {
    func render() -> String {
		return ""
	}
}

extension Object where ImplementedInterfaces == Interfaces<Void, Void, Void, Void, Void> {
	public static var implements: ImplementedInterfaces { return Interfaces() }
}
// swiftlint:enable missing_docs

extension Object {
    static func createUnsafeResult(from object: Any, key: String) throws -> Result {
		guard let dictRepresentation = object as? [String: Any],
              let result = Partial<Self>(values: dictRepresentation) as? Result
        else { throw GraphQLError.singleItemParseFailure(operation: key) }
		return result
	}
}
