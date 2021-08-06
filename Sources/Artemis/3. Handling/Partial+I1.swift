import Foundation

// MARK: Fetching Scalar & [Scalar]

extension Partial where T: Object, T.ImplementedInterfaces.I1: Interface {
    public typealias I1 = T.ImplementedInterfaces.I1
}

extension Partial where T: Object, T.ImplementedInterfaces.I1: Interface {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> Value.Result? {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        return self.values[keyString] as? Value.Result
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>
    ) -> Value.Result? {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        return self.values[keyString] as? Value.Result
    }

    public subscript<Value: Collection & Scalar>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> Value.Result? {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        return self.values[keyString] as? Value.Result
    }

    public subscript<Value: Collection & Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>
    ) -> Value.Result? {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        return self.values[keyString] as? Value.Result
    }
}

// MARK: Fetching Enum & [Enum]

extension Partial where T: Object, T.ImplementedInterfaces.I1: Interface {
    public subscript<Value: Enum>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> Value? {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        if let raw = self.values[keyString] as? String {
            return Value.init(rawValue: raw)
        }
        return nil
    }

    public subscript<Value: Enum, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>
    ) -> Value? {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        if let raw = self.values[keyString] as? String {
            return Value.init(rawValue: raw)
        }
        return nil
    }

    public subscript<Value: Collection & Scalar>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> [Value.Element]? where Value.Element: Enum {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        if let raw = self.values[keyString] as? [String] {
            return raw.map { Value.Element.init(rawValue: $0) }.compactMap { $0 }
        }
        return nil
    }

    public subscript<Value: Collection & Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>
    ) -> [Value.Element]? where Value.Element: Enum {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        if let raw = self.values[keyString] as? [String] {
            return raw.map { Value.Element.init(rawValue: $0) }.compactMap { $0 }
        }
        return nil
    }
}

// MARK: Fetching Object & [Object]

extension Partial where T: Object, T.ImplementedInterfaces.I1: Interface {
    public subscript<Value: Object>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> Partial<Value>? {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
        return Partial<Value>(values: valueDict)
    }

    public subscript<Value: Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>
    ) -> Partial<Value>? {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
        return Partial<Value>(values: valueDict)
    }

    public subscript<Value: Collection & Object>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> [Partial<Value.Element>]? {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }

    public subscript<Value: Collection & Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>
    ) -> [Partial<Value.Element>]? {
        guard let keyString = I1.key(forPath: keyPath) else { return nil }
        guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }
}

extension Partial where T: Object, T.ImplementedInterfaces.I1: Interface {
    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Scalar>(
        _ keyPath: KeyPath<I1.SubSchema, Value>,
        alias: String
    ) -> Value.Result? {
        return self.values[alias] as? Value.Result
    }

    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Scalar, Args: ArgumentsList>(
        _ keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>,
        alias: String
    ) -> Value.Result? {
        return self.values[alias] as? Value.Result
    }

    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Collection & Scalar>(
        _ keyPath: KeyPath<I1.SubSchema, Value>,
        alias: String
    ) -> Value.Result? {
        return self.values[alias] as? Value.Result
    }

    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Collection & Scalar, Args: ArgumentsList>(
        _ keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>,
        alias: String
    ) -> Value.Result? {
        return self.values[alias] as? Value.Result
    }

    /**
     Gets the given property under the given alias.

     - parameter keyPath: The keypath of the property as it was originally named on the object.
     - parameter alias: The aliased name of the property as in the request.
     */
    public func get<Value: Object>(
        _ keyPath: KeyPath<I1.SubSchema, Value>,
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
        _ keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>,
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
        _ keyPath: KeyPath<I1.SubSchema, Value>,
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
        _ keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>,
        alias: String
    ) -> [Partial<Value.Element>]? {
        guard let valuesArray = self.values[alias] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }
}
