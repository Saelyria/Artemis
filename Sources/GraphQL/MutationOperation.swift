import Foundation

/*
struct Mutation<O: AnyAggregateOperation & Mutating> {
    private let operations: O
    private let name: String?
    
    init(name: String? = nil, @MutationOperationBuilder _ operationsBuilder: () -> O) {
        self.name = name
        self.operations = operationsBuilder()
    }
    
    func render() -> String {
        if let name = self.name {
            return "query \(name) { \(self.operations.render()) }"
        }
        return "query { \(self.operations.render()) }"
    }
    
    func createResult(from dict: [String: Any]) -> Result<O.Result, GraphQLError> {
        do {
            guard let dataDict = dict["data"] as? [String: Any] else {
                return Result.failure(.malformattedResponse(reason: "The response JSON did not have a 'data' object"))
            }
            let result = try operations.createResult(from: dataDict)
            return Result.success(result)
        } catch {
            let graphQLError = error as? GraphQLError ?? GraphQLError.other(error)
            return Result.failure(graphQLError)
        }
    }
}

/// A top-level query type. This is where we declare the type of object we want to start querying properties on.
class MutationOperation<T: Queryable>: AnyMutationOperation, AnyAggregateOperation, GraphQLItem, Mutating {
    func unsafeIncludedKeyPaths() -> [(String, AnyKeyPath)] {
        return self.aggregateItems.unsafeIncludedKeyPaths()
    }
    
    typealias Result = T.Result
    
    static var name: String {
        return String(describing: Self.self).enumerated().reduce(into: "", { (result, element) in
            let char = (element.offset == 0) ? element.element.lowercased().first! : element.element
            result.append(char)
        })
    }
    
    var alias: String?
    private let renderedSubQuery: String
    private let aggregateItems: AnyGraphQLItem
    fileprivate let arguments: [T.Args]
    
    required init() {
        fatalError()
    }
    
    required init(alias: String?, renderedSubQuery: String, aggregateItems: AnyGraphQLItem, arguments: [T.Args]) {
        self.alias = alias
        self.renderedSubQuery = renderedSubQuery
        self.aggregateItems = aggregateItems
        self.arguments = arguments
    }
    
    func render() -> String {
        let opName: String
        if let alias = self.alias {
            opName = "\(alias): \(Self.name)"
        } else {
            opName = Self.name
        }
        
        var args: String = ""
        if !self.arguments.isEmpty {
            args = self.arguments.reduce(into: "", { result, arg in
                result.append(T.string(for: arg))
            })
            args = "(\(args))"
        }
        
        return "\(opName)\(args) { \(self.renderedSubQuery) }"
    }
    
    func renderDebug() -> String {
        let opName: String
        if let alias = self.alias {
            opName = "\(alias): \(Self.name)"
        } else {
            opName = Self.name
        }
        
        var args: String = ""
        if !self.arguments.isEmpty {
            args = self.arguments.reduce(into: "", { result, arg in
                result.append(T.string(for: arg))
            })
            args = "(\(args))"
        }
        
        return "\(opName)\(args) { \(self.renderedSubQuery) }"
    }
    
    func includedKeyPaths() -> [(String, PartialKeyPath<T.QueryableType>)] {
        return self.aggregateItems.unsafeIncludedKeyPaths() as? [(String, PartialKeyPath<T.QueryableType>)] ?? []
    }
    
    func createResult(from rawDict: [String : Any]) throws -> Result {
        return try T.createResult(from: rawDict, key: self.alias ?? Self.name)
    }
}

protocol AnyMutationOperation: Mutating {
    associatedtype T: Queryable
    
    static var name: String { get }
    var alias: String? { get set }
    
    init()
    init(alias: String?, renderedSubQuery: String, aggregateItems: AnyGraphQLItem, arguments: [T.Args])
}

extension AnyMutationOperation {
    static var name: String {
        return String(describing: Self.self).enumerated().reduce(into: "", { (result, element) in
            let char = (element.offset == 0) ? element.element.lowercased().first! : element.element
            result.append(char)
        })
    }
    
    init<Q: GraphQLItem & Mutating>(alias: String? = nil, @MutationBuilder query: () -> Q) where Q.T == T {
        let items = query()
        self.init(alias: alias, renderedSubQuery: items.render(), aggregateItems: items, arguments: [])
    }
    
    init<Q: GraphQLItem & Mutating>(alias: String? = nil, arguments: T.Args..., @MutationBuilder query: () -> Q) where Q.T == T {
        let items = query()
        self.init(alias: alias, renderedSubQuery: items.render(), aggregateItems: items, arguments: arguments)
    }
}
*/
