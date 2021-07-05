import Foundation

//public prefix func ...<T, SelectionSet>(_ fragment: Fragment<T, SelectionSet>) -> SelectionSet {
//    return fragment.SelectionSet
//}

public protocol FragmentProtocol: Selection {
    associatedtype T: Object
    
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
	public var items: [SelectionBase] = []
    public var error: GraphQLError?
    public var renderedFragmentDeclarations: [String] = []
	
	/**
	Creates a new frament usable in a sub-selection with the given name, on the given type, selecting the properties
	in the given sub-selection function builder result.
	*/
    public init<S: Selection>(_ name: String, on: T.Type, @SelectionSetBuilder<T> selection: () -> S) {
		self.name = name
		let s = selection()
		self.renderedSelectionSet = s.render()
		self.items = s.items
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
