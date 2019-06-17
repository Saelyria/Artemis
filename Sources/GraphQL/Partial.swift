import Foundation

/**
 An object that wraps values related to a wrapped type.
 
 When using GraphQL, we often don't fetch full representations of model objects - instead, we get 'partial' instances that only contain some properties. This object is
 used to be this 'partial' representation of a model object - `Partial` instances are specialized with a type to represent, and are returned as the result of a GraphQL
 query. `Partial` instances can be asked for properties related to their underlying represented type with the same property names as the represented type in a type-
 safe way using `KeyPath` objects.
 */
@dynamicMemberLookup
public struct Partial<T: GraphQLCompatibleValue> {
    private let values: [String: Any]
    
    init(values: [String: Any]) {
        self.values = values
    }
    
//    public subscript(dynamicMember alias: String) -> Any? {
//        return self.values[alias]
//    }
}

public extension Partial where T: Schema {
    subscript<F: AnyField>(dynamicMember keyPath: KeyPath<T.QueryableType, F>) -> F.Value? where F.Value: GraphQLScalarValue {
        let keyString = T.QueryableType()[keyPath: keyPath].key
        return self.values[keyString] as? F.Value
    }
    
    subscript<F: AnyField>(dynamicMember keyPath: KeyPath<T.QueryableType, F>) -> F.Value? where F.Value: Collection & GraphQLScalarValue {
        let keyString = T.QueryableType()[keyPath: keyPath].key
        return self.values[keyString] as? F.Value
    }
    
    subscript<F: AnyField>(dynamicMember keyPath: KeyPath<T.QueryableType, F>) -> Partial<F.Value>? where F.Value: Schema {
        let keyString = T.QueryableType()[keyPath: keyPath].key
        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
        return Partial<F.Value>(values: valueDict)
    }

    subscript<F: AnyField>(dynamicMember keyPath: KeyPath<T.QueryableType, F>) -> [Partial<F.Value.Element>]? where F.Value: Collection & Schema {
        let keyString = T.QueryableType()[keyPath: keyPath].key
        guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<F.Value.Element>(values: $0) }
    }
}

//
//public extension Partial where T: Schema {
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
//    subscript<U: Schema>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> Partial<U>? {
//        let keyString = T.string(for: keyPath)
//        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
//        return Partial<U>(values: valueDict)
//    }
//
//    subscript<U: Sequence & Schema>(dynamicMember keyPath: KeyPath<T.QueryableType, U>) -> [Partial<U.Element>]? {
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
    case invalidOperation
    case malformattedResponse(reason: String)
    case singleItemParseFailure(operation: String)
    case arrayParseFailure(operation: String)
    /// The type of the associated value of an argument enum case wasn't convertible to a string.
    case argumentValueNotConvertible
    case other(Error)
}
