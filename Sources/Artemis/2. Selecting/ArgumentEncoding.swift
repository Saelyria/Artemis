import Foundation

class ArgumentEncoder {
    func encode<T: Encodable>(_ value: T) throws -> String {
        let encoder = ArgumentEncoding(data: .init(), codingPath: [])
        try value.encode(to: encoder)
        guard let (_, parsedValue) = encoder.data.values.first(where: { key, _ in key == "root" }) else { return "" }
        return parsedValue.rendered(isRoot: true)
    }
    
    func encode<T: Encodable>(_ value: T) throws -> [Argument] {
        let encoder = ArgumentEncoding(data: .init(), codingPath: [])
        try value.encode(to: encoder)
        guard let (_, parsedValue) = encoder.data.values.first(where: { key, _ in key == "root" }) else { return [] }
        switch parsedValue {
        case .value, .array: return []
        case .object(let object):
            let args: [Argument] = object
                .map { $0 as? (String, DataType) }
                .compactMap { $0 }
                .map { Argument(name: $0.0, value: $0.1.rendered(isRoot: false)) }
            return args
        }
    }
}

private enum DataType {
    case value(_SelectionInput)
    case array(NSMutableArray)
    case object(NSMutableArray)

    func rendered(isRoot: Bool) -> String {
        switch self {
        case .value(let value):
            return isRoot ? "(\(value.render())" : value.render()
        case .array(let array):
            let values = array
                .map { $0 as? DataType }
                .compactMap { $0 }
                .map { $0.rendered(isRoot: false) }
                .joined(separator: ",")
            return isRoot ? "([\(values)])" : "[\(values)]"
        case .object(let object):
            let values = object
                .map { $0 as? (String, DataType) }
                .compactMap { $0 }
                .map { "\($0):\($1.rendered(isRoot: false))" }
                .joined(separator: ",")
            return isRoot ? "(\(values))" : "{\(values)}"
        }
    }
}

private struct ArgumentEncoding: Encoder {
    final class Data {
        private(set) var values: [(String, DataType)] = []

        func add(_ dataType: DataType, codingPath: [CodingKey]) {
            let key = codingPath.last?.stringValue ?? "root"
            self.values.append((key, dataType))
        }
    }

    var data: Data
    var codingPath: [CodingKey]
    var userInfo: [CodingUserInfoKey: Any] = [:]

    func container<Key: CodingKey>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> {
        let dict = NSMutableArray()
        data.add(.object(dict), codingPath: codingPath)
        let container = ArgumentKeyedEncoding<Key>(data: data, dict: dict, codingPath: codingPath)
        return KeyedEncodingContainer(container)
    }

    func unkeyedContainer() -> UnkeyedEncodingContainer {
        let array = NSMutableArray()
        data.add(.array(array), codingPath: codingPath)
        return ArgumentUnkeyedEncoding(data: data, array: array, codingPath: codingPath)
    }

    func singleValueContainer() -> SingleValueEncodingContainer {
        return self
    }
}

private struct ArgumentKeyedEncoding<Key: CodingKey>: KeyedEncodingContainerProtocol {
    let data: ArgumentEncoding.Data
    let dict: NSMutableArray
    var codingPath: [CodingKey]

    mutating func encodeNil(forKey key: Key) throws {
        dict.add((key.stringValue, DataType.value("nil")))
    }
    mutating func encode(_ value: Bool, forKey key: Key) throws {
        dict.add((key.stringValue, DataType.value(value)))
    }
    mutating func encode(_ value: String, forKey key: Key) throws {
        dict.add((key.stringValue, DataType.value(value)))
    }
    mutating func encode(_ value: Double, forKey key: Key) throws {
        dict.add((key.stringValue, DataType.value(value)))
    }
    mutating func encode(_ value: Float, forKey key: Key) throws {
        dict.add((key.stringValue, DataType.value(value)))
    }
    mutating func encode(_ value: Int, forKey key: Key) throws {
        dict.add((key.stringValue, DataType.value(value)))
    }
    mutating func encode(_ value: Int8, forKey key: Key) throws { }
    mutating func encode(_ value: Int16, forKey key: Key) throws { }
    mutating func encode(_ value: Int32, forKey key: Key) throws { }
    mutating func encode(_ value: Int64, forKey key: Key) throws { }
    mutating func encode(_ value: UInt, forKey key: Key) throws { }
    mutating func encode(_ value: UInt8, forKey key: Key) throws { }
    mutating func encode(_ value: UInt16, forKey key: Key) throws { }
    mutating func encode(_ value: UInt32, forKey key: Key) throws { }
    mutating func encode(_ value: UInt64, forKey key: Key) throws { }

    mutating func encode<T: Encodable>(_ value: T, forKey key: Key) throws {
        let encoder = ArgumentEncoding(data: .init(), codingPath: [key])
        try value.encode(to: encoder)
        encoder.data.values.forEach { dict.add(($0, $1)) }
    }

