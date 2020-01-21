import Foundation

/**
A type that holds the generic values for a set of selected fields on a type.

For example, given a selection set like:
user {
	name
	age
}

The 'field aggregate' is an object that represents 'the selection of the 'name' and 'age' fields on a 'user' type'.
Concrete types conforming to this protocol are returned from the 'sub selection function builders'.
*/
public protocol SelectionSet: AnySelectionSet {
	/// The object type that the fields selected from this aggregate are on.
	associatedtype T: Object
	/// The combined 'result' of the selected fields. For example, in the above example selection set of 'name' and
	/// 'age', this would be a `(String, Int)` tuple.
	associatedtype Result
	
	func createResult(from: [String : Any]) throws -> Result
}
extension SelectionSet {
	public typealias Value = Int
}

public protocol AnySelectionSet {
	var items: [AnySelectionSet] { get }
	var renderedFragmentDeclarations: [String] { get }
	var error: GraphQLError? { get }
	func render() -> String
}
public extension AnySelectionSet {
	var renderedFragmentDeclarations: [String] {
		return self.items.flatMap { $0.renderedFragmentDeclarations }
	}
	
	var error: GraphQLError? {
		return self.items.compactMap { $0.error }.first
	}
	
	func render() -> String {
		return "\(self.items.map { "\($0.render())" }.joined(separator: ","))"
	}
}

public struct SelectionSet1
	<T: Object, F1: SelectionSet>
	: SelectionSet
{
	public typealias Result = F1.Result
	
	public var items: [AnySelectionSet] { [f1] }
	let f1: F1
	
	init(_ type: T.Type, _ f1: F1) {
		self.f1 = f1
	}
	
	public func createResult(from dict: [String : Any]) throws -> Result {
		return try f1.createResult(from: dict)
	}
}

public struct SelectionSet2
	<T: Object, F1: SelectionSet, F2: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result)
	
	public var items: [AnySelectionSet] { [f1, f2] }
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

public struct SelectionSet3
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3] }
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

public struct SelectionSet4
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4] }
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

public struct SelectionSet5
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4, f5] }
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

public struct SelectionSet6
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4, f5, f6] }
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

public struct SelectionSet7
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4, f5, f6, f7] }
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

public struct SelectionSet8
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4, f5, f6, f7, f8] }
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

public struct SelectionSet9
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4, f5, f6, f7, f8, f9] }
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

public struct SelectionSet10
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10] }
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

public struct SelectionSet11
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet, F11: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result, F11.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11] }
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

public struct SelectionSet12
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet, F11: SelectionSet, F12: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result, F11.Result, F12.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12] }
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

public struct SelectionSet13
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet, F11: SelectionSet, F12: SelectionSet, F13: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result, F11.Result, F12.Result, F13.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13] }
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

public struct SelectionSet14
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet, F11: SelectionSet, F12: SelectionSet, F13: SelectionSet, F14: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result, F11.Result, F12.Result, F13.Result, F14.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14] }
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

public struct SelectionSet15
	<T: Object, F1: SelectionSet, F2: SelectionSet, F3: SelectionSet, F4: SelectionSet, F5: SelectionSet, F6: SelectionSet, F7: SelectionSet, F8: SelectionSet, F9: SelectionSet, F10: SelectionSet, F11: SelectionSet, F12: SelectionSet, F13: SelectionSet, F14: SelectionSet, F15: SelectionSet>
	: SelectionSet
{
	public typealias Result = (F1.Result, F2.Result, F3.Result, F4.Result, F5.Result, F6.Result, F7.Result, F8.Result, F9.Result, F10.Result, F11.Result, F12.Result, F13.Result, F14.Result, F15.Result)
	
	public var items: [AnySelectionSet] { [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15] }
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
