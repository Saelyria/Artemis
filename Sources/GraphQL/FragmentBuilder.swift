import Foundation

@_functionBuilder
public struct FragmentBuilder {
    public static func buildBlock
        <T, F: FieldAggregate>
        (_ f1: F)
        -> FieldAggregate1<T, F>
        where F.T == T
    {
        return FieldAggregate1(T.self, f1)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate>
        (_ f1: F1, _ f2: F2)
        -> FieldAggregate2<T, F1, F2>
        where F1.T == T, F2.T == T
    {
        return FieldAggregate2(T.self, f1, f2)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3)
        -> FieldAggregate3<T, F1, F2, F3>
        where F1.T == T, F2.T == T, F3.T == T
    {
        return FieldAggregate3(T.self, f1, f2, f3)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4)
        -> FieldAggregate4<T, F1, F2, F3, F4>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T
    {
        return FieldAggregate4(T.self, f1, f2, f3, f4)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5)
        -> FieldAggregate5<T, F1, F2, F3, F4, F5>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T
    {
        return FieldAggregate5(T.self, f1, f2, f3, f4, f5)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6)
        -> FieldAggregate6<T, F1, F2, F3, F4, F5, F6>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T
    {
        return FieldAggregate6(T.self, f1, f2, f3, f4, f5, f6)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7)
        -> FieldAggregate7<T, F1, F2, F3, F4, F5, F6, F7>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T
    {
        return FieldAggregate7(T.self, f1, f2, f3, f4, f5, f6, f7)
    }
}
