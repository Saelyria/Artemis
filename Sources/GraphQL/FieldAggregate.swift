import Foundation

public protocol FieldAggregate: AnyFieldAggregate {
    associatedtype T: Schema
    associatedtype Result
    
    func includedKeyPaths() -> [(String, PartialKeyPath<T.QueryableType>)]
    func createResult(from: [String : Any]) throws -> Result
}
extension FieldAggregate {
    public typealias Value = Int
    public func includedKeyPaths() -> [(String, PartialKeyPath<T.QueryableType>)] {
        return []
    }
    
    func unsafeIncludedKeyPaths() -> [(String, AnyKeyPath)] {
        return self.includedKeyPaths()
    }
}

public protocol AnyFieldAggregate {
    var items: [AnyFieldAggregate] { get }
    var error: GraphQLError? { get }
    func render() -> String
    func renderDebug() -> String
}
public extension AnyFieldAggregate {
    var error: GraphQLError? {
        return self.items.compactMap { $0.error }.first
    }
    
    func render() -> String {
        return "\(self.items.map { "\($0.render())" }.joined(separator: ","))"
    }
    
    func renderDebug() -> String {
        return "\(self.items.reduce(into: "", { $0.append("\($1.render())\n") }))"
    }
    
    func unsafeIncludedKeyPaths() -> [(String, AnyKeyPath)] {
        return []
    }
}

public struct FieldAggregate1
    <T: Schema, F1: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = F1.Result
    
    public var items: [AnyFieldAggregate] { [f1] }
    let f1: F1
    
    init(_ type: T.Type, _ f1: F1) {
        self.f1 = f1
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return try f1.createResult(from: dict)
    }
}

public struct FieldAggregate2
    <T: Schema, F1: FieldAggregate, F2: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result)

    public var items: [AnyFieldAggregate] { [f1, f2] }
    let f1: F1, f2: F2
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2) {
        self.f1 = f1; self.f2 = f2
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict)
        )
    }
}

public struct FieldAggregate3
    <T: Schema, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result)

    public var items: [AnyFieldAggregate] { [f1, f2, f3] }
    let f1: F1, f2: F2, f3: F3
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3
    }

    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict)
        )
    }
}

public struct FieldAggregate4
    <T: Schema, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4] }
    let f1: F1, f2: F2, f3: F3, f4: F4
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict)
        )
    }
}

public struct FieldAggregate5
    <T: Schema, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4, f5] }
    let f1: F1, f2: F2, f3: F3, f4: F4, f5: F5
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4; self.f5 = f5
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict),
            try f5.createResult(from: dict)
        )
    }
}

public struct FieldAggregate6
    <T: Schema, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4, f5, f6] }
    let f1: F1, f2: F2, f3: F3, f4: F4, f5: F5, f6: F6
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4; self.f5 = f5; self.f6 = f6
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict),
            try f5.createResult(from: dict),
            try f6.createResult(from: dict)
        )
    }
}

public struct FieldAggregate7
    <T: Schema, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4, f5, f6, f7] }
    let f1: F1, f2: F2, f3: F3, f4: F4, f5: F5, f6: F6, f7: F7
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4; self.f5 = f5; self.f6 = f6; self.f7 = f7
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict),
            try f5.createResult(from: dict),
            try f6.createResult(from: dict),
            try f7.createResult(from: dict)
        )
    }
}
