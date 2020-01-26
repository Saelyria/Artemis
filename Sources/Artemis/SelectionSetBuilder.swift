import Foundation

/**
A function builder type that builds selection sets from `Add` instances.
*/
@_functionBuilder
public struct SelectionSetBuilder {
	public static func buildBlock
		<T: Object, F1: AnyField>
		(_ f1: Add<T, F1>)
		-> SelectionSet<T, F1.Value.Result>
	{
		return SelectionSet(items: [f1], resultBuilder: { dict in
			return try f1.createResult(from: dict)
		})
	}
	
	public static func buildBlock
		<T: Object, F1: AnyField, F2: AnyField>
		(_ f1: Add<T, F1>, _ f2: Add<T, F2>)
		-> SelectionSet<T, (F1.Value.Result, F2.Value.Result)>
	{
		return SelectionSet(items: [f1, f2], resultBuilder: { dict in
			return (
				try f1.createResult(from: dict),
				try f2.createResult(from: dict)
			)
		})
	}
	
//	public static func buildBlock
//		<SS1: SelectionSet, SS2: SelectionSet, SS3: SelectionSet>
//		(_ ss1: SS1, _ ss2: SS2, _ ss3: SS3)
//		-> SelectionSet<SS1.T, (SS1.Result, SS2.Result, SS3.Result)>
//		where SS1.T == SS2.T, SS2.T == SS3.T
//	{
//		return SelectionSet(items: [ss1, ss2, ss3], resultBuilder: { dict in
//			return (
//				try ss1.createResult(from: dict),
//				try ss2.createResult(from: dict),
//				try ss3.createResult(from: dict)
//			)
//		})
//	}
//
//	public static func buildBlock
//		<SS1: SelectionSet, SS2: SelectionSet, SS3: SelectionSet, SS4: SelectionSet>
//		(_ ss1: SS1, _ ss2: SS2, _ ss3: SS3, _ ss4: SS4)
//		-> SelectionSet<SS1.T, (SS1.Result, SS2.Result, SS3.Result, SS4.Result)>
//		where SS1.T == SS2.T, SS2.T == SS3.T, SS3.T == SS4.T
//	{
//		return SelectionSet(items: [ss1, ss2, ss3, ss4], resultBuilder: { dict in
//			return (
//				try ss1.createResult(from: dict),
//				try ss2.createResult(from: dict),
//				try ss3.createResult(from: dict),
//				try ss4.createResult(from: dict)
//			)
//		})
//	}
//
//	public static func buildBlock
//		<SS1: SelectionSet, SS2: SelectionSet, SS3: SelectionSet, SS4: SelectionSet, SS5: SelectionSet>
//		(_ ss1: SS1, _ ss2: SS2, _ ss3: SS3, _ ss4: SS4, _ ss5: SS5)
//		-> SelectionSet<SS1.T, (SS1.Result, SS2.Result, SS3.Result, SS4.Result, SS5.Result)>
//		where SS1.T == SS2.T, SS2.T == SS3.T, SS3.T == SS4.T, SS4.T == SS5.T
//	{
//		return SelectionSet(items: [ss1, ss2, ss3, ss4, ss5], resultBuilder: { dict in
//			return (
//				try ss1.createResult(from: dict),
//				try ss2.createResult(from: dict),
//				try ss3.createResult(from: dict),
//				try ss4.createResult(from: dict),
//				try ss5.createResult(from: dict)
//			)
//		})
//	}
//
//	public static func buildBlock
//		<SS1: SelectionSet, SS2: SelectionSet, SS3: SelectionSet, SS4: SelectionSet, SS5: SelectionSet, SS6: SelectionSet>
//		(_ ss1: SS1, _ ss2: SS2, _ ss3: SS3, _ ss4: SS4, _ ss5: SS5, _ ss6: SS6)
//		-> SelectionSet<SS1.T, (SS1.Result, SS2.Result, SS3.Result, SS4.Result, SS5.Result, SS6.Result)>
//		where SS1.T == SS2.T, SS2.T == SS3.T, SS3.T == SS4.T, SS4.T == SS5.T, SS5.T == SS6.T
//	{
//		return SelectionSet(items: [ss1, ss2, ss3, ss4, ss5, ss6], resultBuilder: { dict in
//			return (
//				try ss1.createResult(from: dict),
//				try ss2.createResult(from: dict),
//				try ss3.createResult(from: dict),
//				try ss4.createResult(from: dict),
//				try ss5.createResult(from: dict),
//				try ss6.createResult(from: dict)
//			)
//		})
//	}
}
