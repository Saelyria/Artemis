import Foundation

/**
A protocol that identifies a type as representing a GraphQL 'object'.

'Objects' in GraphQL are any types that have selectable fields of other 'objects' or 'scalars'. This protocol is
conformed to by data types that are meant to represent the various objects of your GraphQL API.
*/
public protocol Object: SelectionOutput {
	/// The type whose keypaths can be used to construct GraphQL queries. Defaults to `Self`.
	associatedtype Schema: ObjectSchema
	associatedtype Result = Partial<Self>
}

/**
A protocol that identifies a type as representing a GraphQL 'interface'.

'Interfaces' in GraphQL are like Swift protocols that GraphQL types can declare that they implement. In Artemis, GraphQL
types declare their conformance to interfaces via their static `implements` property.
*/
public protocol Interface: Object, ObjectSchema { }

/**
A protocol that designates a type as representing a GraphQL 'enum'.
*/
public protocol Enum: Scalar, RawRepresentable where Self.RawValue == String, Self.Result == String { }

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
public struct Interfaces<I1, I2, I3, I4, I5>: AnyInterfaces {
	init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type) { }
}
public protocol AnyInterfaces {
	associatedtype I1; associatedtype I2; associatedtype I3; associatedtype I4; associatedtype I5
}

// MARK: -

public extension Interfaces where I5 == Void {
	init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type, _ i4: I4.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void {
	init(_ i1: I1.Type, _ i2: I2.Type, _ i3: I3.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void, I3 == Void {
	init(_ i1: I1.Type, _ i2: I2.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void, I3 == Void, I2 == Void {
	init(_ i1: I1.Type) { }
}
public extension Interfaces where I5 == Void, I4 == Void, I3 == Void, I2 == Void, I1 == Void {
	init() { }
}

public extension Object where Self: ObjectSchema {
	typealias Schema = Self
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
		guard R.self == Result.self else { throw GraphQLError.invalidOperation }
		guard let dictRepresentation = object as? [String: Any] else { throw GraphQLError.singleItemParseFailure(operation: key) }
		return Partial<Self>(values: dictRepresentation) as! R
	}
}

extension Array: Object where Element: Object {
	public typealias Schema = Element.Schema
}

extension Array: SelectionOutput where Element: SelectionOutput {
	public typealias Result = [Element.Result]
	public typealias Value = Self
	
	public static func createUnsafeResult<R>(from object: Any, key: String) throws -> R {
		guard R.self == Result.self else { throw GraphQLError.invalidOperation }
		guard let resultArray = object as? [Any] else { throw GraphQLError.arrayParseFailure(operation: key) }
		let mappedArray: [Element.Result] = try resultArray.map { try Element.createUnsafeResult(from: $0, key: key) }
		guard let returnedArray = mappedArray as? R else { throw GraphQLError.arrayParseFailure(operation: key) }
		return returnedArray
	}
}
extension Array: SelectionInput where Element: SelectionInput {
	public func render() -> String {
		return "[\(self.map { $0.render() }.joined(separator: ","))]"
	}
}

extension Optional: SelectionOutput where Wrapped: SelectionOutput {
	public typealias Result = Wrapped.Result
	public static func createUnsafeResult<R>(from: Any, key: String) throws -> R {
		return try Wrapped.createUnsafeResult(from: from, key: key)
	}
}
extension Optional: SelectionInput where Wrapped: SelectionInput {
	public func render() -> String {
		switch self {
		case .some(let wrapped): return wrapped.render()
		case .none: return "null"
		}
	}
}

extension Optional: Object where Wrapped: Object {
	public typealias Schema = Wrapped.Schema
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

extension Optional: Enum where Wrapped: Enum { }

//extension Optional: Queryable where Wrapped: Queryable {
//    typealias QueryableType = Wrapped.QueryableType
//    typealias Args = Wrapped.Args
//    typealias Result = Partial<Wrapped>?
//
//    static func string(for keyPath: PartialKeyPath<Wrapped.QueryableType>) -> String {
//        return Wrapped.string(for: keyPath)
//    }
//
//    static func string(for argument: Wrapped.Args) -> String {
//        return Wrapped.string(for: argument)
//    }
//
//    static func createResult(from dict: [String : Any], key: String) throws -> Partial<Wrapped>? {
//        if let value = dict[key], !(value is NSNull) {
//            guard let selfDict = value as? [String: Any] else { throw GraphQLError.singleItemParseFailure(operation: key) }
//            return Partial(values: selfDict)
//        }
//        return nil
//    }
//}
//extension Optional where Wrapped: Collection, Wrapped.Element: Queryable {
//    static func createResult(from dict: [String : Any], key: String) throws -> [Partial<Wrapped.Element>]? {
//        if let value = dict[key], !(value is NSNull) {
//            guard let objectsArray = value as? [[String: Any]] else { throw GraphQLError.arrayParseFailure(operation: key) }
//            return objectsArray.map {
//                return Partial(values: $0)
//            }
//        }
//        return nil
//    }
//}
//extension Optional: GraphQLScalarValue where Wrapped: GraphQLScalarValue { }
//extension Optional: GraphQLCompatibleValue where Wrapped: GraphQLCompatibleValue { }

