import Foundation

extension Partial where T: Object, T.ImplementedInterfaces.I2: Interface {
    public typealias I2 = T.ImplementedInterfaces.I2
}

// MARK: Fetching Scalar & [Scalar]

extension Partial where T: Object, T.ImplementedInterfaces.I2: Interface {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, Value>
    ) -> Value.Result? {
        guard let keyString = I2.key(forPath: keyPath) else { return nil }
        return try? Value.createUnsafeResult(from: self.values[keyString] as Any, key: "")
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, (Value, Args.Type)>
    ) -> Value.Result? {
        guard let keyString = I2.key(forPath: keyPath) else { return nil }
        return try? Value.createUnsafeResult(from: self.values[keyString] as Any, key: "")
    }
}

// MARK: Fetching Object & [Object]

extension Partial where T: Object, T.ImplementedInterfaces.I2: Interface {
    public subscript<Value: Object>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, Value>
    ) -> Partial<Value>? {
        guard let keyString = I2.key(forPath: keyPath) else { return nil }
        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
        return Partial<Value>(values: valueDict)
    }

    public subscript<Value: Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, (Value, Args.Type)>
    ) -> Partial<Value>? {
        guard let keyString = I2.key(forPath: keyPath) else { return nil }
        guard let valueDict = self.values[keyString] as? [String: Any] else { return nil }
        return Partial<Value>(values: valueDict)
    }

    public subscript<Value: Collection & Object>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, Value>
    ) -> [Partial<Value.Element>]? {
        guard let keyString = I2.key(forPath: keyPath) else { return nil }
        guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }

    public subscript<Value: Collection & Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, (Value, Args.Type)>
    ) -> [Partial<Value.Element>]? {
        guard let keyString = I2.key(forPath: keyPath) else { return nil }
        guard let valuesArray = self.values[keyString] as? [[String: Any]] else { return nil }
        return valuesArray.map { Partial<Value.Element>(values: $0) }
    }
}

// MARK: Fetching with an alias

extension Partial where T: Object, T.ImplementedInterfaces.I2: Interface {
    public subscript<Value>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, Value>
    ) -> Getter<Value> {
        return Getter(lookup: { self.values[$0] })
    }

    public subscript<Value, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, (Value, Args.Type)>
    ) -> Getter<Value> {
        return Getter(lookup: { self.values[$0] })
    }
}
