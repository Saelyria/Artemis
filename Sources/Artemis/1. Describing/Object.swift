import Foundation

/// For optimization, instantiated `Object.SubSchema` objects are stored here under the string names of their parent
/// `Object` types.
private var cachedSchemasForTypes: [TypeName: Any] = [:]
/// Since there's no way to get string names for `KeyPath` instances, we store them here after pulling them from
/// `Field` instances, under the string names of their parent `Object` types. The `AnyKeyPath`s here are paths on the
/// `Object.SubSchema`, and the `String` value returned is the string name of the keypath we can use with GraphQL.
private var keyStringsForSchemaKeyPaths: [TypeName: [AnyKeyPath: String]] = [:]

typealias TypeName = String

extension Object {
    private static var typeName: TypeName { String(describing: SubSchema.self) }

    static var schema: SubSchema {
        let schema: SubSchema
        if let s = cachedSchemasForTypes[typeName] as? SubSchema {
            schema = s
        } else {
            schema = SubSchema.init()
            cachedSchemasForTypes[typeName] = schema
        }
        return schema
    }

    static func set(key: String, forPath keyPath: AnyKeyPath) {
        if keyStringsForSchemaKeyPaths[typeName] == nil {
            keyStringsForSchemaKeyPaths[typeName] = [:]
        }
        keyStringsForSchemaKeyPaths[typeName]?[keyPath] = key
    }

    static func key(forPath keyPath: AnyKeyPath) -> String {
        return keyStringsForSchemaKeyPaths[typeName]?[keyPath] ?? ""
    }
}

/**
A protocol that identifies a type as representing a GraphQL 'object'.

'Objects' in GraphQL are any types that have selectable fields of other 'objects' or 'scalars'. This protocol is
conformed to by data types that are meant to represent the various objects of your GraphQL API.
*/
public protocol Object: SelectionOutput, ObjectSchema {
	/// The type whose keypaths can be used to construct GraphQL queries. Defaults to `Self`.
	associatedtype SubSchema: ObjectSchema = Self
	associatedtype Result = Partial<Self>
}
extension Object where SubSchema == Self {
    public static var `default`: Self {
        return self.schema
    }
}

/**
A protocol that identifies a type as representing a GraphQL 'interface'.

'Interfaces' in GraphQL are like Swift protocols that GraphQL types can declare that they implement. In Artemis, GraphQL
types declare their conformance to interfaces via their static `implements` property.
*/
public protocol Interface: Object { }

/**
A protocol that designates a type as representing a GraphQL 'enum'.
*/
public protocol Enum: Scalar, CaseIterable, RawRepresentable where Self.RawValue == String, Self.Result == String { }
extension Enum {
    public static var `default`: Self {
        return self.allCases[self.allCases.startIndex]
    }
}

/**
A protocol that designates a type as representing a GraphQL 'input object' type.
*/
public protocol Input: SelectionInput, Object { }

// MARK: -

/**
A protocol that designates a type as containing the fields for an `Object` type.

This protocol is separate from the `Object` protocol to allow existing model types to declare themselves as GraphQL
`objects`, but to specify another type as representing its 'schema' (i.e. another type that contains all the heavily-
marked-up `Field` properties). When object types are generated, they will generally conform to both of these protocols.
*/
public protocol ObjectSchema {
	associatedtype ImplementedInterfaces: AnyInterfaces = Interfaces<Void, Void, Void, Void, Void>
	
	static var implements: ImplementedInterfaces { get }

	init()
}

/**
A type used for objects to declare the interfaces that they implement.
*/
public struct Interfaces<I1, I2, I3, I4, I5>: AnyInterfaces { }
public protocol AnyInterfaces {
	associatedtype I1; associatedtype I2; associatedtype I3; associatedtype I4; associatedtype I5
}

// MARK: -
public extension Interfaces where I5: Interface, I4: Interface, I3: Interface, I2: Interface, I1: Interface {
    init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type, _ i4: I4.Type, _ i5: I5.Type) { }
}
public extension Interfaces where I5 == Void, I4: Interface, I3: Interface, I2: Interface, I1: Interface {
	init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type, _ i4: I4.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void, I3: Interface, I2: Interface, I1: Interface {
	init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void, I3 == Void, I2: Interface, I1: Interface {
	init(_ i1: I1.Type, _ i2: I2.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void, I3 == Void, I2 == Void, I1: Interface {
	init(_ i1: I1.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void, I3 == Void, I2 == Void, I1 == Void {
	init() { }
}

public extension Enum {
	func render() -> String {
		return self.rawValue
	}
}

public extension Input {
	func render() -> String {
		return ""
	}
}

public extension ObjectSchema where ImplementedInterfaces == Interfaces<Void, Void, Void, Void, Void> {
	static var implements: ImplementedInterfaces { return Interfaces() }
}

public extension Object {
	static func createUnsafeResult<R>(from object: Any, key: String) throws -> R {
		guard R.self == Result.self else {
            throw GraphQLError.invalidOperation
        }
		guard let dictRepresentation = object as? [String: Any] else { throw GraphQLError.singleItemParseFailure(operation: key) }
		return Partial<Self>(values: dictRepresentation) as! R
	}
}

