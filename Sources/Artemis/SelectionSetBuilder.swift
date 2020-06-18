import Foundation

/**
 A function builder type that builds selection sets from `Add` instances.

 T: The object that the selection set is selecting keypaths from
*/
@_functionBuilder
public struct SelectionSetBuilder<T: Object> {
    /// Function builder method to transform an `Add` instance into a `SelectionSet` that will get piped into one of
    /// the `buildBlock` methods.
    public static func buildExpression<F1>
        (_ ss1: Add<T, F1>)
        -> SelectionSet<F1.Value.Result>
        where F1: AnyField
    {
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
}
