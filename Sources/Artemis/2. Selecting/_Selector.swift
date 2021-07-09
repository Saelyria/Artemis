import Foundation

/**
 A type used to turn keypaths from `T` into functions that build `Selection` instances.
 */
@dynamicMemberLookup
public class _Selector<T: Object> { }

// MARK: Selecting on Object and Scalar on T

extension _Selector {
    public subscript<Value: Object, S: _SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> _SelectionSetBuilderWrapper<T, S, Value, Value, NoArguments> {
        return _SelectionSetBuilderWrapper(keyPath: keyPath)
    }

    public subscript<Value: Object, Args: ArgumentsList, S: _SelectionProtocol>(
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args)>
    ) -> _SelectionSetBuilderWrapper<T, S, (Value, Args), Value, Args> {
        return _SelectionSetBuilderWrapper(keyPath: keyPath)
    }
}

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
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args)>
    ) -> _Selection<T, Value.Result, Args> {
        return AliasBuilderWrapper<T, (Value, Args), Value, Args>(keyPath: keyPath)(alias: nil)
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
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args)>
    ) -> AliasBuilderWrapper<T, (Value, Args), Value, Args> {
        return AliasBuilderWrapper(keyPath: keyPath)
    }
}

// MARK: Selecting on Object and Scalar on I1

extension _Selector where T.ImplementedInterfaces.I1: Interface {
    public typealias I1 = T.ImplementedInterfaces.I1
}

extension _Selector where T.ImplementedInterfaces.I1: Interface {
    public subscript<Value: Object, S: _SelectionProtocol>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> _SelectionSetBuilderWrapper<I1, S, Value, Value, NoArguments> {
        return _SelectionSetBuilderWrapper(keyPath: keyPath)
    }

    public subscript<Value: Object, Args: ArgumentsList, S: _SelectionProtocol>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, (Value, Args)>
    ) -> _SelectionSetBuilderWrapper<I1, S, (Value, Args), Value, Args> {
        return _SelectionSetBuilderWrapper(keyPath: keyPath)
    }
}

extension _Selector where T.ImplementedInterfaces.I1: Interface {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> _Selection<I1, Value.Result, NoArguments> {
        return AliasBuilderWrapper<I1, Value, Value, NoArguments>(keyPath: keyPath)(alias: nil)
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, (Value, Args)>
    ) -> _Selection<I1, Value.Result, Args> {
        return AliasBuilderWrapper<I1, (Value, Args), Value, Args>(keyPath: keyPath)(alias: nil)
    }

    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> AliasBuilderWrapper<I1, Value, Value, NoArguments> {
        return AliasBuilderWrapper<I1, Value, Value, NoArguments>(keyPath: keyPath)
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, (Value, Args)>
    ) -> AliasBuilderWrapper<I1, (Value, Args), Value, Args> {
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
            // Accessing the keypath makes the Field property wrapper populate a dictionary for the Object instance
            // with the string name of the keypath.
            let _ = T.schema[keyPath: keyPath]
            guard let key = T.key(forPath: keyPath) else {
                fatalError("No key set - is this value wrapped in a @Field property wrapper?")
            }
            let fieldType: _Selection<T, Value.Result, Args>.FieldType = .field(
                key: key,
                alias: alias,
                renderedSelectionSet: nil,
                createResult: { dict in
                    return try Value.createUnsafeResult(from: dict, key: key)
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
            @_SelectionSetBuilder<Value> _ builder: @escaping (_Selector<Value>) -> S
        ) -> _Selection<T, Value.Result, Args> {
            // Accessing the keypath makes the Field property wrapper populate a dictionary for the Object instance
            // with the string name of the keypath.
            let _ = T.schema[keyPath: keyPath]
            let selectedFields = builder(_Selector<Value>())
            guard let key = T.key(forPath: keyPath) else {
                fatalError("No key set - is this value wrapped in a @Field property wrapper?")
            }
            let fieldType: _Selection<T, Value.Result, Args>.FieldType = .field(
                key: key,
                alias: alias,
                renderedSelectionSet: selectedFields.render(),
                createResult: { dict in
                    return try Value.createUnsafeResult(from: dict, key: key)
                }
            )
            return _Selection(fieldType: fieldType, items: selectedFields.items)
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
