import Foundation

public class HTTPNetworkingDelegate: NetworkDelegate {
    let endpoint: URL

    public init(endpoint: URL) {
        self.endpoint = endpoint
    }
    
    public func send(document: String, completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: self.endpoint)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let bodyDict = ["query": document]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: bodyDict, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion(.failure(error ?? GraphQLError.invalidOperation))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
