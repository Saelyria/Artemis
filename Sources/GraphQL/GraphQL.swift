import Foundation

public class Graph<Q: Schema> {
    public init() { }
    
    public func perform<U>(_ query: Query<Q, U>, mock: Data? = nil, completion: @escaping (Result<U.Result, GraphQLError>) -> Void) {
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
}

public struct Query<Q, Fields: FieldAggregate> where Fields.T == Q {
    private let aggregateFields: Fields
    private let name: String?
    let error: GraphQLError?
    
    public init(name: String? = nil, @SubSelectionBuilder subSelectionBuilder: () -> Fields) {
        self.name = name
        self.aggregateFields = subSelectionBuilder()
        self.error = self.aggregateFields.error
    }
    
    func render() -> String {
        let nameString = (self.name == nil) ? "" : " \(self.name!)"
        return "query\(nameString){\(self.aggregateFields.render())}"
    }
    
    func createResult(from data: Data) throws -> Fields.Result {
        guard let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any] else {
            throw GraphQLError.malformattedResponse(reason: "Data wasn't a JSON object")
        }
        guard let dataDict = jsonResult["data"] as? [String: Any] else {
            throw GraphQLError.malformattedResponse(reason: "JSON result didn't include a 'data' object")
        }
        return try aggregateFields.createResult(from: dataDict)
    }
}