    mutating func nestedContainer<NestedKey: CodingKey>(
        keyedBy keyType: NestedKey.Type,
        forKey key: Key
    ) -> KeyedEncodingContainer<NestedKey> {
        let dict = NSMutableArray()
        self.dict.add((key.stringValue, dict))
        let container = ArgumentKeyedEncoding<NestedKey>(data: data, dict: dict, codingPath: codingPath + [key])
        return KeyedEncodingContainer(container)
    }

    mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        let array = NSMutableArray()
        self.dict.add((key.stringValue, dict))
        return ArgumentUnkeyedEncoding(data: data, array: array, codingPath: codingPath + [key])
    }

    mutating func superEncoder() -> Encoder {
        let superKey = Key(stringValue: "super")!
        return superEncoder(forKey: superKey)
    }

    mutating func superEncoder(forKey key: Key) -> Encoder {
        return ArgumentEncoding(data: data, codingPath: codingPath + [key])
    }
}

private struct ArgumentUnkeyedEncoding: UnkeyedEncodingContainer {
    let data: ArgumentEncoding.Data
    var array: NSMutableArray
    let codingPath: [CodingKey]

    var count: Int {
        array.count
    }

    mutating func encodeNil() throws {
        array.add(DataType.value("nil"))
    }
    mutating func encode(_ value: Bool) throws {
        array.add(DataType.value(value))
    }
    mutating func encode(_ value: String) throws {
        array.add(DataType.value(value))
    }
    mutating func encode(_ value: Double) throws {
        array.add(DataType.value(value))
    }
    mutating func encode(_ value: Float) throws {
        array.add(DataType.value(value))
    }
    mutating func encode(_ value: Int) throws {
        array.add(DataType.value(value))
    }
    mutating func encode(_ value: Int8) throws { }
    mutating func encode(_ value: Int16) throws { }
    mutating func encode(_ value: Int32) throws { }
    mutating func encode(_ value: Int64) throws { }
    mutating func encode(_ value: UInt) throws { }
    mutating func encode(_ value: UInt8) throws { }
    mutating func encode(_ value: UInt16) throws { }
    mutating func encode(_ value: UInt32) throws { }
    mutating func encode(_ value: UInt64) throws { }

    mutating func encode<T: Encodable>(_ value: T) throws {
        let encoder = ArgumentEncoding(data: .init(), codingPath: codingPath)
        try value.encode(to: encoder)
        encoder.data.values.forEach { self.array.add($1) }
    }

    mutating func nestedContainer<NestedKey: CodingKey>(
        keyedBy keyType: NestedKey.Type
    ) -> KeyedEncodingContainer<NestedKey> {
        let dict = NSMutableArray()
        array.add(dict)
        let container = ArgumentKeyedEncoding<NestedKey>(data: data, dict: dict, codingPath: codingPath)
        return KeyedEncodingContainer(container)
    }

    mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        let subarray = NSMutableArray()
        array.add(subarray)
        return ArgumentUnkeyedEncoding(data: data, array: subarray, codingPath: codingPath)
    }

    mutating func superEncoder() -> Encoder {
        return ArgumentEncoding(data: data, codingPath: codingPath)
    }
}

extension ArgumentEncoding: SingleValueEncodingContainer {
    mutating func encodeNil() throws {
        data.add(.value("nil"), codingPath: codingPath)
    }
    mutating func encode(_ value: Bool) throws {
        data.add(.value(value), codingPath: codingPath)
    }
    mutating func encode(_ value: String) throws {
        data.add(.value(value), codingPath: codingPath)
    }
    mutating func encode(_ value: Double) throws {
        data.add(.value(value), codingPath: codingPath)
    }
    mutating func encode(_ value: Float) throws {
        data.add(.value(value), codingPath: codingPath)
    }
    mutating func encode(_ value: Int) throws {
        data.add(.value(value), codingPath: codingPath)
    }
    mutating func encode(_ value: Int8) throws { }
    mutating func encode(_ value: Int16) throws { }
    mutating func encode(_ value: Int32) throws { }
    mutating func encode(_ value: Int64) throws { }
    mutating func encode(_ value: UInt) throws { }
    mutating func encode(_ value: UInt8) throws { }
    mutating func encode(_ value: UInt16) throws { }
    mutating func encode(_ value: UInt32) throws { }
    mutating func encode(_ value: UInt64) throws { }

    mutating func encode<T: Encodable>(_ value: T) throws {
        // Enums are sent through with the `EncodedEnum` wrapper instead of their String value so that "" isn't added
        if let encodedEnum = value as? _EncodedEnum {
            data.add(.value(encodedEnum), codingPath: codingPath)
            return
        }
        let encoder = ArgumentEncoding(data: data, codingPath: codingPath)
        try value.encode(to: encoder)
    }
}
