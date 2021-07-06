import Foundation

/**
 A type used to turn keypaths from `T` into functions that build `Selection` instances.
 */
@dynamicMemberLookup
public class Selector<T: Object> {
    /**
     Adds the given field to the operation, returning a selector to select additional fields to add, optionally giving
     the selected field an alias.
    */
    public subscript<Value: Object, Args: ArgumentsList, S: SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.Schema, Field<Value, Args>>
    ) -> SelectionSetBuilderWrapper<T, T.Schema, S, Value, Args> {
        return SelectionSetBuilderWrapper(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation.
    */
    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.Schema, Field<Value, Args>>
    ) -> Selection<T, Value.Result, Args> {
        return AliasBuilderWrapper(keyPath: keyPath)(alias: nil)
    }

    /**
     Adds the given field to the operation, giving the selected field an alias.
    */
    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.Schema, Field<Value, Args>>
    ) -> AliasBuilderWrapper<T, T.Schema, Value, Args> {
        return AliasBuilderWrapper(keyPath: keyPath)
    }
}

extension Selector {
    // We need to return this instead of a closure so we can add the `alias` parameter name to the callsite
    public struct AliasBuilderWrapper<T: Object, Schema, Value: Scalar, Args: ArgumentsList> where T.Schema == Schema {
        let keyPath: KeyPath<Schema, Field<Value, Args>>

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
        */
        public func callAsFunction(
            alias: String?
        ) -> Selection<T, Value.Result, Args> {
            let field = T.Schema()[keyPath: keyPath]
            let fieldType: Selection<T, Value.Result, Args>.FieldType = .field(
                key: field.key,
                alias: alias,
                renderedSelectionSet: nil,
                createResult: { dict in
                    return try Value.createUnsafeResult(from: dict, key: field.key)
                }
            )
            return Selection(fieldType: fieldType, items: [])
        }
    }

    // We need to return this instead of a closure so that the result builder syntax can work (we can't put a result
    // builder i.e. `@SelectionSetBuilder` as an argument in a closure; needs to be in a static function). It also lets us
    // add the `alias` parameter name to the call site
    public struct SelectionSetBuilderWrapper<T: Object, Schema, S: SelectionProtocol, Value: Object, Args: ArgumentsList> where T.Schema == Schema {
        let keyPath: KeyPath<Schema, Field<Value, Args>>

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
         - parameter selectionSet: A function builder that additional `Add` components can be given in to select fields on
        this `Add` instance's returned value.
        */
        public func callAsFunction(
            alias: String? = nil,
            @SelectionSetBuilder<Value> _ selectionSet: @escaping (Selector<Value>) -> S
        ) -> Selection<T, Value.Result, Args> {
            let field = T.Schema()[keyPath: keyPath]
            let ss = selectionSet(Selector<Value>())
            let fieldType: Selection<T, Value.Result, Args>.FieldType = .field(
                key: field.key,
                alias: alias,
                renderedSelectionSet: ss.render(),
                createResult: { dict in
                    return try Value.createUnsafeResult(from: dict, key: field.key)
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
