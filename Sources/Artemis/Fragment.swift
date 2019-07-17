import Foundation

//public prefix func ...<T, SubSelection>(_ fragment: Fragment<T, SubSelection>) -> SubSelection {
//    return fragment.subSelection
//}

public protocol FragmentProtocol: FieldAggregate, AnyField { //AnyFragmentAggregate
    var name: String { get }
    func render() -> String
}

public struct Fragment<T: Object>: FragmentProtocol {
    public typealias Argument = NoArguments
    
    public var key: String = ""
    public typealias Result = Never
    
    public let name: String
    let renderedSubSelection: String
    public var items: [AnyFieldAggregate] = []
    
    public init<SubSelection: FieldAggregate>(_ name: String, on: T.Type, @SubSelectionBuilder subSelection: () -> SubSelection) where SubSelection.T == T {
        self.name = name
        self.renderedSubSelection = subSelection().render()
    }
    
    public func render() -> String {
        return "fragment \(self.name) on \(String(describing: T.self)){\(self.renderedSubSelection)}"
    }
    
    public func createResult(from: [String : Any]) throws -> Never {
        fatalError()
    }
    
    public static func string(for argument: NoArguments) throws -> String {
        return ""
    }
}
