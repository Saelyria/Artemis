import Foundation

/**
 A function builder type that builds selection sets from `Selection` instances.

 T: The object that the selection set is selecting keypaths from
*/
@resultBuilder
public struct _SelectionSetBuilder<T: Object> {
    /// Function builder method to transform a `Selection` instance into a `_SelectionSet` that will get piped into one of
    /// the `buildBlock` methods.
    public static func buildExpression<R, A: ArgumentsList>(
        _ ss1: _Selection<T, R, A>
    ) -> _SelectionSet<R> {
        return _SelectionSet(items: [ss1], resultBuilder: { dict in
            return try ss1.createResult(from: dict)
        })
    }

    public static func buildExpression<R, A: ArgumentsList>(
        _ ss1: _Selection<T.ImplementedInterfaces.I1, R, A>
    ) -> _SelectionSet<R> where T.ImplementedInterfaces.I1: Interface {
        return _SelectionSet(items: [ss1], resultBuilder: { dict in
            return try ss1.createResult(from: dict)
        })
    }

    public static func buildExpression<R, A: ArgumentsList>(
        _ ss1: _Selection<T.ImplementedInterfaces.I2, R, A>
    ) -> _SelectionSet<R> where T.ImplementedInterfaces.I2: Interface {
        return _SelectionSet(items: [ss1], resultBuilder: { dict in
            return try ss1.createResult(from: dict)
        })
    }

    public static func buildExpression<R, A: ArgumentsList>(
        _ ss1: _Selection<T.ImplementedInterfaces.I3, R, A>
    ) -> _SelectionSet<R> where T.ImplementedInterfaces.I3: Interface {
        return _SelectionSet(items: [ss1], resultBuilder: { dict in
            return try ss1.createResult(from: dict)
        })
    }

    public static func buildExpression<R, A: ArgumentsList>(
        _ ss1: _Selection<T.ImplementedInterfaces.I4, R, A>
    ) -> _SelectionSet<R> where T.ImplementedInterfaces.I4: Interface {
        return _SelectionSet(items: [ss1], resultBuilder: { dict in
            return try ss1.createResult(from: dict)
        })
    }

    public static func buildExpression<R, A: ArgumentsList>(
        _ ss1: _Selection<T.ImplementedInterfaces.I5, R, A>
    ) -> _SelectionSet<R> where T.ImplementedInterfaces.I5: Interface {
        return _SelectionSet(items: [ss1], resultBuilder: { dict in
            return try ss1.createResult(from: dict)
        })
    }
}

extension _SelectionSetBuilder {
    public static func buildBlock<S: _SelectionProtocol>(_ set: S) -> S {
        return set
    }

    public static func buildBlock<R1, R2>(
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>
    ) -> _SelectionSet<(R1, R2)> {
        let items = set1.items + set2.items
        return _SelectionSet(items: items, resultBuilder: { dict in
            return (
                try set1.createResult(from: dict),
                try set2.createResult(from: dict)
            )
        })
    }

    public static func buildBlock<R1, R2, R3>(
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>,
        _ set3: _SelectionSet<R3>
    ) -> _SelectionSet<(R1, R2, R3)> {
        let items = set1.items + set2.items + set3.items
        return _SelectionSet(items: items, resultBuilder: { dict in
            return (
                try set1.createResult(from: dict),
                try set2.createResult(from: dict),
                try set3.createResult(from: dict)
            )
        })
    }

    public static func buildBlock<R1, R2, R3, R4>(
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>,
        _ set3: _SelectionSet<R3>,
        _ set4: _SelectionSet<R4>
    ) -> _SelectionSet<(R1, R2, R3, R4)> {
        let items = set1.items + set2.items + set3.items + set4.items
        return _SelectionSet(items: items, resultBuilder: { dict in
            return (
                try set1.createResult(from: dict),
                try set2.createResult(from: dict),
                try set3.createResult(from: dict),
                try set4.createResult(from: dict)
            )
        })
    }

    public static func buildBlock<R1, R2, R3, R4, R5>(
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>,
        _ set3: _SelectionSet<R3>,
        _ set4: _SelectionSet<R4>,
        _ set5: _SelectionSet<R5>
    ) -> _SelectionSet<(R1, R2, R3, R4, R5)> {
        let items = set1.items + set2.items + set3.items + set4.items + set5.items
        return _SelectionSet(items: items, resultBuilder: { dict in
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
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>,
        _ set3: _SelectionSet<R3>,
        _ set4: _SelectionSet<R4>,
        _ set5: _SelectionSet<R5>,
        _ set6: _SelectionSet<R6>
    ) -> _SelectionSet<(R1, R2, R3, R4, R5, R6)> {
        let items = set1.items + set2.items + set3.items + set4.items + set5.items + set6.items
        return _SelectionSet(items: items, resultBuilder: { dict in
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
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>,
        _ set3: _SelectionSet<R3>,
        _ set4: _SelectionSet<R4>,
        _ set5: _SelectionSet<R5>,
        _ set6: _SelectionSet<R6>,
        _ set7: _SelectionSet<R7>
    ) -> _SelectionSet<(R1, R2, R3, R4, R5, R6, R7)> {
        let items = set1.items + set2.items + set3.items + set4.items + set5.items + set6.items + set7.items
        return _SelectionSet(items: items, resultBuilder: { dict in
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
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>,
        _ set3: _SelectionSet<R3>,
        _ set4: _SelectionSet<R4>,
        _ set5: _SelectionSet<R5>,
        _ set6: _SelectionSet<R6>,
        _ set7: _SelectionSet<R7>,
        _ set8: _SelectionSet<R8>
    ) -> _SelectionSet<(R1, R2, R3, R4, R5, R6, R7, R8)> {
        let items = set1.items + set2.items + set3.items + set4.items + set5.items + set6.items + set7.items + set8.items
        return _SelectionSet(items: items, resultBuilder: { dict in
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

extension _SelectionSetBuilder {
    public static func buildExpression(
        _ fragment: Fragment<T>
    ) -> _SelectionSet<Never> {
        let selection = _Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return _SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }

    public static func buildExpression<I: Interface>(
        _ fragment: Fragment<I>
    ) -> _SelectionSet<Never> where I == T.SubSchema.ImplementedInterfaces.I1 {
        let selection = _Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return _SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }

    public static func buildExpression<I: Interface>(
        _ fragment: Fragment<I>
    ) -> _SelectionSet<Never> where I == T.SubSchema.ImplementedInterfaces.I2 {
        let selection = _Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return _SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }

    public static func buildExpression<I: Interface>(
        _ fragment: Fragment<I>
    ) -> _SelectionSet<Never> where I == T.SubSchema.ImplementedInterfaces.I3 {
        let selection = _Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return _SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }

    public static func buildExpression<I: Interface>(
        _ fragment: Fragment<I>
    ) -> _SelectionSet<Never> where I == T.SubSchema.ImplementedInterfaces.I4 {
        let selection = _Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return _SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }

    public static func buildExpression<I: Interface>(
        _ fragment: Fragment<I>
    ) -> _SelectionSet<Never> where I == T.SubSchema.ImplementedInterfaces.I5 {
        let selection = _Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return _SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }
}
