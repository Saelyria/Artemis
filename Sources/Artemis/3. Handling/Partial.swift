import Foundation

/**
 An object that wraps values related to a wrapped type.

 When using GraphQL, we often don't fetch full representations of model objects - instead, we get 'partial' instances
 that only contain some properties. This object is used to be this 'partial' representation of a model object -
 `Partial` instances are specialized with a type to represent, and are returned as the result of a GraphQL operation.

 `Partial` instances can be queried for properties related to their underlying represented type with the same property
 names as the represented type in a type-safe way using `KeyPath` objects.
 */
@dynamicMemberLookup
public struct Partial<T: _SelectionOutput> {
    /// A callable object that retrieves a value under an alias.
    public struct Getter<Value> {
        var lookup: (String) -> Any?
    }

    let values: [String: Any]
}

extension Partial.Getter where Value: Scalar {
    /**
     Gets the value for the field that was requested under an alias.
     - parameter alias: The alias the field was requested under.
     */
    public func callAsFunction(alias: String) -> Value.Result? {
        return try? Value.createUnsafeResult(from: lookup(alias) as Any, key: "")
    }
}

extension Partial.Getter where Value: Object {
    /**
     Gets the value for the field that was requested under an alias.
     - parameter alias: The alias the field was requested under.
     */
    public func callAsFunction(alias: String) -> Partial<Value>? {
        let valueDict = lookup(alias) as? [String: Any]
        return valueDict.map { Partial<Value>(values: $0) }
    }
}

// swiftlint:disable discouraged_optional_collection
extension Partial.Getter where Value: Object & Collection, Value.Element: _SelectionOutput {
    /**
     Gets the value for the field that was requested under an alias.
     - parameter alias: The alias the field was requested under.
     */
    public func callAsFunction(alias: String) -> [Partial<Value.Element>]? {
        let valuesArray = lookup(alias) as? [[String: Any]] ?? []
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }
}
// swiftlint:enable discouraged_optional_collection

// MARK: Fetching Scalar & [Scalar]

// swiftlint:disable discouraged_optional_collection missing_docs
extension Partial where T: Object {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> Value.Result? {
        return try? T.key(forPath: keyPath)
            .map { self.values[$0] as Any }
            .map { try Value.createUnsafeResult(from: $0, key: "") }
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>
    ) -> Value.Result? {
        return try? T.key(forPath: keyPath)
            .map { self.values[$0] as Any }
            .map { try Value.createUnsafeResult(from: $0, key: "") }
    }
}

// MARK: Fetching Object & [Object]

extension Partial where T: Object {
    public subscript<Value: Object>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> Partial<Value>? {
        return T.key(forPath: keyPath)
            .map { self.values[$0] as? [String: Any] ?? [:] }
            .map { Partial<Value>(values: $0) }
    }

    public subscript<Value: Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>
    ) -> Partial<Value>? {
        return T.key(forPath: keyPath)
            .map { self.values[$0] as? [String: Any] ?? [:] }
            .map { Partial<Value>(values: $0) }
    }

    public subscript<Value: Collection & Object>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> [Partial<Value.Element>]? {
        return T.key(forPath: keyPath)
            .map { self.values[$0] as? [[String: Any]] ?? [] }
            .map { $0.map { Partial<Value.Element>(values: $0) } }
    }

    public subscript<Value: Collection & Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>
    ) -> [Partial<Value.Element>]? {
        return T.key(forPath: keyPath)
            .map { self.values[$0] as? [[String: Any]] ?? [] }
            .map { $0.map { Partial<Value.Element>(values: $0) } }
    }
}

// MARK: Fetching with an alias

extension Partial where T: Object {
    public subscript<Value>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> Getter<Value> {
        return Getter(lookup: { self.values[$0] })
    }

    public subscript<Value, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>
    ) -> Getter<Value> {
        return Getter(lookup: { self.values[$0] })
    }
}
// swiftlint:enable discouraged_optional_collection missing_docs

extension Partial: CustomStringConvertible {
    public var description: String {
        var desc = "Partial<\(String(describing: T.self).split(separator: ".").last ?? "")>("
        let values = self.values
            .map { pair -> String in
                let (key, value) = pair
                var valueDesc: String = "nil"
                if let value = value as? CustomStringConvertible {
                    valueDesc = value.description
                }
                return "\(key): \(valueDesc)"
            }
            .joined(separator: ", ")
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
    case invalidRequest(reasons: [String])
    case other(Error)
}
