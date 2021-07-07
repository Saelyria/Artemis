import Foundation

/**
 A type used to turn keypaths from `T` into functions that build `Selection` instances.
 */
@dynamicMemberLookup
public class Selector<T: Schema & Object> { }

// MARK: Selecting on Object

extension Selector {
    public subscript<Value: Object, S: SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.Schema, Value>
    ) -> SelectionSetBuilderWrapper<T, S, Value, Value, NoArguments> {
        return SelectionSetBuilderWrapper(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation, returning a selector to select additional fields to add, optionally giving
     the selected field an alias.
    */
    public subscript<Value: Object, Args: ArgumentsList, S: SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.Schema, _FieldArgValue<Value, Args>>
    ) -> SelectionSetBuilderWrapper<T, S, _FieldArgValue<Value, Args>, Value, Args> {
        return SelectionSetBuilderWrapper(keyPath: keyPath)
    }
}

// MARK: Selecting on [Object]

extension Selector {
    public subscript<Value: Collection, S: SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.Schema, Value>
    ) -> SelectionSetBuilderWrapper<T, S, Value, Value.Element, NoArguments>
    where Value.Element: Schema & Object {
        return SelectionSetBuilderWrapper(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation, returning a selector to select additional fields to add, optionally giving
     the selected field an alias.
    */
    public subscript<Value: Collection, Args: ArgumentsList, S: SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.Schema, _FieldArgValue<Value, Args>>
    ) -> SelectionSetBuilderWrapper<T, S, _FieldArgValue<Value, Args>, Value.Element, Args>
    where Value.Element: Schema & Object {
        return SelectionSetBuilderWrapper(keyPath: keyPath)
    }
}


// MARK: Selecting on Scalar

extension Selector {
    /**
     Adds the given field to the operation.
    */
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<T.Schema, Value>
    ) -> Selection<T, Value.Result, NoArguments> {
        return AliasBuilderWrapper<T, Value, Value, NoArguments>(keyPath: keyPath)(alias: nil)
    }

    /**
     Adds the given field to the operation.
    */
    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.Schema, _FieldArgValue<Value, Args>>
    ) -> Selection<T, Value.Result, Args> {
        return AliasBuilderWrapper<T, _FieldArgValue<Value, Args>, Value, Args>(keyPath: keyPath)(alias: nil)
    }

    /**
     Adds the given field to the operation, giving the selected field an alias.
    */
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<T.Schema, Value>
    ) -> AliasBuilderWrapper<T, Value, Value, NoArguments> {
        return AliasBuilderWrapper<T, Value, Value, NoArguments>(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation, giving the selected field an alias.
    */
    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.Schema, _FieldArgValue<Value, Args>>
    ) -> AliasBuilderWrapper<T, _FieldArgValue<Value, Args>, Value, Args> {
        return AliasBuilderWrapper(keyPath: keyPath)
    }
}

// MARK: Selecting on [Scalar]

extension Selector {
    /**
     Adds the given field to the operation.
    */
    public subscript<Value: Collection>(
        dynamicMember keyPath: KeyPath<T.Schema, Value>
    ) -> Selection<T, Value.Element.Result, NoArguments>
    where Value.Element: Scalar {
        return AliasBuilderWrapper<T, Value, Value.Element, NoArguments>(keyPath: keyPath)(alias: nil)
    }

    /**
     Adds the given field to the operation.
    */
    public subscript<Value: Collection, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.Schema, _FieldArgValue<Value, Args>>
    ) -> Selection<T, Value.Element.Result, Args>
    where Value.Element: Scalar {
        return AliasBuilderWrapper<T, _FieldArgValue<Value, Args>, Value.Element, Args>(keyPath: keyPath)(alias: nil)
    }

    /**
     Adds the given field to the operation, giving the selected field an alias.
    */
    public subscript<Value: Collection>(
        dynamicMember keyPath: KeyPath<T.Schema, Value>
    ) -> AliasBuilderWrapper<T, Value, Value.Element, NoArguments>
    where Value.Element: Scalar {
        return AliasBuilderWrapper<T, Value, Value.Element, NoArguments>(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation, giving the selected field an alias.
    */
    public subscript<Value: Collection, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.Schema, _FieldArgValue<Value, Args>>
    ) -> AliasBuilderWrapper<T, _FieldArgValue<Value, Args>, Value.Element, Args> {
        return AliasBuilderWrapper(keyPath: keyPath)
    }
}


extension Selector {
    // We need to return this instead of a closure so we can add the `alias` parameter name to the callsite
    public struct AliasBuilderWrapper<T: Schema & Object, FieldVal, Value: Scalar, Args: ArgumentsList> {
        let keyPath: KeyPath<T.Schema, FieldVal>

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
        */
        public func callAsFunction(
            alias: String?
        ) -> Selection<T, Value.Result, Args> {
            let schema = T.Schema()
            let _ = schema[keyPath: keyPath]
            let fieldType: Selection<T, Value.Result, Args>.FieldType = .field(
                key: schema.keys[keyPath] ?? "",
                alias: alias,
                renderedSelectionSet: nil,
                createResult: { dict in
                    return try Value.createUnsafeResult(from: dict, key: schema.keys[keyPath] ?? "")
                }
            )
            return Selection(fieldType: fieldType, items: [])
        }
    }

    // We need to return this instead of a closure so that the result builder syntax can work (we can't put a result
    // builder i.e. `@SelectionSetBuilder` as an argument in a closure; needs to be in a static function). It also lets us
    // add the `alias` parameter name to the call site
    public struct SelectionSetBuilderWrapper<T: Schema & Object, S: SelectionProtocol, FieldVal, Value: Schema & Object, Args: ArgumentsList> {
        let keyPath: KeyPath<T.Schema, FieldVal>

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
         - parameter selectionSet: A function builder that additional `Add` components can be given in to select fields on
        this `Add` instance's returned value.
        */
        public func callAsFunction(
            alias: String? = nil,
            @SelectionSetBuilder<Value> _ selectionSet: @escaping (Selector<Value>) -> S
        ) -> Selection<T, Value.Result, Args> {
            let schema = T.Schema()
            let _ = schema[keyPath: keyPath]
            let ss = selectionSet(Selector<Value>())
            let fieldType: Selection<T, Value.Result, Args>.FieldType = .field(
                key: schema.keys[keyPath] ?? "",
                alias: alias,
                renderedSelectionSet: ss.render(),
                createResult: { dict in
                    return try Value.createUnsafeResult(from: dict, key: schema.keys[keyPath] ?? "")
                }
            )
            return Selection(fieldType: fieldType, items: ss.items)
        }

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
         - parameter selectionSet: A function builder that additional `Add` components can be given in to select fields on
        this `Add` instance's returned value.
        */
        public func callAsFunction(
            alias: String? = nil,
            @SelectionSetBuilder<Value> _ selectionSet: @escaping () -> S
        ) -> Selection<T, Value.Result, Args> {
            return self.callAsFunction(alias: alias) { _ in return selectionSet() }
        }
    }
}
