import Foundation

// MARK: - Adding fragments of conforming types to an interface sub-selection

public extension Add where Result == Never, Args == NoArguments {
    /**
    Adds the fields from the given fragment to the document.

    - parameter fragment: The fragment containing the selected fields.
    */
    convenience init(fieldsOn fragment: Fragment<T>) {
        let type: FieldType = .fragment(
            inline: "...\(fragment.name)",
            rendered: fragment.render(),
            createResult: { try fragment.createResult(from: $0) }
        )
        self.init(fieldType: type, items: fragment.items)
    }

    /**
    Adds the fields from the given fragment to the document.

    - parameter fragment: The fragment containing the selected fields.
    */
    convenience init(
        fieldsOn fragment: Fragment<T.Schema.ImplementedInterfaces.I1>
    ) where T.Schema.ImplementedInterfaces.I1: Object {
        let type: FieldType = .fragment(
            inline: "...\(fragment.name)",
            rendered: fragment.render(),
            createResult: { try fragment.createResult(from: $0) }
        )
        self.init(fieldType: type, items: fragment.items)
    }

    /**
    Adds the fields from the given fragment to the document.

    - parameter fragment: The fragment containing the selected fields.
    */
    convenience init(
        fieldsOn fragment: Fragment<T.Schema.ImplementedInterfaces.I2>
    ) where T.Schema.ImplementedInterfaces.I2: Object {
        let type: FieldType = .fragment(
            inline: "...\(fragment.name)",
            rendered: fragment.render(),
            createResult: { try fragment.createResult(from: $0) }
        )
        self.init(fieldType: type, items: fragment.items)
    }

    /**
    Adds the fields from the given fragment to the document.

    - parameter fragment: The fragment containing the selected fields.
    */
    convenience init(
        fieldsOn fragment: Fragment<T.Schema.ImplementedInterfaces.I3>
    ) where T.Schema.ImplementedInterfaces.I3: Object {
        let type: FieldType = .fragment(
            inline: "...\(fragment.name)",
            rendered: fragment.render(),
            createResult: { try fragment.createResult(from: $0) }
        )
        self.init(fieldType: type, items: fragment.items)
    }

    /**
    Adds the fields from the given fragment to the document.

    - parameter fragment: The fragment containing the selected fields.
    */
    convenience init(
        fieldsOn fragment: Fragment<T.Schema.ImplementedInterfaces.I4>
    ) where T.Schema.ImplementedInterfaces.I4: Object {
        let type: FieldType = .fragment(
            inline: "...\(fragment.name)",
            rendered: fragment.render(),
            createResult: { try fragment.createResult(from: $0) }
        )
        self.init(fieldType: type, items: fragment.items)
    }

    /**
    Adds the fields from the given fragment to the document.

    - parameter fragment: The fragment containing the selected fields.
    */
    convenience init(
        fieldsOn fragment: Fragment<T.Schema.ImplementedInterfaces.I5>
    ) where T.Schema.ImplementedInterfaces.I5: Object {
        let type: FieldType = .fragment(
            inline: "...\(fragment.name)",
            rendered: fragment.render(),
            createResult: { try fragment.createResult(from: $0) }
        )
        self.init(fieldType: type, items: fragment.items)
    }
}
