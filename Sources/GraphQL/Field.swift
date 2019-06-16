import Foundation

public protocol FieldProtocol: FieldAggregate {

}
public extension FieldProtocol {
    func unsafeIncludedKeyPaths() -> [(String, AnyKeyPath)] {
        return self.includedKeyPaths()
    }
}

public protocol AnyField {
    func render() -> String
    func renderDebug() -> String
}

public struct Field<T: Schema, Value: GraphQLCompatibleValue, SubSelection: FieldAggregate>: FieldProtocol {
    public typealias Result = Value.Result
    
    private let keyPath: KeyPath<T.QueryableType, Value>
    private let arguments: [T.Args]
    /// The query string of the sub-selection on the requested key. This is `nil` if the key is a scalar value.
    private let renderedSubSelection: String?
    var key: String { T.string(for: self.keyPath) }
    public var items: [AnyFieldAggregate] = []
    
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
    
    public func createResult(from dict: [String : Any]) throws -> Value.Result {
        try Value.createUnsafeResult(from: dict, key: self.key)
//        try Value.createResult(from: dict, key: self.key)
    }
}

extension Field where Value: GraphQLScalarValue, SubSelection == EmptySubSelection<T> {
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

extension Field where Value: Schema, SubSelection.T == Value {
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    public init(_ keyPath: KeyPath<T.QueryableType, Value>, @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.renderedSubSelection = subSelection().render()
        self.arguments = []
    }
    
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    public init(_ keyPath: KeyPath<T.QueryableType, Value>, arguments: T.Args..., @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.renderedSubSelection = subSelection().render()
        self.arguments = arguments
    }
}

extension Field where Value: Collection, SubSelection.T.QueryableType == Value.Element, Value.Element: GraphQLCompatibleValue {
    public init(_ keyPath: KeyPath<T.QueryableType, Value>, @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.renderedSubSelection = subSelection().render()
        self.arguments = []
    }
    
    public init(_ keyPath: KeyPath<T.QueryableType, Value>, arguments: T.Args..., @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.renderedSubSelection = subSelection().render()
        self.arguments = arguments
    }
}

public struct EmptySubSelection<T: Schema>: FieldProtocol {
    public typealias Value = Int
    public typealias Result = Never
    
    public var items: [AnyFieldAggregate]
    
    public func includedKeyPaths<T>() -> [(String, PartialKeyPath<T>)] {
        return []
    }
    
    public func render() -> String {
        return ""
    }
    
    public func renderDebug() -> String {
        return ""
    }
    
    public func createResult(from: [String : Any]) throws -> Never {
        fatalError()
    }
}

