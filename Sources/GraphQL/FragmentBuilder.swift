import Foundation

@_functionBuilder
public struct FragmentBuilder {
    public static func buildBlock
        <F: AnyFragment>
        (_ f1: F)
        -> F
    {
        return f1
    }
    
    public static func buildBlock
        <F1: AnyFragment, F2: AnyFragment>
        (_ f1: F1, _ f2: F2)
        -> (F1, F2)
    {
        return (f1, f2)
    }
    
    public static func buildBlock
        <F1: AnyFragment, F2: AnyFragment, F3: AnyFragment>
        (_ f1: F1, _ f2: F2, _ f3: F3)
        -> (F1, F2, F3)
    {
        return (f1, f2, f3)
    }
    
    public static func buildBlock
        <F1: AnyFragment, F2: AnyFragment, F3: AnyFragment, F4: AnyFragment>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4)
        -> (F1, F2, F3, F4)
    {
        return (f1, f2, f3, f4)
    }
    
    public static func buildBlock
        <F1: AnyFragment, F2: AnyFragment, F3: AnyFragment, F4: AnyFragment, F5: AnyFragment>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5)
        -> (F1, F2, F3, F4, F5)
    {
        return (f1, f2, f3, f4, f5)
    }
    
    public static func buildBlock
        <F1: AnyFragment, F2: AnyFragment, F3: AnyFragment, F4: AnyFragment, F5: AnyFragment, F6: AnyFragment>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6)
        -> (F1, F2, F3, F4, F5, F6)
    {
        return (f1, f2, f3, f4, f5, f6)
    }
    
    public static func buildBlock
        <F1: AnyFragment, F2: AnyFragment, F3: AnyFragment, F4: AnyFragment, F5: AnyFragment, F6: AnyFragment, F7: AnyFragment>
        (_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7)
        -> (F1, F2, F3, F4, F5, F6, F7)
    {
        return (f1, f2, f3, f4, f5, f6, f7)
    }
}
