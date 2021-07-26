import Foundation

/**
An object representing a GraphQL 'fragment' that can be added to a sub-selection.
*/
public struct Fragment<T: Object> where T.SubSchema == T {
    /// The name given to this fragment to identify it.
	public let name: String
	let rendered_SelectionSet: String
    let items: [_SelectionBase]

	/**
	Creates a new frament usable in a sub-selection with the given name, on the given type, selecting the properties
	in the given sub-selection function builder result.
	*/
    public init<S: _SelectionProtocol>(_ name: String, on: T.Type, @_SelectionSetBuilder<T> selection: (_Selector<T>) -> S) {
		self.name = name
		let s = selection(_Selector<T>())
		self.rendered_SelectionSet = s.render()
		self.items = s.items
	}

    /**
    Creates a new frament usable in a sub-selection with the given name, on the given type, selecting the properties
    in the given sub-selection function builder result.
    */
    public init<S: _SelectionProtocol>(_ name: String, on: T.Type, @_SelectionSetBuilder<T> selection: () -> S) {
        self.init(name, on: on, selection: { _ in return selection() })
    }
	
    func render() -> String {
		return "fragment \(self.name) on \(String(describing: T.self)){\(self.rendered_SelectionSet)}"
	}
}
