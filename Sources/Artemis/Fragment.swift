import Foundation

//public prefix func ...<T, SubSelection>(_ fragment: Fragment<T, SubSelection>) -> SubSelection {
//    return fragment.subSelection
//}

public protocol FragmentProtocol: FieldAggregate, AnyField {
    var name: String { get }
    func render() -> String
}

/**
An object representing a GraphQL 'fragment' that can be added to a sub-selection.
*/
public struct Fragment<T: Object>: FragmentProtocol {
    public typealias Argument = NoArguments
    
    public var key: String = ""
    public typealias Result = Never
    
    public let name: String
    let renderedSubSelection: String
    public var items: [AnyFieldAggregate] = []
    
	/**
	Creates a new frament usable in a sub-selection with the given name, on the given type, selecting the properties
	in the given sub-selection function builder result.
	*/
    public init<SubSelection: FieldAggregate>(_ name: String, on: T.Type, @SubSelectionBuilder subSelection: () -> SubSelection) where SubSelection.T == T {
        self.name = name
		let ss = subSelection()
        self.renderedSubSelection = ss.render()
		self.items = ss.items
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
