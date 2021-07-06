import Foundation

@dynamicMemberLookup
public class Selector<T: Object> {
    /**
     Adds the given field to the operation, returning a selector to select additional fields to add, optionally giving
     the selected field an alias.
    */
    public subscript<Value: Object, Args: ArgumentsList, S: Selection>(
        dynamicMember keyPath: KeyPath<T.Schema, Field<Value, Args>>
    ) -> SelectionSetBuilderWrapper<T, T.Schema, S, Value, Args> {
        return SelectionSetBuilderWrapper(keyPath: keyPath)
    }

    /**
     Adds the given field to the operation.
    */
    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.Schema, Field<Value, Args>>
    ) -> Add<T, Value.Result, Args> {
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
        ) -> Add<T, Value.Result, Args> {
            let field = T.Schema()[keyPath: keyPath]
            let fieldType: Add<T, Value.Result, Args>.FieldType = .field(
                key: field.key,
                alias: alias,
                renderedSelectionSet: nil,
                createResult: { dict in
                    return try Value.createUnsafeResult(from: dict, key: field.key)
                }
            )
            return Add(fieldType: fieldType, items: [])
        }
    }

    // We need to return this instead of a closure so that the result builder syntax can work (we can't put a result
    // builder i.e. `@SelectionSetBuilder` as an argument in a closure; needs to be in a static function). It also lets us
    // add the `alias` parameter name to the call site
    public struct SelectionSetBuilderWrapper<T: Object, Schema, S: Selection, Value: Object, Args: ArgumentsList> where T.Schema == Schema {
        let keyPath: KeyPath<Schema, Field<Value, Args>>

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
         - parameter selectionSet: A function builder that additional `Add` components can be given in to select fields on
        this `Add` instance's returned value.
        */
        public func callAsFunction(
            alias: String? = nil,
            @SelectionSetBuilder<Value> _ selectionSet: @escaping (Selector<Value>) -> S
        ) -> Add<T, Value.Result, Args> {
            let field = T.Schema()[keyPath: keyPath]
            let ss = selectionSet(Selector<Value>())
            let fieldType: Add<T, Value.Result, Args>.FieldType = .field(
                key: field.key,
                alias: alias,
                renderedSelectionSet: ss.render(),
                createResult: { dict in
                    return try Value.createUnsafeResult(from: dict, key: field.key)
                }
            )
            return Add(fieldType: fieldType, items: ss.items)
        }
    }
}

/**
 A function builder type that builds selection sets from `Add` instances.

 T: The object that the selection set is selecting keypaths from
*/
@_functionBuilder
public struct SelectionSetBuilder<T: Object> {
    /// Function builder method to transform an `Add` instance into a `SelectionSet` that will get piped into one of
    /// the `buildBlock` methods.
    public static func buildExpression<R, A: ArgumentsList>(
        _ ss1: Add<T, R, A>
    ) -> SelectionSet<R> {
        return SelectionSet(items: [ss1], resultBuilder: { dict in
            return try ss1.createResult(from: dict)
        })
    }

    public static func buildBlock<S: Selection>(_ set: S) -> S {
        return set
    }

    public static func buildBlock<R1, R2>(
        _ set1: SelectionSet<R1>,
        _ set2: SelectionSet<R2>
    ) -> SelectionSet<(R1, R2)> {
        let items = set1.items + set2.items
        return SelectionSet(items: items, resultBuilder: { dict in
            return (
                try set1.createResult(from: dict),
                try set2.createResult(from: dict)
            )
        })
    }

    public static func buildBlock<R1, R2, R3>(
        _ set1: SelectionSet<R1>,
        _ set2: SelectionSet<R2>,
        _ set3: SelectionSet<R3>
    ) -> SelectionSet<(R1, R2, R3)> {
        let items = set1.items + set2.items + set3.items
        return SelectionSet(items: items, resultBuilder: { dict in
            return (
                try set1.createResult(from: dict),
                try set2.createResult(from: dict),
                try set3.createResult(from: dict)
            )
        })
    }

