import Foundation

@dynamicMemberLookup
public struct Select<T: Schema, F: AnyField, SubSelection: FieldAggregate>: FieldAggregate {
    public typealias Result = F.Value.Result
    
    private let alias: String?
    private let field: F
    private let keyPath: PartialKeyPath<T.QueryableType>
    private let renderedArguments: String?
    /// The query string of the sub-selection on the requested key. This is `nil` if the key is a scalar value.
    private let renderedSubSelection: String?
    var key: String { self.alias ?? self.field.key }
    public var items: [AnyFieldAggregate] = []
    
    public func render() -> String {
        let args: String = self.renderedArguments ?? ""
        let name: String = (self.alias == nil) ? self.field.key : "\(self.alias!):\(self.field.key)"
        let subSelection = (self.renderedSubSelection == nil) ? "" : "{\(self.renderedSubSelection!)}"
        return "\(name)\(args)\(subSelection)"        
    }
    
    public let error: GraphQLError?
    
    public func renderDebug() throws -> String {
        return self.key
    }

    public func includedKeyPaths() -> [(String, PartialKeyPath<T.QueryableType>)] {
        return [(self.key, self.keyPath)]
    }
    
    public func createResult(from dict: [String : Any]) throws -> F.Value.Result {
        guard let object: Any = dict[self.key] else { throw GraphQLError.malformattedResponse(reason: "Response didn't include key for \(self.key)") }
        return try F.Value.createUnsafeResult(from: object, key: self.key)
    }
    
    public subscript<V>(dynamicMember keyPath: KeyPath<F.Argument, V>) -> (V) -> Self {
        return { _ in return self }
    }
    
    public subscript<V>(dynamicMember keyPath: KeyPath<F.Argument, V>) -> (Variable<V>) -> Self {
        return { _ in return self }
    }
    
    private static func render(arguments: F.Argument) throws -> String {
        return try argumentString(for: arguments)
    }
}

extension Select where F.Value: GraphQLScalarValue, SubSelection == EmptySubSelection<T> {
    /// Declares that the given property should be fetched on the queried object.
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil) {
        self.keyPath = keyPath
        self.alias = alias
        self.renderedSubSelection = nil
        self.field = T.QueryableType()[keyPath: keyPath]
        self.renderedArguments = nil
        self.error = nil
    }
}

extension Select where F.Value: Schema, SubSelection.T == F.Value {
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil, @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.alias = alias
        self.renderedSubSelection = subSelection().render()
        self.renderedArguments = nil
        self.error = nil
        self.field = T.QueryableType()[keyPath: keyPath]
    }
}

extension Select where F.Value: Collection, SubSelection.T.QueryableType == F.Value.Element, F.Value.Element: GraphQLCompatibleValue {
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil, @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.alias = alias
        self.renderedSubSelection = subSelection().render()
        self.renderedArguments = nil
        self.error = nil
        self.field = T.QueryableType()[keyPath: keyPath]
    }
}

public struct EmptySubSelection<T: Schema>: FieldAggregate {
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

