import Foundation

protocol GraphOperation: GraphQLItem {
    associatedtype Result
    
    func createResult(from rawDict: [String : Any]) throws -> Result
}


/// A declaration of a property that we want to be included in the queried type.
public struct Get<T: Schema, Value: GraphQLCompatibleValue, SubSelection: GraphQLItem>: GraphQLItem {
    private let keyPath: KeyPath<T.QueryableType, Value>
    private let arguments: [T.Args]
    /// The query string of the sub-selection on the requested key. This is `nil` if the key is a scalar value.
    private let renderedSubSelection: String?
    var key: String { T.string(for: self.keyPath) }
    
    public func render() -> String {
        if let renderedSubQuery = self.renderedSubSelection {
            var args: String = ""
            if !self.arguments.isEmpty {
                args = self.arguments.map { T.string(for: $0) }.joined(separator: ", ")
                args = "(\(args))"
            }
            return "\(T.string(for: self.keyPath))\(args) { \(renderedSubQuery) }"
        }
        return T.string(for: self.keyPath)
    }
    
    public func renderDebug() -> String {
        if let renderedSubQuery = self.renderedSubSelection {
            var args: String = ""
            if !self.arguments.isEmpty {
                args = self.arguments.reduce(into: "", { result, arg in
                    result.append(T.string(for: arg))
                })
                args = "(\(args))"
            }
            return "\(T.string(for: self.keyPath))\(args) {\n\t\(renderedSubQuery)\n}"
        }
        return T.string(for: self.keyPath)
    }

    public func includedKeyPaths() -> [(String, PartialKeyPath<T.QueryableType>)] {
        return [(self.key, self.keyPath)]
    }
}

extension Get where Value: GraphQLScalarValue, SubSelection == EmptyGraphQLItem<T> {
    /// Declares that the given property should be fetched on the queried object.
    public init(_ keyPath: KeyPath<T.QueryableType, Value>) {
        self.keyPath = keyPath
        self.renderedSubSelection = nil
        self.arguments = []
    }
    
    /// Declares that the given property should be fetched on the queried object.
    public init(_ keyPath: KeyPath<T.QueryableType, Value>, arguments: T.Args...) {
        self.keyPath = keyPath
        self.renderedSubSelection = nil
        self.arguments = arguments
    }
}

extension Get where Value: Schema, SubSelection.T == Value {
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    public init(_ keyPath: KeyPath<T.QueryableType, Value>, @QuerySubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.renderedSubSelection = subSelection().render()
        self.arguments = []
    }
    
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    public init(_ keyPath: KeyPath<T.QueryableType, Value>, arguments: T.Args..., @QuerySubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.renderedSubSelection = subSelection().render()
        self.arguments = arguments
    }
}

extension Get where Value: Collection, SubSelection.T.QueryableType == Value.Element, Value.Element: GraphQLCompatibleValue {
    public init(_ keyPath: KeyPath<T.QueryableType, Value>, @QuerySubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.renderedSubSelection = subSelection().render()
        self.arguments = []
    }
    
    public init(_ keyPath: KeyPath<T.QueryableType, Value>, arguments: T.Args..., @QuerySubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.renderedSubSelection = subSelection().render()
        self.arguments = arguments
    }
}
