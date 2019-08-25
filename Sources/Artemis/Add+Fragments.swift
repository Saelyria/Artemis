import Foundation

// MARK: - Adding fragments of conforming types to an interface sub-selection

public extension Add where SubSelection == EmptySubSelection, F: FragmentProtocol, F.T.Schema.ImplementedInterfaces.I1 == T {
    convenience init(fieldsOn fragment: F) {
		self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SubSelection == EmptySubSelection, F: FragmentProtocol, F.T.Schema.ImplementedInterfaces.I2 == T {
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SubSelection == EmptySubSelection, F: FragmentProtocol, F.T.Schema.ImplementedInterfaces.I3 == T {
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SubSelection == EmptySubSelection, F: FragmentProtocol, F.T.Schema.ImplementedInterfaces.I4 == T {
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SubSelection == EmptySubSelection, F: FragmentProtocol, F.T.Schema.ImplementedInterfaces.I5 == T {
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}


// MARK: - Adding fragments of conformed interfaces to a type sub-selection

public extension Add where SubSelection == EmptySubSelection, F: FragmentProtocol, F.T == T {
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SubSelection == EmptySubSelection, F: FragmentProtocol, F.T == T.Schema.ImplementedInterfaces.I1 {
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SubSelection == EmptySubSelection, F: FragmentProtocol, F.T == T.Schema.ImplementedInterfaces.I2 {
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SubSelection == EmptySubSelection, F: FragmentProtocol, F.T == T.Schema.ImplementedInterfaces.I3 {
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SubSelection == EmptySubSelection, F: FragmentProtocol, F.T == T.Schema.ImplementedInterfaces.I4 {
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
public extension Add where SubSelection == EmptySubSelection, F: FragmentProtocol, F.T == T.Schema.ImplementedInterfaces.I5 {
    convenience init(fieldsOn fragment: F) {
        self.init(fieldType: .fragment(inline: "...\(fragment.name)", rendered: fragment.render()), items: fragment.items)
    }
}
