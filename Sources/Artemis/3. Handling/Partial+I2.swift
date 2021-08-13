import Foundation

// swiftlint:disable discouraged_optional_collection missing_docs
extension Partial where T: Object, T.ImplementedInterfaces.I2: Interface {
    public typealias I2 = T.ImplementedInterfaces.I2
}

// MARK: Fetching Scalar & [Scalar]

extension Partial where T: Object, T.ImplementedInterfaces.I2: Interface {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, Value>
    ) -> Value.Result? {
        return try? I2.key(forPath: keyPath)
            .map { self.values[$0] as Any }
            .map { try Value.createUnsafeResult(from: $0, key: "") }
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, (Value, Args.Type)>
    ) -> Value.Result? {
        return try? I2.key(forPath: keyPath)
            .map { self.values[$0] as Any }
            .map { try Value.createUnsafeResult(from: $0, key: "") }
    }
}

// MARK: Fetching Object & [Object]

extension Partial where T: Object, T.ImplementedInterfaces.I2: Interface {
    public subscript<Value: Object>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, Value>
    ) -> Partial<Value>? {
        return I2.key(forPath: keyPath)
            .map { self.values[$0] as? [String: Any] ?? [:] }
            .map { Partial<Value>(values: $0) }
    }

    public subscript<Value: Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, (Value, Args.Type)>
    ) -> Partial<Value>? {
        return I2.key(forPath: keyPath)
            .map { self.values[$0] as? [String: Any] ?? [:] }
            .map { Partial<Value>(values: $0) }
    }

    public subscript<Value: Collection & Object>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, Value>
    ) -> [Partial<Value.Element>]? {
        return I2.key(forPath: keyPath)
            .map { self.values[$0] as? [[String: Any]] ?? [] }
            .map { $0.map { Partial<Value.Element>(values: $0) } }
    }

    public subscript<Value: Collection & Object, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, (Value, Args.Type)>
    ) -> [Partial<Value.Element>]? {
        return I2.key(forPath: keyPath)
            .map { self.values[$0] as? [[String: Any]] ?? [] }
            .map { $0.map { Partial<Value.Element>(values: $0) } }
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
// swiftlint:enable discouraged_optional_collection missing_docs
