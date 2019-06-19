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

public struct Variable<V> {
    public let name: String
    public let value: V
    
    public init(name: String, value: V) {
        self.name = name
        self.value = value
    }
}

@propertyWrapper
public struct Argument<Value> {
    public var wrappedValue: Value!
    let defaultValue: Value?
    
    public init(default: Value? = nil) {
        self.defaultValue = `default`
    }
}

public func `$`<V>(_ name: String, _ value: V) -> Variable<V> {
    return Variable(name: name, value: value)
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
    
    public init<F: FieldAggregate, V1>(name: String? = nil, variables: V1, @SubSelectionBuilder subSelectionBuilder: (V1) -> F) where F.T == QuerySchema, F.Result == Result {
        self.name = name
        let fieldsAggegate = subSelectionBuilder(variables)
        self.error = fieldsAggegate.error
        self.renderedSubSelections = fieldsAggegate.render()
        self.resultCreator = { try fieldsAggegate.createResult(from: $0) }
    }
    
    public init<F: FieldAggregate, V1, V2>(name: String? = nil, variables: V1, _ v2: V2, @SubSelectionBuilder subSelectionBuilder: (V1, V2) -> F) where F.T == QuerySchema, F.Result == Result {
        self.name = name
        let fieldsAggegate = subSelectionBuilder(variables, v2)
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
