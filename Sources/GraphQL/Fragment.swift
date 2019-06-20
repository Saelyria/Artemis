import Foundation

public prefix func ...<T, SubSelection>(_ fragment: Fragment<T, SubSelection>) -> SubSelection {
    return fragment.subSelection
}

public protocol AnyFragment: FieldAggregate, AnyField {
    associatedtype SubSelection: FieldAggregate
}

public struct Fragment<T, SubSelection: FieldAggregate>: AnyFragment where SubSelection.T == T {
    public typealias Argument = Void
    
    public var key: String = ""
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
    
    public func render() -> String {
        return ""
    }
    
    public func createResult(from: [String : Any]) throws -> Never {
        fatalError()
    }
    
    public static func string(for argument: ()) throws -> String {
        return ""
    }
}
