import Foundation

/**
 A function builder type that builds selection sets from `Add` instances.

 T: The object that the selection set is selecting keypaths from
*/
@_functionBuilder
public struct SelectionSetBuilder<T: Object> {
    /// Function builder method to transform a `Selection` instance into a `SelectionSet` that will get piped into one of
    /// the `buildBlock` methods.
    public static func buildExpression<R, A: ArgumentsList>(
        _ ss1: Selection<T, R, A>
    ) -> SelectionSet<R> {
        return SelectionSet(items: [ss1], resultBuilder: { dict in
            return try ss1.createResult(from: dict)
        })
    }

    public static func buildBlock<S: SelectionProtocol>(_ set: S) -> S {
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

extension SelectionSetBuilder {
    public static func buildExpression(
        _ fragment: Fragment<T>
    ) -> SelectionSet<Never> {
        let selection = Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }

    public static func buildExpression<I: Interface>(
        _ fragment: Fragment<I>
    ) -> SelectionSet<Never> where I == T.Schema.ImplementedInterfaces.I1 {
        let selection = Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }

    public static func buildExpression<I: Interface>(
        _ fragment: Fragment<I>
    ) -> SelectionSet<Never> where I == T.Schema.ImplementedInterfaces.I2 {
        let selection = Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }

    public static func buildExpression<I: Interface>(
        _ fragment: Fragment<I>
    ) -> SelectionSet<Never> where I == T.Schema.ImplementedInterfaces.I3 {
        let selection = Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }

    public static func buildExpression<I: Interface>(
        _ fragment: Fragment<I>
    ) -> SelectionSet<Never> where I == T.Schema.ImplementedInterfaces.I4 {
        let selection = Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }

    public static func buildExpression<I: Interface>(
        _ fragment: Fragment<I>
    ) -> SelectionSet<Never> where I == T.Schema.ImplementedInterfaces.I5 {
        let selection = Selection<T, Never, NoArguments>(
            fieldType: .fragment(
                inline: "...\(fragment.name)",
                rendered: fragment.render()
            ),
            items: fragment.items
        )
        return SelectionSet(items: [selection], resultBuilder: selection.createResult(from:))
    }
}
