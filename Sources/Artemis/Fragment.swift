import Foundation

//public prefix func ...<T, SelectionSet>(_ fragment: Fragment<T, SelectionSet>) -> SelectionSet {
//    return fragment.SelectionSet
//}
/*
public protocol FragmentProtocol: SelectionSet { //AnyField
	var name: String { get }
	func render() -> String
}

/**
An object representing a GraphQL 'fragment' that can be added to a sub-selection.
*/
public struct Fragment<T: Object>: FragmentProtocol {
	public typealias Argument = NoArguments
	
	public var key: String = ""
	public typealias Result = Never
	
	public let name: String
	let renderedSelectionSet: String
	public var items: [AnySelectionSet] = []
	
	/**
	Creates a new frament usable in a sub-selection with the given name, on the given type, selecting the properties
	in the given sub-selection function builder result.
	*/
	public init<SS: SelectionSet>(_ name: String, on: T.Type, @SelectionSetBuilder SelectionSet: () -> SS) where SS.T == T {
		self.name = name
		let ss = SelectionSet()
		self.renderedSelectionSet = ss.render()
		self.items = ss.items
	}
	
	public func render() -> String {
		return "fragment \(self.name) on \(String(describing: T.self)){\(self.renderedSelectionSet)}"
	}
	
	public func createResult(from: [String : Any]) throws -> Never {
		fatalError()
	}
	
	public static func string(for argument: NoArguments) throws -> String {
		return ""
	}
}
*/
