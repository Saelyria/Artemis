import Foundation

public class ReusableQuery<V, R> {
    let renderedQuery: String
    let renderedVariables: [String]
    
    init(renderedQuery: String, renderedVariables: [String]) {
        self.renderedQuery = renderedQuery
        self.renderedVariables = renderedVariables
    }
    
    func render(with variables: V) -> (query: String, variables: String) {
        return (self.renderedQuery, "")
    }
}

public protocol AnyVariable {
    associatedtype V: GraphQLCompatibleValue
}
public struct Variable<V: GraphQLCompatibleValue>: AnyVariable {
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}

public func `$`<V: GraphQLCompatibleValue>(_ name: String, _ type: V.Type) -> Variable<V> {
    return Variable<V>(name: name)
}

public class Graph<Q: Object> {
    public init() { }
    
    public func register<R>(
        _ query: () -> Operation<Q, R>)
        -> ReusableQuery<Void, R>
    {
        return ReusableQuery(renderedQuery: query().render(), renderedVariables: [])
    }
    
    public func register<R, V1: AnyVariable>(
        usingVariables v1: V1,
        _ query: (V1) -> Operation<Q, R>)
        -> ReusableQuery<V1.V, R>
    {
        return ReusableQuery(renderedQuery: query(v1).render(), renderedVariables: [])
    }
    
    public func register<R, V1: AnyVariable, V2: AnyVariable>(
        usingVariables v1: V1, _ v2: V2,
        _ query: (V1, V2) -> Operation<Q, R>)
        -> ReusableQuery<(V1.V, V2.V), R>
    {
        return ReusableQuery(renderedQuery: query(v1, v2).render(), renderedVariables: [])
    }
    
    public func register<R, V1: AnyVariable, V2: AnyVariable, V3: AnyVariable>(
        usingVariables v1: V1, _ v2: V2, _ v3: V3,
        _ query: (V1, V2, V3) -> Operation<Q, R>)
        -> ReusableQuery<(V1.V, V2.V, V3.V), R>
    {
        return ReusableQuery(renderedQuery: query(v1, v2, v3).render(), renderedVariables: [])
    }
    
    public func perform<R>(
        _ query: Operation<Q, R>,
        mock: Data? = nil,
        completion: @escaping (Result<R, GraphQLError>) -> Void)
    {
        if let error = query.error {
            assertionFailure("Built query was not valid - \(error)")
        }
        print(query.render())
        if let data = mock {
            do {
                let result = try query.createResult(from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error as! GraphQLError))
            }
        }
    }
    
    public func perform<V, R>(
        _ reusableQuery: ReusableQuery<V, R>,
        variables: V,
        completion: @escaping (Result<R, GraphQLError>) -> Void)
    {
        
    }
}

