import Foundation

public class Graph<Q: Schema> {
    public init() { }
    
    public func perform<U>(_ query: Query<Q, U>, completion: @escaping (U.Result) -> Void) {
        
    }
}

public struct Query<Q, AggregateItems: FieldAggregate> where AggregateItems.T == Q {
    public init(name: String? = nil, @SubSelectionBuilder query: () -> AggregateItems) {
        print(query().render())
    }
}
