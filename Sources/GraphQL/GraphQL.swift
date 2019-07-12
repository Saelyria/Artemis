import Foundation

public protocol NetworkDelegate {
    func send(document: String, completion: @escaping (Result<Data, Error>) -> Void)
}

public protocol AnyVariable {
    associatedtype V: SelectionInput
}
public struct Variable<V: SelectionInput>: AnyVariable {
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}

public func `$`<V: SelectionInput>(_ name: String, _ type: V.Type) -> Variable<V> {
    return Variable<V>(name: name)
}

open class Graph<Q: Object> {
    public let networkDelegate: NetworkDelegate
    
    public init(endpoint: URL, method: HTTPNetworkingDelegate.Method = .post) {
        self.networkDelegate = HTTPNetworkingDelegate(endpoint: endpoint, method: method)
    }
    
    public init(networkDelegate: NetworkDelegate) {
        self.networkDelegate = networkDelegate
    }
    
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
    
    open func perform<R>(
        _ query: Operation<Q, R>,
        mock: Data? = nil,
        completion: @escaping (Result<R, GraphQLError>) -> Void)
    {
        if let error = query.error {
            assertionFailure("Built query was not valid - \(error)")
        }
        if let data = mock {
            do {
                let result = try query.createResult(from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error as! GraphQLError))
            }
        } else {
            print("Fetching query:\n\(query.renderDebug())")
            self.networkDelegate.send(document: query.render()) { rawResult in
                do {
                    let data = try rawResult.get()
                    if let object = try? JSONSerialization.jsonObject(with: data, options: []),
                    let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
                    let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                        print("Received response:\n\(prettyPrintedString)")
                    }
                    let result = try query.createResult(from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error as? GraphQLError ?? GraphQLError.other(error)))
                }
            }
        }
    }
    
    open func perform<V, R>(
        _ reusableQuery: ReusableQuery<V, R>,
        variables: V,
        completion: @escaping (Result<R, GraphQLError>) -> Void)
    {
        
    }
}

private extension Data {
    var prettyPrintedJSONString: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
