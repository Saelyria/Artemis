import Foundation

/**
 A function builder type that builds selection sets from `Selection` instances.

 T: The object that the selection set is selecting keypaths from
*/
@_functionBuilder
public struct _SelectionSetBuilder<T: Object> {
    /// Function builder method to transform a `Selection` instance into a `_SelectionSet` that will get piped into one of
    /// the `buildBlock` methods.
    public static func buildExpression<R>(
        _ ss1: _Selection<T, R>
    ) -> _SelectionSet<R> {
        return _SelectionSet(
            items: [ss1],
            rendered: defaultRendered([ss1]),
            resultBuilder: ss1.createResult(from:)
        )
    }

    public static func buildExpression<R>(
        _ ss1: _Selection<T.ImplementedInterfaces.I1, R>
    ) -> _SelectionSet<R> where T.ImplementedInterfaces.I1: Interface {
        return _SelectionSet(
            items: [ss1],
            rendered: defaultRendered([ss1]),
            resultBuilder: ss1.createResult(from:)
        )
    }

    public static func buildExpression<R>(
        _ ss1: _Selection<T.ImplementedInterfaces.I2, R>
    ) -> _SelectionSet<R> where T.ImplementedInterfaces.I2: Interface {
        return _SelectionSet(
            items: [ss1],
            rendered: defaultRendered([ss1]),
            resultBuilder: ss1.createResult(from:)
        )
    }

    public static func buildExpression<R>(
        _ ss1: _Selection<T.ImplementedInterfaces.I3, R>
    ) -> _SelectionSet<R> where T.ImplementedInterfaces.I3: Interface {
        return _SelectionSet(
            items: [ss1],
            rendered: defaultRendered([ss1]),
            resultBuilder: ss1.createResult(from:)
        )
    }

    public static func buildExpression<R>(
        _ ss1: _Selection<T.ImplementedInterfaces.I4, R>
    ) -> _SelectionSet<R> where T.ImplementedInterfaces.I4: Interface {
        return _SelectionSet(
            items: [ss1],
            rendered: defaultRendered([ss1]),
            resultBuilder: ss1.createResult(from:)
        )
    }

    public static func buildExpression<R>(
        _ ss1: _Selection<T.ImplementedInterfaces.I5, R>
    ) -> _SelectionSet<R> where T.ImplementedInterfaces.I5: Interface {
        return _SelectionSet(
            items: [ss1],
            rendered: defaultRendered([ss1]),
            resultBuilder: ss1.createResult(from:)
        )
    }
}

extension _SelectionSetBuilder {
    public static func buildExpression<F: Object, S>(
        _ fragment: Fragment<F, S>
    ) -> _SelectionSet<S.Result> where F.SubSchema == T.SubSchema {
        return _SelectionSet(
            items: [fragment.selection],
            rendered: "...\(fragment.name)",
            resultBuilder: fragment.selection.createResult(from:)
        )
    }

    public static func buildExpression<I: Interface, S>(
        _ fragment: Fragment<I, S>
    ) -> _SelectionSet<S.Result> where I == T.SubSchema.ImplementedInterfaces.I1 {
        return _SelectionSet(
            items: [fragment.selection],
            rendered: "...\(fragment.name)",
            resultBuilder: fragment.selection.createResult(from:)
        )
    }

    public static func buildExpression<I: Interface, S>(
        _ fragment: Fragment<I, S>
    ) -> _SelectionSet<S.Result> where I == T.SubSchema.ImplementedInterfaces.I2 {
        return _SelectionSet(
            items: [fragment.selection],
            rendered: "...\(fragment.name)",
            resultBuilder: fragment.selection.createResult(from:)
        )
    }

    public static func buildExpression<I: Interface, S>(
        _ fragment: Fragment<I, S>
    ) -> _SelectionSet<S.Result> where I == T.SubSchema.ImplementedInterfaces.I3 {
        return _SelectionSet(
            items: [fragment.selection],
            rendered: "...\(fragment.name)",
            resultBuilder: fragment.selection.createResult(from:)
        )
    }

