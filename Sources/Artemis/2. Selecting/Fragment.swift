import Foundation

/**
An object representing a GraphQL 'fragment' that can be added to a sub-selection.
*/
public struct Fragment<T: Object> {
    /// The name given to this fragment to identify it.
	public let name: String
	let renderedSelectionSet: String
    let items: [SelectionBase]

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
	
	public func createResult(from: Any) throws -> Never {
		fatalError()
	}
	
	public static func string(for argument: NoArguments) throws -> String {
		return ""
	}
}
