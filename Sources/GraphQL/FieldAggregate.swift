import Foundation

public protocol FieldAggregate: AnyFieldAggregate {
    associatedtype T: Object
    associatedtype Result
    
    func createResult(from: [String : Any]) throws -> Result
}
extension FieldAggregate {
    public typealias Value = Int
}

public protocol AnyFieldAggregate {
    var items: [AnyFieldAggregate] { get }
    var error: GraphQLError? { get }
    func render() -> String
}
public extension AnyFieldAggregate {
    var error: GraphQLError? {
        return self.items.compactMap { $0.error }.first
    }
    
    func render() -> String {
        return "\(self.items.map { "\($0.render())" }.joined(separator: ","))"
    }
}

public struct FieldAggregate1
    <T: Object, F1: FieldAggregate>
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
    <T: Object, F1: FieldAggregate, F2: FieldAggregate>
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
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate>
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
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate>
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
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate>
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
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate>
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
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate>
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

public struct FieldAggregate8
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4, f5, f6, f7, f8] }
    let f1: F1, f2: F2, f3: F3, f4: F4, f5: F5, f6: F6, f7: F7, f8: F8
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4; self.f5 = f5; self.f6 = f6; self.f7 = f7; self.f8 = f8
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict),
            try f5.createResult(from: dict),
            try f6.createResult(from: dict),
            try f7.createResult(from: dict),
            try f8.createResult(from: dict)
        )
    }
}

public struct FieldAggregate9
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4, f5, f6, f7, f8, f9] }
    let f1: F1, f2: F2, f3: F3, f4: F4, f5: F5, f6: F6, f7: F7, f8: F8, f9: F9
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4; self.f5 = f5; self.f6 = f6; self.f7 = f7; self.f8 = f8; self.f9 = f9
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict),
            try f5.createResult(from: dict),
            try f6.createResult(from: dict),
            try f7.createResult(from: dict),
            try f8.createResult(from: dict),
            try f9.createResult(from: dict)
        )
    }
}

public struct FieldAggregate10
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10] }
    let f1: F1, f2: F2, f3: F3, f4: F4, f5: F5, f6: F6, f7: F7, f8: F8, f9: F9, f10: F10
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4; self.f5 = f5; self.f6 = f6; self.f7 = f7; self.f8 = f8; self.f9 = f9; self.f10 = f10
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict),
            try f5.createResult(from: dict),
            try f6.createResult(from: dict),
            try f7.createResult(from: dict),
            try f8.createResult(from: dict),
            try f9.createResult(from: dict),
            try f10.createResult(from: dict)
        )
    }
}

public struct FieldAggregate11
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate, F11: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result, F11.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11] }
    let f1: F1, f2: F2, f3: F3, f4: F4, f5: F5, f6: F6, f7: F7, f8: F8, f9: F9, f10: F10, f11: F11
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4; self.f5 = f5; self.f6 = f6; self.f7 = f7; self.f8 = f8; self.f9 = f9; self.f10 = f10; self.f11 = f11
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict),
            try f5.createResult(from: dict),
            try f6.createResult(from: dict),
            try f7.createResult(from: dict),
            try f8.createResult(from: dict),
            try f9.createResult(from: dict),
            try f10.createResult(from: dict),
            try f11.createResult(from: dict)
        )
    }
}

public struct FieldAggregate12
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate, F11: FieldAggregate, F12: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result, F11.Result, F12.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12] }
    let f1: F1, f2: F2, f3: F3, f4: F4, f5: F5, f6: F6, f7: F7, f8: F8, f9: F9, f10: F10, f11: F11, f12: F12
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4; self.f5 = f5; self.f6 = f6; self.f7 = f7; self.f8 = f8; self.f9 = f9; self.f10 = f10; self.f11 = f11; self.f12 = f12
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict),
            try f5.createResult(from: dict),
            try f6.createResult(from: dict),
            try f7.createResult(from: dict),
            try f8.createResult(from: dict),
            try f9.createResult(from: dict),
            try f10.createResult(from: dict),
            try f11.createResult(from: dict),
            try f12.createResult(from: dict)
        )
    }
}

