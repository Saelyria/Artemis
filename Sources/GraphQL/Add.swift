import Foundation

@dynamicMemberLookup
public class Add<T: Object, F: AnyField, SubSelection: FieldAggregate>: FieldAggregate {
    public typealias Result = F.Value.Result
    
    enum FieldType {
        case field(key: String, alias: String?, renderedArguments: String?, renderedSubSelection: String?)
        case fragment(rendered: String)
    }
    
    let fieldType: FieldType
    var key: String { "" }//self.alias ?? self.field.key }
    public var items: [AnyFieldAggregate] = []
    public let error: GraphQLError?
    
    public subscript<V>(dynamicMember keyPath: KeyPath<F.Argument, V>) -> (V) -> Add<T, F, SubSelection> {
        return { _ in return self }
    }
    
    public subscript<V>(dynamicMember keyPath: KeyPath<F.Argument, V>) -> (Variable<V>) -> Add<T, F, SubSelection> {
        return { _ in return self }
    }
    
    private static func render(arguments: F.Argument) throws -> String {
        return try argumentString(for: arguments)
    }
    
    internal init(fieldType: FieldType, error: GraphQLError? = nil) {
        self.fieldType = fieldType
        self.error = error
    }
}

extension Add where F.Value: Scalar, SubSelection == EmptySubSelection {
    /// Declares that the given property should be fetched on the queried object.
    public convenience init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil) {
        let field = T.QueryableType()[keyPath: keyPath]
        self.init(fieldType: .field(key: field.key, alias: alias, renderedArguments: nil, renderedSubSelection: nil))
    }
}

extension Add where F.Value: Object, SubSelection.T == F.Value {
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    public convenience init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil, @SubSelectionBuilder subSelection: () -> SubSelection) {
        let field = T.QueryableType()[keyPath: keyPath]
        self.init(fieldType: .field(key: field.key, alias: alias, renderedArguments: nil, renderedSubSelection: subSelection().render()))
    }
}

extension Add where F.Value: Collection, SubSelection.T.QueryableType == F.Value.Element, F.Value.Element: GraphQLCompatibleValue {
    public convenience init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil, @SubSelectionBuilder subSelection: () -> SubSelection) {
        let field = T.QueryableType()[keyPath: keyPath]
        self.init(fieldType:  .field(key: field.key, alias: alias, renderedArguments: nil, renderedSubSelection: subSelection().render()))
    }
}

extension Add {
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
    
    public func renderDebug() throws -> String {
        return ""
    }
    
    public func createResult(from dict: [String : Any]) throws -> F.Value.Result {
        guard let object: Any = dict[self.key] else { throw GraphQLError.malformattedResponse(reason: "Response didn't include key for \(self.key)") }
        return try F.Value.createUnsafeResult(from: object, key: self.key)
    }
}

public struct EmptySubSelection: FieldAggregate {
    public struct T: Object {
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

