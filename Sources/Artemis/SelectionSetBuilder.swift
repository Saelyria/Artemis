import Foundation

/**
A function builder type that builds selection sets from `Add` instances.
*/
@_functionBuilder
public struct SelectionSetBuilder {
	public static func buildBlock
        <T, F1>
		(_ ss1: Add<T, F1>)
        -> SelectionSet<T, F1.Value.Result>
	{
		return SelectionSet(items: [ss1], resultBuilder: { dict in
			return try ss1.createResult(from: dict)
		})
	}
	
	public static func buildBlock
		<T, F1, F2>
        (_ ss1: Add<T, F1>, _ ss2: Add<T, F2>)
        -> SelectionSet<T, (F1.Value.Result, F2.Value.Result)>
	{
		return SelectionSet(items: [ss1, ss2], resultBuilder: { dict in
			return (
				try ss1.createResult(from: dict),
				try ss2.createResult(from: dict)
			)
		})
	}

//    public static func buildBlock
//        <T, S1: Selection, S2: Selection>
//        (_ ss1: S1, _ ss2: S2)
//        -> SelectionSet<T, (S1.Result, S2.Result)>
//        where S1.T.Schema == T.Schema, S2.T.Schema == T.Schema
//    {
//        return SelectionSet(items: [ss1, ss2], resultBuilder: { dict in
//            return (
//                try ss1.createResult(from: dict),
//                try ss2.createResult(from: dict)
//            )
//        })
//    }
	
//	public static func buildBlock
//		<T, F1, F2, F3>
//		(_ ss1: Add<T, F1>, _ ss2: Add<T, F2>, _ ss3: Add<T, F3>)
//		-> SelectionSet<T, (F1.Value.Result, F2.Value.Result, F3.Value.Result)>
//	{
//		return SelectionSet(items: [ss1, ss2, ss3], resultBuilder: { dict in
//			return (
//				try ss1.createResult(from: dict),
//				try ss2.createResult(from: dict),
//				try ss3.createResult(from: dict)
//			)
//		})
//	}

    /*
	public static func buildBlock
		<SS1: SelectionSet, SS2: SelectionSet, SS3: SelectionSet, SS4: SelectionSet>
		(_ ss1: SS1, _ ss2: SS2, _ ss3: SS3, _ ss4: SS4)
		-> SelectionSetItem<SS1.T, (SS1.Result, SS2.Result, SS3.Result, SS4.Result)>
		where SS1.T == SS2.T, SS2.T == SS3.T, SS3.T == SS4.T
	{
		return SelectionSetItem(items: [ss1, ss2, ss3, ss4], resultBuilder: { dict in
			return (
				try ss1.createResult(from: dict),
				try ss2.createResult(from: dict),
				try ss3.createResult(from: dict),
				try ss4.createResult(from: dict)
			)
		})
	}

	public static func buildBlock
		<SS1: SelectionSet, SS2: SelectionSet, SS3: SelectionSet, SS4: SelectionSet, SS5: SelectionSet>
		(_ ss1: SS1, _ ss2: SS2, _ ss3: SS3, _ ss4: SS4, _ ss5: SS5)
		-> SelectionSetItem<SS1.T, (SS1.Result, SS2.Result, SS3.Result, SS4.Result, SS5.Result)>
		where SS1.T == SS2.T, SS2.T == SS3.T, SS3.T == SS4.T, SS4.T == SS5.T
	{
		return SelectionSetItem(items: [ss1, ss2, ss3, ss4, ss5], resultBuilder: { dict in
			return (
				try ss1.createResult(from: dict),
				try ss2.createResult(from: dict),
				try ss3.createResult(from: dict),
				try ss4.createResult(from: dict),
				try ss5.createResult(from: dict)
			)
		})
	}
	
	public static func buildBlock
		<SS1: SelectionSet, SS2: SelectionSet, SS3: SelectionSet, SS4: SelectionSet, SS5: SelectionSet, SS6: SelectionSet>
		(_ ss1: SS1, _ ss2: SS2, _ ss3: SS3, _ ss4: SS4, _ ss5: SS5, _ ss6: SS6)
		-> SelectionSetItem<SS1.T, (SS1.Result, SS2.Result, SS3.Result, SS4.Result, SS5.Result, SS6.Result)>
		where SS1.T == SS2.T, SS2.T == SS3.T, SS3.T == SS4.T, SS4.T == SS5.T, SS5.T == SS6.T
	{
		return SelectionSetItem(items: [ss1, ss2, ss3, ss4, ss5, ss6], resultBuilder: { dict in
			return (
				try ss1.createResult(from: dict),
				try ss2.createResult(from: dict),
				try ss3.createResult(from: dict),
				try ss4.createResult(from: dict),
				try ss5.createResult(from: dict),
				try ss6.createResult(from: dict)
			)
		})
	}
 */
}
