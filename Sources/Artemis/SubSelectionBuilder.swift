import Foundation

/**
A function builder type that builds selection sets from `Add` instances.
*/
@_functionBuilder
public struct SelectionSetBuilder {
	public static func buildBlock
		<T, F: SelectionSet>
		(_ f1: F)
		-> SelectionSet1<T, F>
		where F.T == T
	{
		return SelectionSet1(T.self, f1)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet>
		(_ f1: F1, _ f2: F2)
		-> SelectionSet2<T, F1, F2>
		where F1.T == T, F2.T == T
	{
		return SelectionSet2(T.self, f1, f2)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3)
		-> SelectionSet3<T, F1, F2, F3>
		where F1.T == T, F2.T == T, F3.T == T
	{
		return SelectionSet3(T.self, f1, f2, f3)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4)
		-> SelectionSet4<T, F1, F2, F3, F4>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T
	{
		return SelectionSet4(T.self, f1, f2, f3, f4)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5)
		-> SelectionSet5<T, F1, F2, F3, F4, F5>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T
	{
		return SelectionSet5(T.self, f1, f2, f3, f4, f5)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6)
		-> SelectionSet6<T, F1, F2, F3, F4, F5, F6>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T
	{
		return SelectionSet6(T.self, f1, f2, f3, f4, f5, f6)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7)
		-> SelectionSet7<T, F1, F2, F3, F4, F5, F6, F7>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T
	{
		return SelectionSet7(T.self, f1, f2, f3, f4, f5, f6, f7)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8)
		-> SelectionSet8<T, F1, F2, F3, F4, F5, F6, F7, F8>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T
	{
		return SelectionSet8(T.self, f1, f2, f3, f4, f5, f6, f7, f8)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9)
		-> SelectionSet9<T, F1, F2, F3, F4, F5, F6, F7, F8, F9>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T
	{
		return SelectionSet9(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10)
		-> SelectionSet10<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T
	{
		return SelectionSet10(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet, F11: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11)
		-> SelectionSet11<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T, F11.T == T
	{
		return SelectionSet11(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet, F11: SelectionSet, F12: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12)
		-> SelectionSet12<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T, F11.T == T, F12.T == T
	{
		return SelectionSet12(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet, F11: SelectionSet, F12: SelectionSet, F13: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12, _ f13: F13)
		-> SelectionSet13<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T, F11.T == T, F12.T == T, F13.T == T
	{
		return SelectionSet13(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet, F11: SelectionSet, F12: SelectionSet, F13: SelectionSet, F14: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12, _ f13: F13, _ f14: F14)
		-> SelectionSet14<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T, F11.T == T, F12.T == T, F13.T == T, F14.T == T
	{
		return SelectionSet14(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14)
	}
	
	public static func buildBlock
		<T, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet, F11: SelectionSet, F12: SelectionSet, F13: SelectionSet, F14: SelectionSet, F15: SelectionSet>
		(_ f1: F1, _ f2: F2, _ f3: F3, _ f4: F4, _ f5: F5, _ f6: F6, _ f7: F7, _ f8: F8, _ f9: F9, _ f10: F10, _ f11: F11, _ f12: F12, _ f13: F13, _ f14: F14, _ f15: F15)
		-> SelectionSet15<T, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15>
		where F1.T == T, F2.T == T, F3.T == T, F4.T == T, F5.T == T, F6.T == T, F7.T == T, F8.T == T, F9.T == T, F10.T == T, F11.T == T, F12.T == T, F13.T == T, F14.T == T, F15.T == T
	{
		return SelectionSet15(T.self, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15)
	}
}
