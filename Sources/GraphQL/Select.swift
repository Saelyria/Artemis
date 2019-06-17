import Foundation

public protocol AnyFieldValue {
    associatedtype Value: GraphQLCompatibleValue
    associatedtype Argument = Void
    static func string(for argument: Argument) throws -> String
}
public extension AnyFieldValue where Argument == Void {
    static func string(for argument: Argument) -> String {
        return ""
    }
}

//@propertyDelegate
public struct Field<Value: GraphQLCompatibleValue, ArgType>: AnyFieldValue {
    public typealias Argument = ArgType
    
//    public var value: Value!
//    public init(_ argumentType: ArgType.Type) { }
    
    public static func string(for argument: ArgType) throws -> String {
        return try argumentString(for: argument)
    }
}
//public extension Field where ArgType == Void {
//    init() { }
//}

public struct Select<T: Schema, F: AnyFieldValue, SubSelection: FieldAggregate>: FieldAggregate {
    public typealias Result = F.Value.Result
    
    private let alias: String?
    private let keyPath: PartialKeyPath<T.QueryableType>
    private let renderedArguments: String?
    /// The query string of the sub-selection on the requested key. This is `nil` if the key is a scalar value.
    private let renderedSubSelection: String?
    var key: String { self.alias ?? T.string(for: self.keyPath) }
    public var items: [AnyFieldAggregate] = []
    
    public func render() -> String {
        if let renderedSubQuery = self.renderedSubSelection {
            let args: String = (self.renderedArguments == nil) ? "" : "(\(self.renderedArguments!))"
            let name: String = (self.alias == nil) ? T.string(for: self.keyPath) : "\(self.alias!):\(T.string(for: self.keyPath))"
            return "\(name)\(args){\(renderedSubQuery)}"
        }
        return self.key
    }
    
    public let error: GraphQLError?
    
    public func renderDebug() throws -> String {
//        if let renderedSubQuery = self.renderedSubSelection {
//            var args: String = ""
//            if !self.arguments.isEmpty {
//                args = self.arguments.reduce(into: "", { result, arg in
//                    result.append(T.string(for: arg))
//                })
//                args = "(\(args))"
//            }
//            return "\(self.key)\(args) {\n\t\(renderedSubQuery)\n}"
//        }
        return self.key
    }

    public func includedKeyPaths() -> [(String, PartialKeyPath<T.QueryableType>)] {
        return [(self.key, self.keyPath)]
    }
    
    public func createResult(from dict: [String : Any]) throws -> F.Value.Result {
        try Value.createUnsafeResult(from: dict, key: self.key)
    }
    
    private static func render(arguments: F.Argument) throws -> String {
        return try argumentString(for: arguments)
//        return try arguments.map { try Value.string(for: $0) }.joined(separator: ", ")
    }
}

extension Select where F.Value: GraphQLScalarValue, SubSelection == EmptySubSelection<T>, F.Argument == Void {
    /// Declares that the given property should be fetched on the queried object.
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil) {
        self.keyPath = keyPath
        self.alias = alias
        self.renderedSubSelection = nil
        self.renderedArguments = nil
        self.error = nil
    }
}

extension Select where F.Value: GraphQLScalarValue, SubSelection == EmptySubSelection<T> {
    /// Declares that the given property should be fetched on the queried object.
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil, arguments: F.Argument) {
        self.keyPath = keyPath
        self.alias = alias
        self.renderedSubSelection = nil
        
        do {
            self.renderedArguments = try Self.render(arguments: arguments)
            self.error = nil
        } catch {
            self.error = error as? GraphQLError ?? .other(error)
            self.renderedArguments = nil
        }
    }
}

extension Select where F.Value: Schema, SubSelection.T == F.Value, F.Argument == Void {
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil, @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.alias = alias
        self.renderedSubSelection = subSelection().render()
        self.renderedArguments = nil
        self.error = nil
    }
}

extension Select where F.Value: Schema, SubSelection.T == F.Value {
    /// Declares that the given property should be fetched on the queried object, only retrieving the given properties on the property.
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil, arguments: F.Argument, @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.alias = alias
        self.renderedSubSelection = subSelection().render()
        do {
            self.renderedArguments = try Self.render(arguments: arguments)
            self.error = nil
        } catch {
            self.error = error as? GraphQLError ?? .other(error)
            self.renderedArguments = nil
        }
    }
}

extension Select where F.Value: Collection, SubSelection.T.QueryableType == F.Value.Element, F.Value.Element: GraphQLCompatibleValue, F.Argument == Void {
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil, @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.alias = alias
        self.renderedSubSelection = subSelection().render()
        self.renderedArguments = nil
        self.error = nil
    }
}

extension Select where F.Value: Collection, SubSelection.T.QueryableType == F.Value.Element, F.Value.Element: GraphQLCompatibleValue {
    public init(_ keyPath: KeyPath<T.QueryableType, F>, alias: String? = nil, arguments: F.Argument, @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.keyPath = keyPath
        self.alias = alias
        self.renderedSubSelection = subSelection().render()
        do {
            self.renderedArguments = try Self.render(arguments: arguments)
            self.error = nil
        } catch {
            self.error = error as? GraphQLError ?? .other(error)
            self.renderedArguments = nil
        }
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

