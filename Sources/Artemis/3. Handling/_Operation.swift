import Foundation

/**
 An object that represents an operation (either a query or mutation) performed with a GraphQL API.

 Operation objects are used with `Client` objects to make requests with a GraphQL API. In this relationship, operations
 describe the GraphQL request document by being created with the selected fields. Operations are instantiated using the
 static `query` and `mutation` functions.

 These objects are generally created inside a `Client.perform(_:completion:)` method call so that their `Schema` and
 `Result` types can be inferred from the selections done inside their function builders.
*/
public struct _Operation<FullSchema: Schema, Result> {
    enum OperationType {
		case query
		case mutation
	}

	private let name: String?
	let error: GraphQLError?
	let resultCreator: ([String: Any]) throws -> Result
	let renderedSelectionSets: String
	let renderedFragments: String
    let operationType: OperationType

    fileprivate init<Q: Object>(
        _ type: OperationType,
        on: Q.Type,
        name: String? = nil,
        @_SelectionSetBuilder<Q> _ selection: (_Selector<Q>) -> _SelectionSet<Result>
    ) {
		self.operationType = type
		self.name = name
		let fieldsAggegate = selection(_Selector<Q>())
		self.error = fieldsAggegate.error
		self.renderedSelectionSets = fieldsAggegate.render()
		self.resultCreator = { try fieldsAggegate.createResult(from: $0) }
		self.renderedFragments = Set(fieldsAggegate.renderedFragmentDeclarations).sorted().joined(separator: ",")
	}

	func render() -> String {
        var nameString = ""
        if let name = self.name {
            nameString = " \(name)"
        }
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

extension _Operation {
    /**
     Creates a query operation with the given field selection.
     - parameter name: An optional debug name for the operation sent along with the document.
     - parameter selection: The selected set of fields to include with the document.
     */
    public static func query<S: Schema, R>(
        name: String? = nil,
        @_SelectionSetBuilder<S.QueryType> _ selection: (_Selector<S.QueryType>) -> _SelectionSet<R>
    ) -> _Operation<S, R> {
        return _Operation<S, R>(.query, on: S.QueryType.self, name: name, selection)
    }

    /**
     Creates a mutation operation with the given field selection.
     - parameter name: An optional debug name for the operation sent along with the document.
     - parameter selection: The selected set of fields to include with the document.
     */
    public static func mutation<S: Schema, R>(
        name: String? = nil,
        @_SelectionSetBuilder<S.MutationType> _ selection: (_Selector<S.MutationType>) -> _SelectionSet<R>
    ) -> _Operation<S, R> where S.MutationType: Object {
        return _Operation<S, R>(.mutation, on: S.MutationType.self, name: name, selection)
    }

    /**
     Creates a query operation with the given field selection.
     - parameter name: An optional debug name for the operation sent along with the document.
     - parameter selection: The selected set of fields to include with the document.
     */
    public static func query<S: Schema, R>(
        name: String? = nil,
        @_SelectionSetBuilder<S.QueryType> _ selection: () -> _SelectionSet<R>
    ) -> _Operation<S, R> {
        return _Operation<S, R>(.query, on: S.QueryType.self, name: name, { _ in return selection() })
    }

    /**
     Creates a mutation operation with the given field selection.
     - parameter name: An optional debug name for the operation sent along with the document.
     - parameter selection: The selected set of fields to include with the document.
     */
    public static func mutation<S: Schema, R>(
        name: String? = nil,
        @_SelectionSetBuilder<S.MutationType> _ selection: () -> _SelectionSet<R>
    ) -> _Operation<S, R> where S.MutationType: Object {
        return _Operation<S, R>(.mutation, on: S.MutationType.self, name: name, { _ in return selection() })
    }
}
