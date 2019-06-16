import Foundation

/**
 An object that wraps values related to a wrapped type.
 
 When using GraphQL, we often don't fetch full representations of model objects - instead, we get 'partial' instances that only contain some properties. This object is
 used to be this 'partial' representation of a model object - `Partial` instances are specialized with a type to represent, and are returned as the result of a GraphQL
 query. `Partial` instances can be asked for properties related to their underlying represented type with the same property names as the represented type in a type-
 safe way using `KeyPath` objects.
 */
@dynamicMemberLookup
//@dynamicCallable
public struct Partial<T: Schema> {
    private let values: [String: Any]

    init(values: [String: Any]) {
        self.values = values
    }
    
    public subscript(dynamicMember alias: String) -> Any? {
        return self.values[alias]
    }

    public subscript<U>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> U? where U: GraphQLScalarValue {
        let keyString = T.string(for: keyPath)
        return self.values[keyString] as? U
    }
    
    public subscript<U: Sequence & GraphQLScalarValue>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> U? {
        let keyString = T.string(for: keyPath)
        return self.values[keyString] as? U
    }
    
    public subscript<U>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> (String) -> U? where U: GraphQLScalarValue {
        return { keyString in self.values[keyString] as? U }
    }

    public subscript<U: Sequence & GraphQLScalarValue>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> (String) -> U? {
        return { keyString in self.values[keyString] as? U }
    }
    
    public subscript<U: Schema>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> Partial<U>? {
        let keyString = T.string(for: keyPath)
        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
        return Partial<U>(values: valueDict)
    }
    
    public subscript<U: Sequence & Schema>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> [Partial<U.Element>]? {
        let keyString = T.string(for: keyPath)
        guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<U.Element>(values: $0) }
    }
}

// Keep around - potentially lets us do some trickery with aliases
//@dynamicMemberLookup
//struct PartialValue<T: Queryable, U> {
//    private let values: [String: Any]
//    private let keyPath: KeyPath<T.QueryableType, U>
//
//    init(keyPath: KeyPath<T.QueryableType, U>, values: [String: Any]) {
//        self.values = values
//        self.keyPath = keyPath
//    }
//
//    subscript<U>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> U? where U: GraphQLScalarValue {
//        let keyString = T.string(for: keyPath)
//        return self.values[keyString] as? U
//    }
//
//    subscript<U: Sequence & GraphQLScalarValue>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> U? {
//        let keyString = T.string(for: keyPath)
//        return self.values[keyString] as? U
//    }
//
//    subscript<U>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> (String) -> U? where U: GraphQLScalarValue {
//        return { keyString in self.values[keyString] as? U }
//    }
//
//    subscript<U: Sequence & GraphQLScalarValue>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> (String) -> U? {
//        return { keyString in self.values[keyString] as? U }
//    }
//
//    subscript<U: Queryable>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> Partial<U>? {
//        let keyString = T.string(for: keyPath)
//        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
//        return Partial<U>(values: valueDict)
//    }
//
//    subscript<U: Sequence & Queryable>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> [Partial<U.Element>]? {
//        let keyString = T.string(for: keyPath)
//        guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
//        return valuesArray.map { Partial<U.Element>(values: $0) }
//    }
//}

extension Partial: CustomStringConvertible {
    public var description: String {
        var desc = "Partial<\(String(describing: T.self).split(separator: ".").last!)>("
        let values = self.values.map { (pair) -> String in
            let (key, value) = pair
            var valueDesc: String = "nil"
            if let value = value as? CustomStringConvertible {
                valueDesc = value.description
            }
            return "\(key): \(valueDesc)"
        }.joined(separator: ", ")
        desc.append("\(values))")
        
        return desc
    }
}

public enum GraphQLError: Error {
    case malformattedResponse(reason: String)
    case singleItemParseFailure(operation: String)
    case arrayParseFailure(operation: String)
    case other(Error)
}

public protocol Schema: GraphQLCompatibleValue {
    /// The type whose keypaths can be used to construct GraphQL queries. Defaults to `Self`.
    associatedtype QueryableType: Schema = Self
    /// An enum type that is used to provide arguments to queries for this object. Defaults to `Void`.
    associatedtype Args = Void
    
    associatedtype Result = Partial<Self>
    
    static func string(for keyPath: PartialKeyPath<QueryableType>) -> String
    static func string(for argument: Args) -> String
    static func createResult(from dict: [String: Any], key: String) throws -> Result
}

public extension Schema {
    static func string(for argument: Args) -> String {
        return String(describing: argument)
            .replacingOccurrences(of: "(", with: ": ")
            .replacingOccurrences(of: ")", with: "")
    }
}
public extension Schema where Result == Partial<Self> {
    static func createResult(from dict: [String: Any], key: String) throws -> Partial<Self> {
        guard let dictRepresentation = dict[key] as? [String: Any] else { throw GraphQLError.singleItemParseFailure(operation: key) }
        return Partial(values: dictRepresentation)
    }
}

extension Array: Schema where Element: Schema {
    public typealias QueryableType = Element.QueryableType
    public typealias Args = Element.Args
    public typealias Result = [Partial<Element>]
    
    public static func string(for keyPath: PartialKeyPath<Element.QueryableType>) -> String {
        return Element.string(for: keyPath)
    }
    
    public static func string(for argument: Args) -> String {
        return Element.string(for: argument)
    }
    
    public static func createResult(from dict: [String : Any], key: String) throws -> [Partial<Element>] {
        if let value = dict[key], !(value is NSNull) {
            guard let objectsArray = value as? [[String: Any]] else { throw GraphQLError.arrayParseFailure(operation: key) }
            return objectsArray.map {
                return Partial(values: $0)
            }
        }
        return []
    }
}

extension Array: GraphQLScalarValue where Element: GraphQLScalarValue { }
extension Array: GraphQLCompatibleValue where Element: GraphQLCompatibleValue { }

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

public protocol GraphQLCompatibleValue { }

public protocol GraphQLScalarValue: GraphQLCompatibleValue { }

extension String: GraphQLScalarValue { }
extension Int: GraphQLScalarValue { }
extension Float: GraphQLScalarValue { }
extension Double: GraphQLScalarValue { }
extension Bool: GraphQLScalarValue { }