public struct FieldAggregate13
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate, F11: FieldAggregate, F12: FieldAggregate, F13: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result, F11.Result, F12.Result, F13.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13] }
    let f1: F1, f2: F2, f3: F3, f4: F4, f5: F5, f6: F6, f7: F7, f8: F8, f9: F9, f10: F10, f11: F11, f12: F12, f13: F13
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12, _ f13: F13) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4; self.f5 = f5; self.f6 = f6; self.f7 = f7; self.f8 = f8; self.f9 = f9; self.f10 = f10; self.f11 = f11; self.f12 = f12; self.f13 = f13
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict),
            try f5.createResult(from: dict),
            try f6.createResult(from: dict),
            try f7.createResult(from: dict),
            try f8.createResult(from: dict),
            try f9.createResult(from: dict),
            try f10.createResult(from: dict),
            try f11.createResult(from: dict),
            try f12.createResult(from: dict),
            try f13.createResult(from: dict)
        )
    }
}

public struct FieldAggregate14
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate, F11: FieldAggregate, F12: FieldAggregate, F13: FieldAggregate, F14: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result, F11.Result, F12.Result, F13.Result, F14.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14] }
    let f1: F1, f2: F2, f3: F3, f4: F4, f5: F5, f6: F6, f7: F7, f8: F8, f9: F9, f10: F10, f11: F11, f12: F12, f13: F13, f14: F14
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12, _ f13: F13, _ f14: F14) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4; self.f5 = f5; self.f6 = f6; self.f7 = f7; self.f8 = f8; self.f9 = f9; self.f10 = f10; self.f11 = f11; self.f12 = f12; self.f13 = f13; self.f14 = f14
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict),
            try f5.createResult(from: dict),
            try f6.createResult(from: dict),
            try f7.createResult(from: dict),
            try f8.createResult(from: dict),
            try f9.createResult(from: dict),
            try f10.createResult(from: dict),
            try f11.createResult(from: dict),
            try f12.createResult(from: dict),
            try f13.createResult(from: dict),
            try f14.createResult(from: dict)
        )
    }
}

public struct FieldAggregate15
    <T: Object, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate, F11: FieldAggregate, F12: FieldAggregate, F13: FieldAggregate, F14: FieldAggregate, F15: FieldAggregate>
    : FieldAggregate
{
    public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result, F11.Result, F12.Result, F13.Result, F14.Result, F15.Result)
    
    public var items: [AnyFieldAggregate] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15] }
    let f1: F1, f2: F2, f3: F3, f4: F4, f5: F5, f6: F6, f7: F7, f8: F8, f9: F9, f10: F10, f11: F11, f12: F12, f13: F13, f14: F14, f15: F15
    
    init(_ type: T.Type, _ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12, _ f13: F13, _ f14: F14, _ f15: F15) {
        self.f1 = f1; self.f2 = f2; self.f3 = f3; self.f4 = f4; self.f5 = f5; self.f6 = f6; self.f7 = f7; self.f8 = f8; self.f9 = f9; self.f10 = f10; self.f11 = f11; self.f12 = f12; self.f13 = f13; self.f14 = f14; self.f15 = f15
    }
    
    public func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try f1.createResult(from: dict),
            try f2.createResult(from: dict),
            try f3.createResult(from: dict),
            try f4.createResult(from: dict),
            try f5.createResult(from: dict),
            try f6.createResult(from: dict),
            try f7.createResult(from: dict),
            try f8.createResult(from: dict),
            try f9.createResult(from: dict),
            try f10.createResult(from: dict),
            try f11.createResult(from: dict),
            try f12.createResult(from: dict),
            try f13.createResult(from: dict),
            try f14.createResult(from: dict),
            try f15.createResult(from: dict)
        )
    }
}
