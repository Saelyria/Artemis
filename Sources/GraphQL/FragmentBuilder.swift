import Foundation

@_functionBuilder
public struct FragmentBuilder {
    public static func buildBlock
        <F: FragmentProtocol>
        (_ f1: F)
        -> (String, F)
    {
        return (f1.render(), f1)
    }
    
    public static func buildBlock
        <F1: FragmentProtocol, F2: FragmentProtocol>
        (_ f1: F1, _ f2: F2)
        -> (String, (F1, F2))
    {
        return ([f1.render(), f2.render()].joined(separator: ","), (f1, f2))
    }
    
    public static func buildBlock
        <F1: FragmentProtocol, F2: FragmentProtocol, F3: FragmentProtocol>
        (_ f1: F1, _ f2: F2, _ f3: F3)
        -> (String, (F1, F2, F3))
    {
        return ([f1.render(), f2.render(), f3.render()].joined(separator: ","), (f1, f2, f3))
    }
    
    public static func buildBlock
        <F1: FragmentProtocol, F2: FragmentProtocol, F3: FragmentProtocol, F4: FragmentProtocol>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4)
        -> (String, (F1, F2, F3, F4))
    {
        return ([f1.render(), f2.render(), f3.render(), f4.render()].joined(separator: ","), (f1, f2, f3, f4))
    }
    
    public static func buildBlock
        <F1: FragmentProtocol, F2: FragmentProtocol, F3: FragmentProtocol, F4: FragmentProtocol, F5: FragmentProtocol>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5)
        -> (String, (F1, F2, F3, F4, F5))
    {
        return ([f1.render(), f2.render(), f3.render(), f4.render(), f5.render()].joined(separator: ","), (f1, f2, f3, f4, f5))
    }
    
    public static func buildBlock
        <F1: FragmentProtocol, F2: FragmentProtocol, F3: FragmentProtocol, F4: FragmentProtocol, F5: FragmentProtocol, F6: FragmentProtocol>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6)
        -> (String, (F1, F2, F3, F4, F5, F6))
    {
        return ([f1.render(), f2.render(), f3.render(), f4.render(), f5.render(), f6.render()].joined(separator: ","), (f1, f2, f3, f4, f5, f6))
    }

    public static func buildBlock
        <F1: FragmentProtocol, F2: FragmentProtocol, F3: FragmentProtocol, F4: FragmentProtocol, F5: FragmentProtocol, F6: FragmentProtocol, F7: FragmentProtocol>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7)
        -> (String, (F1, F2, F3, F4, F5, F6, F7))
    {
        return ([f1.render(), f2.render(), f3.render(), f4.render(), f5.render(), f6.render(), f7.render()].joined(separator: ","), (f1, f2, f3, f4, f5, f6, f7))
    }
}
