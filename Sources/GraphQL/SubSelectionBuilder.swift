import Foundation

@_functionBuilder
public struct SubSelectionBuilder {
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
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8)
        -> FieldAggregate8<T, F1, F2, F3, F4, F5, F6, F7, F8>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T
    {
        return FieldAggregate8(T.self, f1, f2, f3, f4, f5, f6, f7, f8)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9)
        -> FieldAggregate9<T, F1, F2, F3, F4, F5, F6, F7, F8, F9>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T
    {
        return FieldAggregate9(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10)
        -> FieldAggregate10<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T
    {
        return FieldAggregate10(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate, F11: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11)
        -> FieldAggregate11<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T, F11.T == T
    {
        return FieldAggregate11(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate, F11: FieldAggregate, F12: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12)
        -> FieldAggregate12<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T, F11.T == T, F12.T == T
    {
        return FieldAggregate12(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate, F11: FieldAggregate, F12: FieldAggregate, F13: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12, _ f13: F13)
        -> FieldAggregate13<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T, F11.T == T, F12.T == T, F13.T == T
    {
        return FieldAggregate13(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate, F11: FieldAggregate, F12: FieldAggregate, F13: FieldAggregate, F14: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12, _ f13: F13, _ f14: F14)
        -> FieldAggregate14<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T, F11.T == T, F12.T == T, F13.T == T, F14.T == T
    {
        return FieldAggregate14(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14)
    }
    
    public static func buildBlock
        <T, F1: FieldAggregate, F2: FieldAggregate, F3: FieldAggregate, F4: FieldAggregate, F5: FieldAggregate, F6: FieldAggregate, F7: FieldAggregate, F8: FieldAggregate, F9: FieldAggregate, F10: FieldAggregate, F11: FieldAggregate, F12: FieldAggregate, F13: FieldAggregate, F14: FieldAggregate, F15: FieldAggregate>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12, _ f13: F13, _ f14: F14, _ f15: F15)
        -> FieldAggregate15<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15>
        where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T, F11.T == T, F12.T == T, F13.T == T, F14.T == T, F15.T == T
    {
        return FieldAggregate15(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15)
    }
}
