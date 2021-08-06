import Foundation

/**
An object representing a GraphQL 'fragment' that can be added to a sub-selection.
*/
public struct Fragment<T: Object, S: _SelectionProtocol> where T.SubSchema == T {
    /// The name given to this fragment to identify it.
	public let name: String
    var selection: _FragmentSelection<S>

	/**
	Creates a new frament usable in a sub-selection with the given name, on the given type, selecting the properties
	in the given sub-selection function builder result.
	*/
    public init(_ name: String, on: T.Type, @_SelectionSetBuilder<T> selection: (_Selector<T>) -> S) {
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
    public init(_ name: String, on: T.Type, @_SelectionSetBuilder<T> selection: () -> S) {
        self.init(name, on: on, selection: { _ in return selection() })
    }
}

struct _FragmentSelection<S: _SelectionProtocol>: _SelectionProtocol {
    typealias Result = S.Result

    var underlying: S
    var fragmentDeclaration: String

    var items: [_SelectionBase] { underlying.items }
    var renderedFragmentDeclarations: [String] {
        underlying.renderedFragmentDeclarations + [fragmentDeclaration]
    }
    var error: GraphQLError? { underlying.error }

    func render() -> String {
        underlying.render()
    }

    func createResult(from dict: [String : Any]) throws -> S.Result {
        try underlying.createResult(from: dict)
    }
}