    public static func buildExpression<I: Interface, S>(
        _ fragment: Fragment<I, S>
    ) -> _SelectionSet<S.Result> where I == T.SubSchema.ImplementedInterfaces.I4 {
        return _SelectionSet(
            items: [fragment.selection],
            rendered: "...\(fragment.name)",
            resultBuilder: fragment.selection.createResult(from:)
        )
    }

    public static func buildExpression<I: Interface, S>(
        _ fragment: Fragment<I, S>
    ) -> _SelectionSet<S.Result> where I == T.SubSchema.ImplementedInterfaces.I5 {
        return _SelectionSet(
            items: [fragment.selection],
            rendered: "...\(fragment.name)",
            resultBuilder: fragment.selection.createResult(from:)
        )
    }
}

extension _SelectionSetBuilder {
    public static func buildBlock<R>(_ set: _SelectionSet<R>) -> _SelectionSet<R> {
        return set
    }

    public static func buildBlock<R1, R2>(
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>
    ) -> _SelectionSet<(R1, R2)> {
        let items = set1.items + set2.items
        return _SelectionSet(
            items: items,
            rendered: defaultRendered(items),
            resultBuilder: { dict in
                return (
                    try set1.createResult(from: dict),
                    try set2.createResult(from: dict)
                )
            }
        )
    }

    public static func buildBlock<R1, R2, R3>(
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>,
        _ set3: _SelectionSet<R3>
    ) -> _SelectionSet<(R1, R2, R3)> {
        let items = set1.items + set2.items + set3.items
        return _SelectionSet(
            items: items,
            rendered: defaultRendered(items),
            resultBuilder: { dict in
                return (
                    try set1.createResult(from: dict),
                    try set2.createResult(from: dict),
                    try set3.createResult(from: dict)
                )
            }
        )
    }

    public static func buildBlock<R1, R2, R3, R4>(
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>,
        _ set3: _SelectionSet<R3>,
        _ set4: _SelectionSet<R4>
    ) -> _SelectionSet<(R1, R2, R3, R4)> {
        let items = set1.items + set2.items + set3.items + set4.items
        return _SelectionSet(
            items: items,
            rendered: defaultRendered(items),
            resultBuilder: { dict in
                return (
                    try set1.createResult(from: dict),
                    try set2.createResult(from: dict),
                    try set3.createResult(from: dict),
                    try set4.createResult(from: dict)
                )
            }
        )
    }

    public static func buildBlock<R1, R2, R3, R4, R5>(
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>,
        _ set3: _SelectionSet<R3>,
        _ set4: _SelectionSet<R4>,
        _ set5: _SelectionSet<R5>
    ) -> _SelectionSet<(R1, R2, R3, R4, R5)> {
        let items = set1.items + set2.items + set3.items + set4.items + set5.items
        return _SelectionSet(
            items: items,
            rendered: defaultRendered(items),
            resultBuilder: { dict in
                return (
                    try set1.createResult(from: dict),
                    try set2.createResult(from: dict),
                    try set3.createResult(from: dict),
                    try set4.createResult(from: dict),
                    try set5.createResult(from: dict)
                )
            }
        )
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
        return _SelectionSet(
            items: items,
            rendered: defaultRendered(items),
            resultBuilder: { dict in
                return (
                    try set1.createResult(from: dict),
                    try set2.createResult(from: dict),
                    try set3.createResult(from: dict),
                    try set4.createResult(from: dict),
                    try set5.createResult(from: dict),
                    try set6.createResult(from: dict)
                )
            }
        )
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
        return _SelectionSet(
            items: items,
            rendered: defaultRendered(items),
            resultBuilder: { dict in
                return (
                    try set1.createResult(from: dict),
                    try set2.createResult(from: dict),
                    try set3.createResult(from: dict),
                    try set4.createResult(from: dict),
                    try set5.createResult(from: dict),
                    try set6.createResult(from: dict),
                    try set7.createResult(from: dict)
                )
            }
        )
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
        return _SelectionSet(
            items: items,
            rendered: defaultRendered(items),
            resultBuilder: { dict in
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
            }
        )
    }