    public static func buildBlock<R1, R2, R3, R4>(
        _ set1: SelectionSet<R1>,
        _ set2: SelectionSet<R2>,
        _ set3: SelectionSet<R3>,
        _ set4: SelectionSet<R4>
    ) -> SelectionSet<(R1, R2, R3, R4)> {
        let items = set1.items + set2.items + set3.items + set4.items
        return SelectionSet(items: items, resultBuilder: { dict in
            return (
                try set1.createResult(from: dict),
                try set2.createResult(from: dict),
                try set3.createResult(from: dict),
                try set4.createResult(from: dict)
            )
        })
    }

    public static func buildBlock<R1, R2, R3, R4, R5>(
        _ set1: SelectionSet<R1>,
        _ set2: SelectionSet<R2>,
        _ set3: SelectionSet<R3>,
        _ set4: SelectionSet<R4>,
        _ set5: SelectionSet<R5>
    ) -> SelectionSet<(R1, R2, R3, R4, R5)> {
        let items = set1.items + set2.items + set3.items + set4.items + set5.items
        return SelectionSet(items: items, resultBuilder: { dict in
            return (
                try set1.createResult(from: dict),
                try set2.createResult(from: dict),
                try set3.createResult(from: dict),
                try set4.createResult(from: dict),
                try set5.createResult(from: dict)
            )
        })
    }

    public static func buildBlock<R1, R2, R3, R4, R5, R6>(
        _ set1: SelectionSet<R1>,
        _ set2: SelectionSet<R2>,
        _ set3: SelectionSet<R3>,
        _ set4: SelectionSet<R4>,
        _ set5: SelectionSet<R5>,
        _ set6: SelectionSet<R6>
    ) -> SelectionSet<(R1, R2, R3, R4, R5, R6)> {
        let items = set1.items + set2.items + set3.items + set4.items + set5.items + set6.items
        return SelectionSet(items: items, resultBuilder: { dict in
            return (
                try set1.createResult(from: dict),
                try set2.createResult(from: dict),
                try set3.createResult(from: dict),
                try set4.createResult(from: dict),
                try set5.createResult(from: dict),
                try set6.createResult(from: dict)
            )
        })
    }

    public static func buildBlock<R1, R2, R3, R4, R5, R6, R7>(
        _ set1: SelectionSet<R1>,
        _ set2: SelectionSet<R2>,
        _ set3: SelectionSet<R3>,
        _ set4: SelectionSet<R4>,
        _ set5: SelectionSet<R5>,
        _ set6: SelectionSet<R6>,
        _ set7: SelectionSet<R7>
    ) -> SelectionSet<(R1, R2, R3, R4, R5, R6, R7)> {
        let items = set1.items + set2.items + set3.items + set4.items + set5.items + set6.items + set7.items
        return SelectionSet(items: items, resultBuilder: { dict in
            return (
                try set1.createResult(from: dict),
                try set2.createResult(from: dict),
                try set3.createResult(from: dict),
                try set4.createResult(from: dict),
                try set5.createResult(from: dict),
                try set6.createResult(from: dict),
                try set7.createResult(from: dict)
            )
        })
    }

    public static func buildBlock<R1, R2, R3, R4, R5, R6, R7, R8>(
        _ set1: SelectionSet<R1>,
        _ set2: SelectionSet<R2>,
        _ set3: SelectionSet<R3>,
        _ set4: SelectionSet<R4>,
        _ set5: SelectionSet<R5>,
        _ set6: SelectionSet<R6>,
        _ set7: SelectionSet<R7>,
        _ set8: SelectionSet<R8>
    ) -> SelectionSet<(R1, R2, R3, R4, R5, R6, R7, R8)> {
        let items = set1.items + set2.items + set3.items + set4.items + set5.items + set6.items + set7.items + set8.items
        return SelectionSet(items: items, resultBuilder: { dict in
            return (
                try set1.createResult(from: dict),
                try set2.createResult(from: dict),
                try set3.createResult(from: dict),
                try set4.createResult(from: dict),
                try set5.createResult(from: dict),
                try set6.createResult(from: dict),
                try set7.createResult(from: dict),
                try set8.createResult(from: dict)
            )
        })
    }
}
