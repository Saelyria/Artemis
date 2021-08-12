import Foundation

/**
An object representing a GraphQL 'fragment' that can be added to a sub-selection.
*/
public struct Fragment<T: Object, R> where T.SubSchema == T {
    /// The name given to this fragment to identify it.
	public let name: String
    var selection: _FragmentSelection<R>

	/**
	Creates a new frament usable in a sub-selection with the given name, on the given type, selecting the properties
	in the given sub-selection function builder result.
	*/
    public init(_ name: String, on: T.Type, @_SelectionSetBuilder<T> selection: (_Selector<T>) -> _SelectionSet<R>) {
		self.name = name
        let underlying = selection(_Selector<T>())
        self.selection = _FragmentSelection(
            underlying: underlying,
            fragmentDeclaration: "fragment \(name) on \(String(describing: T.self)){\(underlying.render())}"
        )
	}

    /**
    Creates a new frament usable in a sub-selection with the given name, on the given type, selecting the properties
    in the given sub-selection function builder result.
    */
    public init(_ name: String, on: T.Type, @_SelectionSetBuilder<T> selection: () -> _SelectionSet<R>) {
        self.init(name, on: on, selection: { _ in return selection() })
    }
}

struct _FragmentSelection<Result> {
    let underlying: _SelectionSet<Result>
    let erased: _AnySelection

    fileprivate init(underlying: _SelectionSet<Result>, fragmentDeclaration: String) {
        self.underlying = underlying
        self.erased = _AnySelection(
            items: underlying.items,
            renderedFragmentDeclarations: underlying.renderedFragmentDeclarations + [fragmentDeclaration],
            error: underlying.error,
            render: underlying.render
        )
    }

    func createResult(from dict: [String : Any]) throws -> Result {
        try underlying.createResult(from: dict)
    }
}
