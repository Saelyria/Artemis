import Foundation

/**
 A type used to turn keypaths from `T` into functions that build `Selection` instances.
 */
@dynamicMemberLookup
public class Selector<T: Schema & Object> { }

// MARK: Selecting on Object

extension Selector {
    public subscript<Value: Object, S: SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> SelectionSetBuilderWrapper<T, S, Value, Value, NoArguments, Value.Result> {
        return SelectionSetBuilderWrapper(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation, returning a selector to select additional fields to add, optionally giving
     the selected field an alias.
    */
    public subscript<Value: Object, Args: ArgumentsList, S: SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.SubSchema, _FieldArgValue<Value, Args>>
    ) -> SelectionSetBuilderWrapper<T, S, _FieldArgValue<Value, Args>, Value, Args, Value.Result> {
        return SelectionSetBuilderWrapper(keyPath: keyPath)
    }
}

// MARK: Selecting on [Object]

extension Selector {
    public subscript<Value: Collection & Object, S: SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> SelectionSetBuilderWrapper<T, S, Value, Value.Element, NoArguments, Value.Result>
    where Value.Element: Schema & Object {
        return SelectionSetBuilderWrapper(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation, returning a selector to select additional fields to add, optionally giving
     the selected field an alias.
    */
    public subscript<Value: Collection & Object, Args: ArgumentsList, S: SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.SubSchema, _FieldArgValue<Value, Args>>
    ) -> SelectionSetBuilderWrapper<T, S, _FieldArgValue<Value, Args>, Value.Element, Args, Value.Result>
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
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> Selection<T, Value.Result, NoArguments> {
        return AliasBuilderWrapper<T, Value, Value, NoArguments, Value.Result>(keyPath: keyPath)(alias: nil)
    }

    /**
     Adds the given field to the operation.
    */
    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, _FieldArgValue<Value, Args>>
    ) -> Selection<T, Value.Result, Args> {
        return AliasBuilderWrapper<T, _FieldArgValue<Value, Args>, Value, Args, Value.Result>(keyPath: keyPath)(alias: nil)
    }

    /**
     Adds the given field to the operation, giving the selected field an alias.
    */
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> AliasBuilderWrapper<T, Value, Value, NoArguments, Value.Result> {
        return AliasBuilderWrapper<T, Value, Value, NoArguments, Value.Result>(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation, giving the selected field an alias.
    */
    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, _FieldArgValue<Value, Args>>
    ) -> AliasBuilderWrapper<T, _FieldArgValue<Value, Args>, Value, Args, Value.Result> {
        return AliasBuilderWrapper(keyPath: keyPath)
    }
}

// MARK: Selecting on [Scalar]

extension Selector {
    /**
     Adds the given field to the operation.
    */
    public subscript<Value: Collection & Scalar>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> Selection<T, Value.Result, NoArguments>
    where Value.Element: Scalar {
        return AliasBuilderWrapper<T, Value, Value.Element, NoArguments, Value.Result>(keyPath: keyPath)(alias: nil)
    }

    /**
     Adds the given field to the operation.
    */
    public subscript<Value: Collection & Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, _FieldArgValue<Value, Args>>
    ) -> Selection<T, Value.Result, Args>
    where Value.Element: Scalar {
        return AliasBuilderWrapper<T, _FieldArgValue<Value, Args>, Value.Element, Args, Value.Result>(keyPath: keyPath)(alias: nil)
    }

    /**
     Adds the given field to the operation, giving the selected field an alias.
    */
    public subscript<Value: Collection & Scalar>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> AliasBuilderWrapper<T, Value, Value.Element, NoArguments, Value.Result>
    where Value.Element: Scalar {
        return AliasBuilderWrapper<T, Value, Value.Element, NoArguments, Value.Result>(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation, giving the selected field an alias.
    */
    public subscript<Value: Collection & Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, _FieldArgValue<Value, Args>>
    ) -> AliasBuilderWrapper<T, _FieldArgValue<Value, Args>, Value.Element, Args, Value.Result> {
        return AliasBuilderWrapper(keyPath: keyPath)
    }
}


extension Selector {
    // We need to return this instead of a closure so we can add the `alias` parameter name to the callsite
    public struct AliasBuilderWrapper<
        T: Schema & Object,
        FieldVal,
        Value: Scalar,
        Args: ArgumentsList,
        Result
    > {
        let keyPath: KeyPath<T.SubSchema, FieldVal>

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
        */
        public func callAsFunction(
            alias: String?
        ) -> Selection<T, Result, Args> {
            let schema: T.SubSchema = Schema.schema(for: T.self)
            let _ = schema[keyPath: keyPath]
            let fieldType: Selection<T, Result, Args>.FieldType = .field(
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
    public struct SelectionSetBuilderWrapper<
        T: Schema & Object,
        S: SelectionProtocol,
        FieldVal,
        Value: Schema & Object,
        Args: ArgumentsList,
        Result
    > {
        let keyPath: KeyPath<T.SubSchema, FieldVal>

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
         - parameter selectionSet: A function builder that additional `Add` components can be given in to select fields on
        this `Add` instance's returned value.
        */
        public func callAsFunction(
            alias: String? = nil,
            @SelectionSetBuilder<Value> _ selectionSet: @escaping (Selector<Value>) -> S
        ) -> Selection<T, Result, Args> {
            let schema: T.SubSchema = Schema.schema(for: T.self)
            let _ = schema[keyPath: keyPath]
            let ss = selectionSet(Selector<Value>())
            let fieldType: Selection<T, Result, Args>.FieldType = .field(
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
        ) -> Selection<T, Result, Args> {
            return self.callAsFunction(alias: alias) { _ in return selectionSet() }
        }
    }
}
