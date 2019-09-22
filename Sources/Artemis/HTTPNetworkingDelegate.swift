import Foundation

/**
A networking delegate for a 'client' object that sends GraphQL documents over HTTP to a specific endpoint.
*/
public class HTTPNetworkingDelegate: NetworkDelegate {
    public enum Method {
        case get
        case post
    }
    let endpoint: URL
    let method: Method

    public init(endpoint: URL, method: Method = .post) {
        self.endpoint = endpoint
        self.method = method
    }
    
    public func send(document: String, completion: @escaping (Result<Data, Error>) -> Void) {
        var request: URLRequest
        
        switch self.method {
        case .post:
            request = URLRequest(url: self.endpoint)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            
            let bodyDict = ["query": document]
            guard let httpBody = try? JSONSerialization.data(withJSONObject: bodyDict, options: []) else {
                return
            }
            request.httpBody = httpBody
        case .get:
            var url = URLComponents(url: self.endpoint, resolvingAgainstBaseURL: false)
            url?.queryItems = [URLQueryItem(name: "query", value: document)]
            request = URLRequest(url: url!.url!)
            request.httpMethod = "GET"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(.failure(error ?? GraphQLError.invalidOperation))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
