import Foundation

@propertyWrapper
public struct Argument<Value: GraphQLCompatibleValue> {
    public var wrappedValue: Value!
    let defaultValue: Value?
    
    public init() {
        self.defaultValue = nil
    }
    
    public init(default: Value? = nil) {
        self.defaultValue = `default`
    }
}

public struct Operation<QuerySchema, Result> {
    public enum OperationType {
        case query
        case mutation
    }
    
    private let name: String?
    let error: GraphQLError?
    let resultCreator: ([String: Any]) throws -> Result
    let renderedSubSelections: String
    public let operationType: OperationType
    
    public init<F: FieldAggregate>(_ type: OperationType, name: String? = nil, @SubSelectionBuilder subSelectionBuilder: () -> F) where F.T == QuerySchema, F.Result == Result {
        self.operationType = type
        self.name = name
        let fieldsAggegate = subSelectionBuilder()
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
