import Foundation

//class GraphQL {
//    func perform<O: AnyAggregateOperation & Querying>(
//        _ query: QueryObject<O>,
//        mock filename: String? = nil,
//        completion: @escaping (Result<O.Result, GraphQLError>) -> Void)
//    {
//        print(query.render())
//        if let filename = filename {
//            guard let path = Bundle.main.path(forResource: filename, ofType: "json"),
//                let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
//                let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any]
//                else { return }
//            completion(query.createResult(from: jsonResult))
//        }
//    }
//
//    func perform<O: AnyAggregateOperation & Mutating>(
//        _ mutation: Mutation<O>,
//        mock filename: String? = nil,
//        completion: @escaping (Result<O.Result, GraphQLError>) -> Void)
//    {
//        print(mutation.render())
//        if let filename = filename {
//            guard let path = Bundle.main.path(forResource: filename, ofType: "json"),
//                let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
//                let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any]
//                else { return }
//            completion(mutation.createResult(from: jsonResult))
//        }
//    }
//}


public class Graph<Q: Queryable> {
    public init() { }
    
    public func perform<U>(_ query: Query<Q, U>, completion: @escaping (U.T) -> Void) {
        
    }
}

public struct Query<Q, AggregateItems: GraphQLItem> where AggregateItems.T == Q {
    public init(name: String? = nil, @QuerySubSelectionBuilder query: () -> AggregateItems) {
        
    }
}
