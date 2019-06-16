import Foundation

public class Graph<Q: Schema> {
    public init() { }
    
    public func perform<U>(_ query: Query<Q, U>, completion: @escaping (U.Result) -> Void) {
        print(query.render())
    }
}

public struct Query<Q, Fields: FieldAggregate> where Fields.T == Q {
    private let aggregateFields: Fields
    private let name: String?
    
    public init(name: String? = nil, @SubSelectionBuilder subSelectionBuilder: () -> Fields) {
        self.name = name
        self.aggregateFields = subSelectionBuilder()
    }
    
    func render() -> String {
        return "query \(self.name?.appending(" ") ?? ""){ \(self.aggregateFields.render()) }"
    }
}