    public static func buildBlock<R1, R2, R3, R4, R5, R6, R7, R8, R9>(
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>,
        _ set3: _SelectionSet<R3>,
        _ set4: _SelectionSet<R4>,
        _ set5: _SelectionSet<R5>,
        _ set6: _SelectionSet<R6>,
        _ set7: _SelectionSet<R7>,
        _ set8: _SelectionSet<R8>,
        _ set9: _SelectionSet<R9>
    ) -> _SelectionSet<(R1, R2, R3, R4, R5, R6, R7, R8, R9)> {
        let items = set1.items + set2.items + set3.items + set4.items + set5.items + set6.items + set7.items + set8.items + set9.items
        return _SelectionSet(
            items: items,
            rendered: defaultRendered(items),
            resultBuilder: { dict in
                return (
                    try set1.createResult(from: dict),
                    try set2.createResult(from: dict),
                    try set3.createResult(from: dict),
                    try set4.createResult(from: dict),
                    try set5.createResult(from: dict),
                    try set6.createResult(from: dict),
                    try set7.createResult(from: dict),
                    try set8.createResult(from: dict),
                    try set9.createResult(from: dict)
                )
            }
        )
    }

    public static func buildBlock<R1, R2, R3, R4, R5, R6, R7, R8, R9, R10>(
        _ set1: _SelectionSet<R1>,
        _ set2: _SelectionSet<R2>,
        _ set3: _SelectionSet<R3>,
        _ set4: _SelectionSet<R4>,
        _ set5: _SelectionSet<R5>,
        _ set6: _SelectionSet<R6>,
        _ set7: _SelectionSet<R7>,
        _ set8: _SelectionSet<R8>,
        _ set9: _SelectionSet<R9>,
        _ set10: _SelectionSet<R10>
    ) -> _SelectionSet<(R1, R2, R3, R4, R5, R6, R7, R8, R9, R10)> {
        let items = set1.items + set2.items + set3.items + set4.items + set5.items + set6.items + set7.items + set8.items + set9.items + set10.items
        return _SelectionSet(
            items: items,
            rendered: defaultRendered(items),
            resultBuilder: { dict in
                return (
                    try set1.createResult(from: dict),
                    try set2.createResult(from: dict),
                    try set3.createResult(from: dict),
                    try set4.createResult(from: dict),
                    try set5.createResult(from: dict),
                    try set6.createResult(from: dict),
                    try set7.createResult(from: dict),
                    try set8.createResult(from: dict),
                    try set9.createResult(from: dict),
                    try set10.createResult(from: dict)
                )
            }
        )
    }
}

extension _SelectionSetBuilder {
    public static func buildIf<R>(_ set: _SelectionSet<R>?) -> _SelectionSet<R> {
        return set ?? _SelectionSet(items: [], rendered: "", resultBuilder: { _ in fatalError() })
    }

    public static func buildEither<TrueR, FalseR>(first set: _SelectionSet<TrueR>) -> _ConditionalSelectionSet<TrueR, FalseR> {
        return _ConditionalSelectionSet(underlying: set)
    }

    public static func buildEither<TrueR, FalseR>(second set: _SelectionSet<FalseR>) -> _ConditionalSelectionSet<TrueR, FalseR> {
        return _ConditionalSelectionSet(underlying: set)
    }

    public static func buildBlock<TrueR, FalseR>(_ set: _ConditionalSelectionSet<TrueR, FalseR>) -> _SelectionSet<Any> {
        return _SelectionSet(items: set.items, rendered: defaultRendered(set.items), resultBuilder: {
            try set.createResult(from: $0)
        })
    }
}

public class _ConditionalSelectionSet<TrueR, FalseR>: _SelectionSet<Any> {
    fileprivate init<R>(underlying: _SelectionSet<R>) {
        super.init(items: underlying.items, rendered: underlying.rendered, resultBuilder: { dict in
            try underlying.resultBuilder(dict)
        })
    }
}

private func defaultRendered(_ items: [_SelectionBase]) -> String {
    return "\(items.map { "\($0.render())" }.joined(separator: ","))"
}
