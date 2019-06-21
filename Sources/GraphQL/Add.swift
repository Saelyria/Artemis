import Foundation

@dynamicMemberLookup
public struct Add<T: Schema, F: AnyField, SubSelection: FieldAggregate>: FieldAggregate {
    public typealias Result = F.Value.Result
    
    private enum FieldType {
        case field(key: String, alias: String?, renderedArguments: String?, renderedSubSelection: String?)
        case fragment(rendered: String)
    }
    
    private let fieldType: FieldType
    var key: String { "" }//self.alias ?? self.field.key }
    public var items: [AnyFieldAggregate] = []
    
    public func render() -> String {
        switch self.fieldType {
        case .field(let key, let alias, let renderedArguments, let renderedSubSelection):
            let args: String = renderedArguments ?? ""
            let name: String = (alias == nil) ? key : "\(alias!):\(key)"
            let subSelection = (renderedSubSelection == nil) ? "" : "{\(renderedSubSelection!)}"
            return "\(name)\(args)\(subSelection)"
        case .fragment(let renderedFragment):
            return renderedFragment
        }
    }
    
    public let error: GraphQLError?
    
    public func renderDebug() throws -> String {
        return ""
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

extension Add where F.Value: GraphQLScalarValue, SubSelection == EmptySubSelection {
    /// Declares that the given property should be fetched on the queried object.
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil) {
        let field = T.QueryableType()[keyPath: keyPath]
        self.fieldType = .field(key: field.key, alias: alias, renderedArguments: nil, renderedSubSelection: nil)
        self.error = nil
    }
}

extension Add where F.Value: Schema, SubSelection.T == F.Value {
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil, @SubSelectionBuilder subSelection: () -> SubSelection) {
        let field = T.QueryableType()[keyPath: keyPath]
        self.fieldType = .field(key: field.key, alias: alias, renderedArguments: nil, renderedSubSelection: subSelection().render())
        self.error = nil
    }
}

extension Add where F.Value: Collection, SubSelection.T.QueryableType == F.Value.Element, F.Value.Element: GraphQLCompatibleValue {
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil, @SubSelectionBuilder subSelection: () -> SubSelection) {
        let field = T.QueryableType()[keyPath: keyPath]
        self.fieldType = .field(key: field.key, alias: alias, renderedArguments: nil, renderedSubSelection: subSelection().render())
        self.error = nil
    }
}

public extension Add where SubSelection == EmptySubSelection, F: AnyFragment, F.T == T {
    init(fragment: F) {
        self.fieldType = .fragment(rendered: fragment.render())
        self.error = nil
    }
}
public extension Add where SubSelection == EmptySubSelection, F: AnyFragment, F.T == T.ImplementedInterfaces.I1 {
    init(fragment: F) {
        self.fieldType = .fragment(rendered: fragment.render())
        self.error = nil
    }
}

public struct EmptySubSelection: FieldAggregate {
    public struct T: Schema {
        public init() { }
    }
    public typealias Result = Never
    
    public var items: [AnyFieldAggregate] = []
    
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

