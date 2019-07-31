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
    
	/**
	Renders the operation and its sub-selected fields into a string that can be added to a document.
	*/
    func render() -> String {
        let nameString = (self.name == nil) ? "" : " \(self.name!)"
        let opName: String
        if self.operationType == .query && nameString.isEmpty {
            opName = ""
        } else if self.operationType == .query {
            opName = "query\(nameString)"
        } else {
            opName = "mutation\(nameString)"
        }
        let fragmentString = (self.renderedFragments == nil) ? "" : ",\(self.renderedFragments!)"
        return "\(opName){\(self.renderedSubSelections)}\(fragmentString)"
    }
    
	/**
	Renders the operation and its sub-selected fields into a pretty-printed string for debugging.
	*/
    func renderDebug() -> String {
        let ugly = self.render()
    
        var result: String = ""
        
        var tabs = ""
        var isOnArgumentsLine = false
        var previousChar: Character?
        for char in ugly {
            if char == "(" {
                isOnArgumentsLine = true
            }
            
            if char == "{" {
                if previousChar != nil && previousChar != "\n" && previousChar != " " {
                    result.append(" ")
                } else {
                    result.append(tabs)
                }
                isOnArgumentsLine = false
                result.append(char)
                result.append("\n")
                tabs.append("   ")
                result.append(tabs)
            } else if char == "," {
                if isOnArgumentsLine {
                    result.append(", ")
                } else {
                    result.append("\n")
                    result.append(tabs)
                }
            } else if char == "}" {
                tabs.removeLast(3)
                result.append("\n")
                result.append(tabs)
                result.append(char)
            } else if char == ":" {
                result.append(": ")
            } else if char == "\\" {
                continue
            } else {
                result.append(char)
            }
            previousChar = char
        }
        
        return result
    }
    
	/**
	Creates the expected result type from the given raw data.
	*/
    func createResult(from data: Data) throws -> Result {
        guard let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any] else {
            if let dataString = String(data: data, encoding: .utf8) {
                throw GraphQLError.malformattedResponse(reason: "Data wasn't a JSON object: '\(dataString)'")
            } else {
                throw GraphQLError.malformattedResponse(reason: "Data wasn't a JSON object")
            }
        }
        if let errors = jsonResult["errors"] as? [[String: Any]] {
            let errorMessages = errors.map { $0["message"] as? String }.compactMap { $0 }
            throw GraphQLError.invalidRequest(reasons: errorMessages)
        }
        guard let dataDict = jsonResult["data"] as? [String: Any] else {
            throw GraphQLError.malformattedResponse(reason: "JSON result didn't include a 'data' object")
        }
        return try resultCreator(dataDict)
    }
}

//public class ReusableQuery<V, R> {
//    let renderedQuery: String
//    let renderedVariables: [String]
//
//    init(renderedQuery: String, renderedVariables: [String]) {
//        self.renderedQuery = renderedQuery
//        self.renderedVariables = renderedVariables
//    }
//
//    func render(with variables: V) -> (query: String, variables: String) {
//        return (self.renderedQuery, "")
//    }
//}
