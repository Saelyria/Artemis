import Foundation

/**
An object that represents an operation (either a query or mutation) performed with a GraphQL API.

Operation objects are used with `Client` objects to make requests with a GraphQL API. In this relationship, operations
describe the GraphQL request document by being created with the selected fields via `Add` objects.

These objects are generally created inside a `Client.perform(_:completion:)` method call so that their `Schema` and
`Result` types can be inferred from the selections done inside their function builders.
*/
public struct Operation<Schema: Object, Result> {
	/// A type of GraphQL operation.
	public enum OperationType {
		/// An operation that is meant to query data from a GraphQL API.
		case query
		/// An operation that is meant to mutate (either update or add) data in a GraphQL API.
		case mutation
	}
	
	private let name: String?
	let error: GraphQLError?
	let resultCreator: ([String: Any]) throws -> Result
	let renderedSelectionSets: String
	let renderedFragments: String
	/// The type of GraphQL operation this operation will perform.
	public let operationType: OperationType
	
	/**
	Creates a new operation using the selection set from the given function builder.
	
	- parameter type: The type of this operation.
	- parameter name: The optional name of this operation, used mainly for debugging and logging purposes.
	- parameter selection: A function builder of `Add` objects that selects the fields to include in the response to
	this operation.
	*/
    public init<S: Selection>(_ type: OperationType, name: String? = nil, @SelectionSetBuilder<Schema> _ selection: () -> S) where S.Result == Result {
		self.operationType = type
		self.name = name
		let fieldsAggegate = selection()
		self.error = fieldsAggegate.error
		self.renderedSelectionSets = fieldsAggegate.render()
		self.resultCreator = { try fieldsAggegate.createResult(from: $0) }
		self.renderedFragments = Set(fieldsAggegate.renderedFragmentDeclarations).sorted().joined(separator: ",")
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
		let fragmentString = (self.renderedFragments.isEmpty) ? "" : ",\(self.renderedFragments)"
		return "\(opName){\(self.renderedSelectionSets)}\(fragmentString)"
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
