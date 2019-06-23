import Foundation

//public prefix func ...<T, SubSelection>(_ fragment: Fragment<T, SubSelection>) -> SubSelection {
//    return fragment.subSelection
//}

public protocol AnyFragment: FieldAggregate, AnyField {

}

public struct Fragment<T: Object>: AnyFragment  {
    public typealias Argument = NoArguments
    
    public var key: String = ""
    public typealias Result = Never
    
    public var items: [AnyFieldAggregate] = []
    
    public init<SubSelection: FieldAggregate>(_ name: String, on: T.Type, @SubSelectionBuilder subSelection: () -> SubSelection) where SubSelection.T == T {
//        self.subSelection = subSelection()
    }
    
    public func render() -> String {
        return ""
    }
    
    public func createResult(from: [String : Any]) throws -> Never {
        fatalError()
    }
    
    public static func string(for argument: NoArguments) throws -> String {
        return ""
    }
}
