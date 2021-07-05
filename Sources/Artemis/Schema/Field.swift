import Foundation

/**
An object containing the information about a field on a GraphQL type.

Instances of this type are added as properties on a GraphQL type to represent the fields that can be queried or mutated
on that oject. Via generic associated types, `Field` objects contain type information for the value that is returned
when this field is queried as well as the type whose properties represent the arguments to this field.
*/
public struct Field<Value: SelectionOutput, ArgType: ArgumentsList> {
    public typealias Argument = ArgType
    
	/// The string name of the field as it should appear in a document.
    public let key: String

	public init(_ key: String) {
        self.key = key
    }
}

/**
A protocol that a type whose properties represent arguments for a `Field` must conform to.
*/
public protocol ArgumentsList {
    init()
}

/**
A type that can be used with a `Field` instance to indicate that the field takes no arguments.
*/
public struct NoArguments: ArgumentsList {
    public init() { }
}

/**
An object containing the information about an argument on a field.
*/
public struct Argument<Value: SelectionInput> {
	/// The string name of the argument as it should appear in a document.
    public let name: String
    let defaultValue: Value?
    
    public init(_ name: String, default: Value? = nil) {
        self.name = name
        self.defaultValue = `default`
    }
    
	/**
	Renders the argument into a string that can be added to a rendered field in a document.
	*/
    func render(value: Value) -> String {
        return "\(name):\(value.render())"
    }
    
	/**
	Renders the argument into a string that can be added to a rendered field in a document.
	*/
//    func render(value: Variable<Value>) -> String {
//        return "\(name):\(value.name)"
//    }
}
