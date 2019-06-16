import Foundation

/*

protocol Mutating { }

/// A declaration of a property that we want to be included in the queried type.
struct Set<T: Queryable, U: GraphQLCompatibleValue, SQ: GraphQLItem & Mutating>: GraphQLItem, Mutating {
    private let keyPath: KeyPath<T, U>
    private let arguments: [T.Args]
    private let renderedSubQuery: String?
    
    func render() -> String {
        return ""
    }
    
    func renderDebug() -> String {
        return ""
    }
    
    func includedKeyPaths() -> [(String, PartialKeyPath<T.QueryableType>)] {
        return []
    }
}

extension Set where SQ == EmptyGraphQLItem<T> {
    /// Declares that the given property should be fetched on the queried object.
    init(_ keyPath: KeyPath<T, U>, to value: U) {
        self.keyPath = keyPath
        self.renderedSubQuery = nil
        self.arguments = []
    }
    
    /// Declares that the given property should be fetched on the queried object.
    init(_ keyPath: KeyPath<T, U>, to value: U, arguments: T.Args...) {
        self.keyPath = keyPath
        self.renderedSubQuery = nil
        self.arguments = arguments
    }
}

extension Set where SQ.T == U {
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    init(_ keyPath: KeyPath<T, U>, to value: U, @MutationBuilder query: () -> SQ) {
        self.keyPath = keyPath
        self.renderedSubQuery = query().render()
        self.arguments = []
    }
    
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    init(_ keyPath: KeyPath<T, U>, to value: U, arguments: T.Args..., @MutationBuilder query: () -> SQ) {
        self.keyPath = keyPath
        self.renderedSubQuery = query().render()
        self.arguments = arguments
    }
}

extension Set where U: Collection, SQ.T == U.Element {
    init(_ keyPath: KeyPath<T, U>, to value: U, @MutationBuilder query: () -> SQ) {
        self.keyPath = keyPath
        self.renderedSubQuery = query().render()
        self.arguments = []
    }
    
    init(_ keyPath: KeyPath<T, U>, to value: U, arguments: T.Args..., @MutationBuilder query: () -> SQ) {
        self.keyPath = keyPath
        self.renderedSubQuery = query().render()
        self.arguments = arguments
    }
}
*/
