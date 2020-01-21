import Foundation

// MARK: - Adding fragments of conforming types to an interface sub-selection

public extension Add where SS == EmptySelectionSet, F: FragmentProtocol, F.T.Schema.ImplementedInterfaces.I1 == T {
	/**
	Adds the fields from the given fragment to the document.
	
	- parameter fragment: The fragment containing the selected fields.
	*/
    convenience init(fieldsOn fragment: F) {
		self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SS == EmptySelectionSet, F: FragmentProtocol, F.T.Schema.ImplementedInterfaces.I2 == T {
	/**
	Adds the fields from the given fragment to the document.
	
	- parameter fragment: The fragment containing the selected fields.
	*/
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SS == EmptySelectionSet, F: FragmentProtocol, F.T.Schema.ImplementedInterfaces.I3 == T {
	/**
	Adds the fields from the given fragment to the document.
	
	- parameter fragment: The fragment containing the selected fields.
	*/
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SS == EmptySelectionSet, F: FragmentProtocol, F.T.Schema.ImplementedInterfaces.I4 == T {
	/**
	Adds the fields from the given fragment to the document.
	
	- parameter fragment: The fragment containing the selected fields.
	*/
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SS == EmptySelectionSet, F: FragmentProtocol, F.T.Schema.ImplementedInterfaces.I5 == T {
	/**
	Adds the fields from the given fragment to the document.
	
	- parameter fragment: The fragment containing the selected fields.
	*/
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}


// MARK: - Adding fragments of conformed interfaces to a type sub-selection

public extension Add where SS == EmptySelectionSet, F: FragmentProtocol, F.T == T {
	/**
	Adds the fields from the given fragment to the document.
	
	- parameter fragment: The fragment containing the selected fields.
	*/
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SS == EmptySelectionSet, F: FragmentProtocol, F.T == T.Schema.ImplementedInterfaces.I1 {
	/**
	Adds the fields from the given fragment to the document.
	
	- parameter fragment: The fragment containing the selected fields.
	*/
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SS == EmptySelectionSet, F: FragmentProtocol, F.T == T.Schema.ImplementedInterfaces.I2 {
	/**
	Adds the fields from the given fragment to the document.
	
	- parameter fragment: The fragment containing the selected fields.
	*/
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SS == EmptySelectionSet, F: FragmentProtocol, F.T == T.Schema.ImplementedInterfaces.I3 {
	/**
	Adds the fields from the given fragment to the document.
	
	- parameter fragment: The fragment containing the selected fields.
	*/
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SS == EmptySelectionSet, F: FragmentProtocol, F.T == T.Schema.ImplementedInterfaces.I4 {
	/**
	Adds the fields from the given fragment to the document.
	
	- parameter fragment: The fragment containing the selected fields.
	*/
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SS == EmptySelectionSet, F: FragmentProtocol, F.T == T.Schema.ImplementedInterfaces.I5 {
	/**
	Adds the fields from the given fragment to the document.
	
	- parameter fragment: The fragment containing the selected fields.
	*/
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
