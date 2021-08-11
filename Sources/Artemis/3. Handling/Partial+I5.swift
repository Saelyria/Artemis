import Foundation

extension Partial where T: Object, T.ImplementedInterfaces.I5: Interface {
    public typealias I5 = T.ImplementedInterfaces.I5
}

// MARK: Fetching Scalar & [Scalar]

extension Partial where T: Object, T.ImplementedInterfaces.I5: Interface {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, Value>
    ) -> Value.Result? {
        guard let keyString = I5.key(forPath: keyPath) else { return nil }
        return try? Value.createUnsafeResult(from: self.values[keyString] as Any, key: "")
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, (Value, Args.Type)>
    ) -> Value.Result? {
        guard let keyString = I5.key(forPath: keyPath) else { return nil }
        return try? Value.createUnsafeResult(from: self.values[keyString] as Any, key: "")
    }

    public subscript<Value: Collection & Scalar>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, Value>
    ) -> Value.Result? {
        guard let keyString = I5.key(forPath: keyPath) else { return nil }
        return try? Value.createUnsafeResult(from: self.values[keyString] as Any, key: "")
    }

    public subscript<Value: Collection & Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, (Value, Args.Type)>
    ) -> Value.Result? {
        guard let keyString = I5.key(forPath: keyPath) else { return nil }
        return try? Value.createUnsafeResult(from: self.values[keyString] as Any, key: "")
    }
}

// MARK: Fetching Object & [Object]

extension Partial where T: Object, T.ImplementedInterfaces.I5: Interface {
    public subscript<Value: Object>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, Value>
    ) -> Partial<Value>? {
        guard let keyString = I5.key(forPath: keyPath) else { return nil }
        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
        return Partial<Value>(values: valueDict)
    }

    public subscript<Value: Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, (Value, Args.Type)>
    ) -> Partial<Value>? {
        guard let keyString = I5.key(forPath: keyPath) else { return nil }
        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
        return Partial<Value>(values: valueDict)
    }

    public subscript<Value: Collection & Object>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, Value>
    ) -> [Partial<Value.Element>]? {
        guard let keyString = I5.key(forPath: keyPath) else { return nil }
        guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }

    public subscript<Value: Collection & Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, (Value, Args.Type)>
    ) -> [Partial<Value.Element>]? {
        guard let keyString = I5.key(forPath: keyPath) else { return nil }
        guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }
}

extension Partial where T: Object, T.ImplementedInterfaces.I5: Interface {
    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Scalar>(
        _ keyPath: KeyPath<I5.SubSchema, Value>,
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
        _ keyPath: KeyPath<I5.SubSchema, (Value, Args.Type)>,
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
        _ keyPath: KeyPath<I5.SubSchema, Value>,
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
        _ keyPath: KeyPath<I5.SubSchema, (Value, Args.Type)>,
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
        _ keyPath: KeyPath<I5.SubSchema, Value>,
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
        _ keyPath: KeyPath<I5.SubSchema, (Value, Args.Type)>,
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
        _ keyPath: KeyPath<I5.SubSchema, Value>,
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
        _ keyPath: KeyPath<I5.SubSchema, (Value, Args.Type)>,
        alias: String
    ) -> [Partial<Value.Element>]? {
        guard let valuesArray = self.values[alias] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }
}
