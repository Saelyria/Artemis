import Foundation

public class Graph<Q: Schema> {
    public init() { }
    
    public func perform<R>(_ query: Query<Q, R>, mock: Data? = nil, completion: @escaping (Result<R, GraphQLError>) -> Void) {
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

public struct Query<QuerySchema, Result> {
    private let name: String?
    let error: GraphQLError?
    let resultCreator: ([String: Any]) throws -> Result
    let renderedSubSelections: String
    
    public init<F: FieldAggregate>(name: String? = nil, @SubSelectionBuilder subSelectionBuilder: () -> F) where F.T == QuerySchema, F.Result == Result {
        self.name = name
        let fieldsAggegate = subSelectionBuilder()
        self.error = fieldsAggegate.error
        self.renderedSubSelections = fieldsAggegate.render()
        self.resultCreator = { try fieldsAggegate.createResult(from: $0) }
    }
    
    public init<F: FieldAggregate, Var>(name: String? = nil, variables: Var, @SubSelectionBuilder subSelectionBuilder: (Var) -> F) where F.T == QuerySchema, F.Result == Result {
        self.name = name
        let fieldsAggegate = subSelectionBuilder(variables)
        self.error = fieldsAggegate.error
        self.renderedSubSelections = fieldsAggegate.render()
        self.resultCreator = { try fieldsAggegate.createResult(from: $0) }
    }
    
    func render() -> String {
        let nameString = (self.name == nil) ? "" : " \(self.name!)"
        return "query\(nameString){\(self.renderedSubSelections)}"
    }
    
    func createResult(from data: Data) throws -> Result {
        guard let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any] else {
            throw GraphQLError.malformattedResponse(reason: "Data wasn't a JSON object")
        }
        guard let dataDict = jsonResult["data"] as? [String: Any] else {
            throw GraphQLError.malformattedResponse(reason: "JSON result didn't include a 'data' object")
        }
        return try resultCreator(dataDict)
    }
}
