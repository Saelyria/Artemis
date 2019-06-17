import Foundation

public class Graph<Q: Schema> {
    public init() { }
    
    public func perform<U>(_ query: Query<Q, U>, completion: @escaping (U.Result) -> Void) {
        if let error = query.error {
            assertionFailure("Built query was not valid - \(error)")
        }
        print(query.render())
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
        return "query \(self.name?.appending(" ") ?? ""){ \(self.aggregateFields.render()) }"
    }
}
