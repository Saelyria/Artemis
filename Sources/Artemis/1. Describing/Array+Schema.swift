import Foundation

extension Array: Object where Element: Object {
    public typealias SubSchema = Element.SubSchema
}

extension Array: ObjectSchema where Element: ObjectSchema { }

extension Array: SelectionOutput where Element: SelectionOutput {
    public typealias Result = [Element.Result]

    public static func createUnsafeResult<R>(from object: Any, key: String) throws -> R {
        guard R.self == Result.self else { throw GraphQLError.invalidOperation }
        guard let resultArray = object as? [Any] else { throw GraphQLError.arrayParseFailure(operation: key) }
        let mappedArray: [Element.Result] = try resultArray.map { try Element.createUnsafeResult(from: $0, key: key) }
        guard let returnedArray = mappedArray as? R else { throw GraphQLError.arrayParseFailure(operation: key) }
        return returnedArray
    }
}
extension Array: SelectionInput where Element: SelectionInput {
    public func render() -> String {
        return "[\(self.map { $0.render() }.joined(separator: ","))]"
    }
}
extension Array {
    public static var `default`: [Element] { [] }
}
