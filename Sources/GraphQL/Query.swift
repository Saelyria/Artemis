import Foundation

public struct Operation<Schema, Result> {
    public enum OperationType {
        case query
        case mutation
    }
    
    private let name: String?
    let error: GraphQLError?
    let resultCreator: ([String: Any]) throws -> Result
    let renderedSubSelections: String
    let renderedFragments: String?
    public let operationType: OperationType
    
    public init<F: FieldAggregate>(_ type: OperationType, name: String? = nil, @SubSelectionBuilder _ subSelection: () -> F) where F.T == Schema, F.Result == Result {
        self.operationType = type
        self.name = name
        let fieldsAggegate = subSelection()
        self.error = fieldsAggegate.error
        self.renderedSubSelections = fieldsAggegate.render()
        self.resultCreator = { try fieldsAggegate.createResult(from: $0) }
        self.renderedFragments = nil
    }
    
    public init<F: FieldAggregate, FR>(
        _ type: OperationType,
        name: String? = nil,
        @SubSelectionBuilder _ subSelection: (FR) -> F,
        @FragmentBuilder fragments: () -> (String, FR))
        where F.T == Schema, F.Result == Result
    {
        self.operationType = type
        self.name = name
        let (renderedFrags, frags) = fragments()
        let fieldsAggegate = subSelection(frags)
        self.error = fieldsAggegate.error
        self.renderedSubSelections = fieldsAggegate.render()
        self.resultCreator = { try fieldsAggegate.createResult(from: $0) }
        self.renderedFragments = renderedFrags
    }
    
    func render() -> String {
        let nameString = (self.name == nil) ? "" : " \(self.name!)"
        let fragmentString = (self.renderedFragments == nil) ? "" : ",\(self.renderedFragments!)"
        return "query\(nameString){\(self.renderedSubSelections)}\(fragmentString)"
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

