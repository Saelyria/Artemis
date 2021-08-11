import Foundation

/**
 An object that wraps values related to a wrapped type.

 When using GraphQL, we often don't fetch full representations of model objects - instead, we get 'partial' instances
 that only contain some properties. This object is used to be this 'partial' representation of a model object - `Partial`
 instances are specialized with a type to represent, and are returned as the result of a GraphQL operation.

 `Partial` instances can be queried for properties related to their underlying represented type with the same property
 names as the represented type in a type-safe way using `KeyPath` objects.
 */
@dynamicMemberLookup
public struct Partial<T: _SelectionOutput> {
    let values: [String: Any]
}

// MARK: Fetching Scalar & [Scalar]

extension Partial where T: Object {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> Value.Result? {
        guard let keyString = T.key(forPath: keyPath) else { return nil }
        return try? Value.createUnsafeResult(from: self.values[keyString] as Any, key: "")
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>
    ) -> Value.Result? {
        guard let keyString = T.key(forPath: keyPath) else { return nil }
        return try? Value.createUnsafeResult(from: self.values[keyString] as Any, key: "")
    }

    public subscript<Value: Collection & Scalar>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> Value.Result? {
        guard let keyString = T.key(forPath: keyPath) else { return nil }
        return try? Value.createUnsafeResult(from: self.values[keyString] as Any, key: "")
    }

    public subscript<Value: Collection & Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>
    ) -> Value.Result? {
        guard let keyString = T.key(forPath: keyPath) else { return nil }
        return try? Value.createUnsafeResult(from: self.values[keyString] as Any, key: "")
    }
}

// MARK: Fetching Object & [Object]

extension Partial where T: Object {
    public subscript<Value: Object>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> Partial<Value>? {
        guard let keyString = T.key(forPath: keyPath) else { return nil }
        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
        return Partial<Value>(values: valueDict)
    }

    public subscript<Value: Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>
    ) -> Partial<Value>? {
        guard let keyString = T.key(forPath: keyPath) else { return nil }
        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
        return Partial<Value>(values: valueDict)
    }

    public subscript<Value: Collection & Object>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> [Partial<Value.Element>]? {
        guard let keyString = T.key(forPath: keyPath) else { return nil }
        guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }

    public subscript<Value: Collection & Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>
    ) -> [Partial<Value.Element>]? {
        guard let keyString = T.key(forPath: keyPath) else { return nil }
        guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }
}

extension Partial where T: Object {
    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Scalar>(
        _ keyPath: KeyPath<T.SubSchema, Value>,
        alias: String
    ) -> Value.Result? {
        return try? Value.createUnsafeResult(from: self.values[alias] as Any, key: "")
    }

    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Scalar, Args: ArgumentsList>(
        _ keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>,
        alias: String
    ) -> Value.Result? {
        return try? Value.createUnsafeResult(from: self.values[alias] as Any, key: "")
    }

    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Collection & Scalar>(
        _ keyPath: KeyPath<T.SubSchema, Value>,
        alias: String
    ) -> Value.Result? {
        return try? Value.createUnsafeResult(from: self.values[alias] as Any, key: "")
    }

    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Collection & Scalar, Args: ArgumentsList>(
        _ keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>,
        alias: String
    ) -> Value.Result? {
        return try? Value.createUnsafeResult(from: self.values[alias] as Any, key: "")
    }

    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Object>(
        _ keyPath: KeyPath<T.SubSchema, Value>,
        alias: String
    ) -> Partial<Value>? {
        guard let valueDict = self.values[alias] as? [String: Any] else { return nil }
        return Partial<Value>(values: valueDict)
    }

    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Object, Args: ArgumentsList>(
        _ keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>,
        alias: String
    ) -> Partial<Value>? {
        guard let valueDict = self.values[alias] as? [String: Any] else { return nil }
        return Partial<Value>(values: valueDict)
    }

    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Collection & Object>(
        _ keyPath: KeyPath<T.SubSchema, Value>,
        alias: String
    ) -> [Partial<Value.Element>]? {
        guard let valuesArray = self.values[alias] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }

    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Collection & Object, Args: ArgumentsList>(
        _ keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>,
        alias: String
    ) -> [Partial<Value.Element>]? {
        guard let valuesArray = self.values[alias] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }
}

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
    case invalidRequest(reasons: [String])
    case other(Error)
}
