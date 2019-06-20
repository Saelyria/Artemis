import Foundation

public prefix func ...<T, SubSelection>(_ fragment: Fragment<T, SubSelection>) -> SubSelection {
    return fragment.subSelection
}

public protocol AnyFragment {
    associatedtype T: Schema
}

public struct Fragment<T, SubSelection: FieldAggregate>: FieldAggregate where SubSelection.T == T {
    public typealias Result = Never
    
    public var items: [AnyFieldAggregate] = []
    let subSelection: SubSelection
    
    public init(_ name: String, on: T.Type, @SubSelectionBuilder subSelection: () -> SubSelection) {
        self.subSelection = subSelection()
        //        self.keyPath = keyPath
        //        self.alias = alias
        //        self.renderedSubSelection = subSelection().render()
        //        self.renderedArguments = nil
        //        self.error = nil
        //        self.field = T.QueryableType()[keyPath: keyPath]
    }
    
    public func createResult(from: [String : Any]) throws -> Never {
        fatalError()
    }
}
