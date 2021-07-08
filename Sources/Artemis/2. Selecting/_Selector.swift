import Foundation

/**
 A type used to turn keypaths from `T` into functions that build `Selection` instances.
 */
@dynamicMemberLookup
public class _Selector<T: Object> { }

// MARK: Selecting on Object

extension _Selector {
    public subscript<Value: Object, S: _SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> _SelectionSetBuilderWrapper<T, S, Value, Value, NoArguments> {
        return _SelectionSetBuilderWrapper(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation, returning a selector to select additional fields to add, optionally giving
     the selected field an alias.
    */
    public subscript<Value: Object, Args: ArgumentsList, S: _SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.SubSchema, _FieldArgValue<Value, Args>>
    ) -> _SelectionSetBuilderWrapper<T, S, _FieldArgValue<Value, Args>, Value, Args> {
        return _SelectionSetBuilderWrapper(keyPath: keyPath)
    }
}

// MARK: Selecting on Scalar

extension _Selector {
    /**
     Adds the given field to the operation.
    */
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> _Selection<T, Value.Result, NoArguments> {
        return AliasBuilderWrapper<T, Value, Value, NoArguments>(keyPath: keyPath)(alias: nil)
    }

    /**
     Adds the given field to the operation.
    */
    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, _FieldArgValue<Value, Args>>
    ) -> _Selection<T, Value.Result, Args> {
        return AliasBuilderWrapper<T, _FieldArgValue<Value, Args>, Value, Args>(keyPath: keyPath)(alias: nil)
    }

    /**
     Adds the given field to the operation, giving the selected field an alias.
    */
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> AliasBuilderWrapper<T, Value, Value, NoArguments> {
        return AliasBuilderWrapper<T, Value, Value, NoArguments>(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation, giving the selected field an alias.
    */
    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, _FieldArgValue<Value, Args>>
    ) -> AliasBuilderWrapper<T, _FieldArgValue<Value, Args>, Value, Args> {
        return AliasBuilderWrapper(keyPath: keyPath)
    }
}

extension _Selector {
    // We need to return this instead of a closure so we can add the `alias` parameter name to the callsite
    public struct AliasBuilderWrapper<
        T: Object,
        FieldVal,
        Value: Scalar,
        Args: ArgumentsList
    > {
        let keyPath: KeyPath<T.SubSchema, FieldVal>

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
        */
        public func callAsFunction(
            alias: String?
        ) -> _Selection<T, Value.Result, Args> {
            let schema: T.SubSchema = T.schema
            let _ = schema[keyPath: keyPath]
            let fieldType: _Selection<T, Value.Result, Args>.FieldType = .field(
                key: T.key(forPath: keyPath),
                alias: alias,
                rendered_SelectionSet: nil,
                createResult: { dict in
                    return try Value.createUnsafeResult(from: dict, key: T.key(forPath: keyPath))
                }
            )
            return _Selection(fieldType: fieldType, items: [])
        }
    }

    // We need to return this instead of a closure so that the result builder syntax can work (we can't put a result
    // builder i.e. `@_SelectionSetBuilder` as an argument in a closure; needs to be in a static function). It also lets us
    // add the `alias` parameter name to the call site
    public struct _SelectionSetBuilderWrapper<
        T: Object,
        S: _SelectionProtocol,
        FieldVal,
        Value: Object,
        Args: ArgumentsList
    > {
        let keyPath: KeyPath<T.SubSchema, FieldVal>

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
         - parameter _SelectionSet: A function builder that additional `Add` components can be given in to select fields on
        this `Add` instance's returned value.
        */
        public func callAsFunction(
            alias: String? = nil,
            @_SelectionSetBuilder<Value> _ _SelectionSet: @escaping (_Selector<Value>) -> S
        ) -> _Selection<T, Value.Result, Args> {
            let schema: T.SubSchema = T.schema
            let _ = schema[keyPath: keyPath]
            let ss = _SelectionSet(_Selector<Value>())
            let fieldType: _Selection<T, Value.Result, Args>.FieldType = .field(
                key: T.key(forPath: keyPath),
                alias: alias,
                rendered_SelectionSet: ss.render(),
                createResult: { dict in
                    return try Value.createUnsafeResult(from: dict, key: T.key(forPath: keyPath))
                }
            )
            return _Selection(fieldType: fieldType, items: ss.items)
        }

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
         - parameter _SelectionSet: A function builder that additional `Add` components can be given in to select fields on
        this `Add` instance's returned value.
        */
        public func callAsFunction(
            alias: String? = nil,
            @_SelectionSetBuilder<Value> _ _SelectionSet: @escaping () -> S
        ) -> _Selection<T, Value.Result, Args> {
            return self.callAsFunction(alias: alias) { _ in return _SelectionSet() }
        }
    }
}
