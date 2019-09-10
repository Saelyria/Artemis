import Foundation

/**
An object that can make network requests for a `Client` object.

Custom objects conforming to this protocol can be used to send GraphQL documents to an API in a custom way (for example,
if you want to send them via a custom application layer protocol or sockets directly over TCP).
*/
public protocol NetworkDelegate {
	/**
	Has the network delegate send the given GraphQL document string to the server, calling the given completion handler
	with the resulting raw data.
	
	- parameter document: The parsed GraphQL document to send.
	- parameter completion: A completion handler that is called with either the resulting request data or an error.
	*/
    func send(document: String, completion: @escaping (Result<Data, Error>) -> Void)
}

//public protocol AnyVariable {
//    associatedtype V: SelectionInput
//}
//public struct Variable<V: SelectionInput>: AnyVariable {
//    public let name: String
//
//    public init(name: String) {
//        self.name = name
//    }
//}
//
//public func `$`<V: SelectionInput>(_ name: String, _ type: V.Type) -> Variable<V> {
//    return Variable<V>(name: name)
//}

/**
An object that can interact with a GraphQL API.

Client objects are the base object used to make requests to a GraphQL API. You should generally keep one instance of
this object that all interaction with your GraphQL API via a singleton, SwiftUI environment object, or through other
dependency management.

Client objects will parse `Operation` objects into document strings, then use a 'network delegate' to attach the
rendered document and perform the actual networking. The network delegate will give back the raw `Data` from the
response, which the client object will then turn into the appropriate result type (likely a `Partial` wrapper of the
expected query selection type).
*/
open class Client<Q: Object> {
	/**
	The object that performs the actual network requests for this client.
	*/
    public let networkDelegate: NetworkDelegate
	/**
	Whether the client logs requests and responses.
	*/
	public var loggingEnabled: Bool = true

	/**
	Creates a new client object that sends operations to the given URL.
	
	When using this initializer, the client object will use a default `HTTPNetworkingDelegate` as its network delegate.
	Customization of sent requests can optionally be done by providing the HTTP method (either GET or POST) that
	requests will use, as well as an optional 'request builder' closure that all new request objects will be given to
	after being setup. You can use this method to do things like attach authorization headers.
	
	- parameter endpoint: The full URL for your GraphQL network API. Required.
	- parameter method: The HTTP method (GET or POST) that the client should use to send requests to the given endpoint.
		If not provided, the default is `.post`, meaning it will attach GraphQL documents to the body of the request.
	- parameter requestBuilder: A closure the client will call with all newly-created request objects to allow headers
		or other values to be customized. The request object will already be populated with the GraphQL document,
		default headers, and the endpoint.
	*/
	public init(endpoint: URL, method: HTTPNetworkingDelegate.Method = .post, requestBuilder: ((_ request: URLRequest) -> Void)? = nil) {
		self.networkDelegate = HTTPNetworkingDelegate(endpoint: endpoint, method: .post)
	}
    
	/**
	Creates a new client object that sends requests through the given network delegate.
	
	When using this initializer, all requests for the client to perform API requests will be routed to the given
	network delegate. This method can be used if networking to your GraphQL API is not done over HTTP (for example, if
	you're using sending the document string directly over a transport layer protocol).
	
	- parameter networkDelegate: An object conforming to `NetworkDelegate` that will accept GraphQL document strings
		and send them to the server on behalf of the client object.
	*/
    public init(networkDelegate: NetworkDelegate) {
        self.networkDelegate = networkDelegate
    }
    
//    public func register<R>(
//        _ query: () -> Operation<Q, R>)
//        -> ReusableQuery<Void, R>
//    {
//        return ReusableQuery(renderedQuery: query().render(), renderedVariables: [])
//    }
//
//    public func register<R, V1: AnyVariable>(
//        usingVariables v1: V1,
//        _ query: (V1) -> Operation<Q, R>)
//        -> ReusableQuery<V1.V, R>
//    {
//        return ReusableQuery(renderedQuery: query(v1).render(), renderedVariables: [])
//    }
//
//    public func register<R, V1: AnyVariable, V2: AnyVariable>(
//        usingVariables v1: V1, _ v2: V2,
//        _ query: (V1, V2) -> Operation<Q, R>)
//        -> ReusableQuery<(V1.V, V2.V), R>
//    {
//        return ReusableQuery(renderedQuery: query(v1, v2).render(), renderedVariables: [])
//    }
//
//    public func register<R, V1: AnyVariable, V2: AnyVariable, V3: AnyVariable>(
//        usingVariables v1: V1, _ v2: V2, _ v3: V3,
//        _ query: (V1, V2, V3) -> Operation<Q, R>)
//        -> ReusableQuery<(V1.V, V2.V, V3.V), R>
//    {
//        return ReusableQuery(renderedQuery: query(v1, v2, v3).render(), renderedVariables: [])
//    }
    
	/**
	Performs the given GraphQL operation.
	
	When this method is called, the client object will render the given GraphQL operation into a document string then
	have its 'network delegate' object send the document to its backend service to perform. When the service response
	returns, the object is parsed and returned as an appropriate `Result` type.
	
	- parameter operation: The GraphQL operation to perform.
	- parameter mock:
	*/
    open func perform<R>(
        _ operation: Operation<Q, R>,
        mock: Data? = nil,
        completion: @escaping (Result<R, GraphQLError>) -> Void)
    {
        if let error = operation.error {
            assertionFailure("Built query was not valid - \(error)")
			return
        }
        if let data = mock {
            do {
				if self.loggingEnabled,
				let object = try? JSONSerialization.jsonObject(with: data, options: []),
				let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
				let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
					print("Artemis - mock response:\n\(prettyPrintedString)")
				}
                let result = try operation.createResult(from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error as! GraphQLError))
            }
        } else {
			if self.loggingEnabled { print("Artemis - fetching query:\n\(operation.renderDebug())") }
            self.networkDelegate.send(document: operation.render()) { [weak self] rawResult in
                do {
                    let data = try rawResult.get()
					if self?.loggingEnabled == true,
					let object = try? JSONSerialization.jsonObject(with: data, options: []),
                    let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
                    let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                        print("Artemis - received response:\n\(prettyPrintedString)")
                    }
                    let result = try operation.createResult(from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error as? GraphQLError ?? GraphQLError.other(error)))
                }
            }
        }
    }
    
//    open func perform<V, R>(
//        _ reusableQuery: ReusableQuery<V, R>,
//        variables: V,
//        completion: @escaping (Result<R, GraphQLError>) -> Void)
//    {
//        
//    }
}

private extension Data {
    var prettyPrintedJSONString: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
