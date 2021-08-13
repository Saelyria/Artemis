import Foundation

/**
 A type used to turn keypaths from `T` into functions that build `_Selection` instances inside closures that use the
 `_SelectionSetBuilder` result builder.
 */
@dynamicMemberLookup
public class _Selector<T: Object> { }

// MARK: Selecting on Object and Scalar on T

extension _Selector {
    public subscript<Value: Object, R>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> _AliasObjectSelector<T, R, Value, Value, NoArguments> {
        return _AliasObjectSelector(keyPath: keyPath)
    }

    public subscript<Value: Object, Args: ArgumentsList, R>(
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>
    ) -> _AliasObjectSelector<T, R, (Value, Args.Type), Value, Args> {
        return _AliasObjectSelector(keyPath: keyPath)
    }
}

extension _Selector {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> _Selection<T, Value.Result> {
        return _AliasSelector<T, Value, Value, NoArguments>(keyPath: keyPath)(alias: nil)
    }

    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<T.SubSchema, Value>
    ) -> _AliasSelector<T, Value, Value, NoArguments> {
        return _AliasSelector<T, Value, Value, NoArguments>(keyPath: keyPath)
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<T.SubSchema, (Value, Args.Type)>
    ) -> _AliasSelector<T, (Value, Args.Type), Value, Args> {
        return _AliasSelector(keyPath: keyPath)
    }
}

// MARK: Selecting on Object and Scalar on I1

extension _Selector where T.ImplementedInterfaces.I1: Interface {
    public typealias I1 = T.ImplementedInterfaces.I1
}

extension _Selector where T.ImplementedInterfaces.I1: Interface {
    public subscript<Value: Object, R>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> _AliasObjectSelector<I1, R, Value, Value, NoArguments> {
        return _AliasObjectSelector(keyPath: keyPath)
    }

    public subscript<Value: Object, Args: ArgumentsList, R>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>
    ) -> _AliasObjectSelector<I1, R, (Value, Args.Type), Value, Args> {
        return _AliasObjectSelector(keyPath: keyPath)
    }
}

extension _Selector where T.ImplementedInterfaces.I1: Interface {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> _Selection<I1, Value.Result> {
        return _AliasSelector<I1, Value, Value, NoArguments>(keyPath: keyPath)(alias: nil)
    }

    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, Value>
    ) -> _AliasSelector<I1, Value, Value, NoArguments> {
        return _AliasSelector<I1, Value, Value, NoArguments>(keyPath: keyPath)
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I1.SubSchema, (Value, Args.Type)>
    ) -> _AliasSelector<I1, (Value, Args.Type), Value, Args> {
        return _AliasSelector(keyPath: keyPath)
    }
}

// MARK: Selecting on Object and Scalar on I2

extension _Selector where T.ImplementedInterfaces.I2: Interface {
    public typealias I2 = T.ImplementedInterfaces.I2
}

extension _Selector where T.ImplementedInterfaces.I2: Interface {
    public subscript<Value: Object, R>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, Value>
    ) -> _AliasObjectSelector<I2, R, Value, Value, NoArguments> {
        return _AliasObjectSelector(keyPath: keyPath)
    }

    public subscript<Value: Object, Args: ArgumentsList, R>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, (Value, Args.Type)>
    ) -> _AliasObjectSelector<I2, R, (Value, Args.Type), Value, Args> {
        return _AliasObjectSelector(keyPath: keyPath)
    }
}

extension _Selector where T.ImplementedInterfaces.I2: Interface {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, Value>
    ) -> _Selection<I2, Value.Result> {
        return _AliasSelector<I2, Value, Value, NoArguments>(keyPath: keyPath)(alias: nil)
    }

    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, Value>
    ) -> _AliasSelector<I2, Value, Value, NoArguments> {
        return _AliasSelector<I2, Value, Value, NoArguments>(keyPath: keyPath)
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I2.SubSchema, (Value, Args.Type)>
    ) -> _AliasSelector<I2, (Value, Args.Type), Value, Args> {
        return _AliasSelector(keyPath: keyPath)
    }
}

// MARK: Selecting on Object and Scalar on I3

extension _Selector where T.ImplementedInterfaces.I3: Interface {
    public typealias I3 = T.ImplementedInterfaces.I3
}

extension _Selector where T.ImplementedInterfaces.I3: Interface {
    public subscript<Value: Object, R>(
        dynamicMember keyPath: KeyPath<I3.SubSchema, Value>
    ) -> _AliasObjectSelector<I3, R, Value, Value, NoArguments> {
        return _AliasObjectSelector(keyPath: keyPath)
    }

    public subscript<Value: Object, Args: ArgumentsList, R>(
        dynamicMember keyPath: KeyPath<I3.SubSchema, (Value, Args.Type)>
    ) -> _AliasObjectSelector<I3, R, (Value, Args.Type), Value, Args> {
        return _AliasObjectSelector(keyPath: keyPath)
    }
}

extension _Selector where T.ImplementedInterfaces.I3: Interface {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I3.SubSchema, Value>
    ) -> _Selection<I3, Value.Result> {
        return _AliasSelector<I3, Value, Value, NoArguments>(keyPath: keyPath)(alias: nil)
    }

    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I3.SubSchema, Value>
    ) -> _AliasSelector<I3, Value, Value, NoArguments> {
        return _AliasSelector<I3, Value, Value, NoArguments>(keyPath: keyPath)
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I3.SubSchema, (Value, Args.Type)>
    ) -> _AliasSelector<I3, (Value, Args.Type), Value, Args> {
        return _AliasSelector(keyPath: keyPath)
    }
}

// MARK: Selecting on Object and Scalar on I4

extension _Selector where T.ImplementedInterfaces.I4: Interface {
    public typealias I4 = T.ImplementedInterfaces.I4
}

extension _Selector where T.ImplementedInterfaces.I4: Interface {
    public subscript<Value: Object, R>(
        dynamicMember keyPath: KeyPath<I4.SubSchema, Value>
    ) -> _AliasObjectSelector<I4, R, Value, Value, NoArguments> {
        return _AliasObjectSelector(keyPath: keyPath)
    }

    public subscript<Value: Object, Args: ArgumentsList, R>(
        dynamicMember keyPath: KeyPath<I4.SubSchema, (Value, Args.Type)>
    ) -> _AliasObjectSelector<I4, R, (Value, Args.Type), Value, Args> {
        return _AliasObjectSelector(keyPath: keyPath)
    }
}

extension _Selector where T.ImplementedInterfaces.I4: Interface {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I4.SubSchema, Value>
    ) -> _Selection<I4, Value.Result> {
        return _AliasSelector<I4, Value, Value, NoArguments>(keyPath: keyPath)(alias: nil)
    }

    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I4.SubSchema, Value>
    ) -> _AliasSelector<I4, Value, Value, NoArguments> {
        return _AliasSelector<I4, Value, Value, NoArguments>(keyPath: keyPath)
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I4.SubSchema, (Value, Args.Type)>
    ) -> _AliasSelector<I4, (Value, Args.Type), Value, Args> {
        return _AliasSelector(keyPath: keyPath)
    }
}

// MARK: Selecting on Object and Scalar on I5

extension _Selector where T.ImplementedInterfaces.I5: Interface {
    public typealias I5 = T.ImplementedInterfaces.I5
}

extension _Selector where T.ImplementedInterfaces.I5: Interface {
    public subscript<Value: Object, R>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, Value>
    ) -> _AliasObjectSelector<I5, R, Value, Value, NoArguments> {
        return _AliasObjectSelector(keyPath: keyPath)
    }

    public subscript<Value: Object, Args: ArgumentsList, R>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, (Value, Args.Type)>
    ) -> _AliasObjectSelector<I5, R, (Value, Args.Type), Value, Args> {
        return _AliasObjectSelector(keyPath: keyPath)
    }
}

extension _Selector where T.ImplementedInterfaces.I5: Interface {
    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, Value>
    ) -> _Selection<I5, Value.Result> {
        return _AliasSelector<I5, Value, Value, NoArguments>(keyPath: keyPath)(alias: nil)
    }

    public subscript<Value: Scalar>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, Value>
    ) -> _AliasSelector<I5, Value, Value, NoArguments> {
        return _AliasSelector<I5, Value, Value, NoArguments>(keyPath: keyPath)
    }

    public subscript<Value: Scalar, Args: ArgumentsList>(
        dynamicMember keyPath: KeyPath<I5.SubSchema, (Value, Args.Type)>
    ) -> _AliasSelector<I5, (Value, Args.Type), Value, Args> {
        return _AliasSelector(keyPath: keyPath)
    }
}

/*
 Technical note: the following two objects are required to be returned instead of a closure for a couple reasons. One,
 result builders can't be applied to free closures (otherwise, the above subscripts that return these objects would
 instead return a closure like `(@_SelectionSetBuilder () -> _SelectionSet<R>) -> _Selection<T, R>`. Using an object
 with `callAsFunction` allows the result builder to be used, and also allows named arguments/better organization
 anyway.
 */
extension _Selector {
    /**
     An object that can be used to add an alias or arguments to a scalar field selection made with a `_Selector`.
     */
    public struct _AliasSelector<T: Object, FieldVal, Value: Scalar, Args: ArgumentsList> {
        let keyPath: KeyPath<T.SubSchema, FieldVal>

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
         - parameter arguments: The arguments for the field.
        */
        public func callAsFunction(
            alias: String? = nil,
            arguments: Args
        ) -> _Selection<T, Value.Result> {
            // Accessing the keypath makes the Field property wrapper populate a dictionary for the Object instance
            // with the string name of the keypath.
            let _ = T.schema[keyPath: keyPath]
            guard let key = T.key(forPath: keyPath) else {
                fatalError("No key set - is this value wrapped in a @Field property wrapper?")
            }
            return _Selection(
                key: key,
                alias: alias,
                arguments: (try? _ArgumentEncoder().encode(arguments)) ?? [],
                renderedSelectionSet: nil,
                createResult: { try Value.createUnsafeResult(from: $0, key: alias ?? key) },
                items: [],
                renderedFragmentDeclarations: [],
                error: nil
            )
        }
    }

    /**
     An object that can be used to add an alias or arguments to an object field selection made with a `_Selector`.
     */
    public struct _AliasObjectSelector<T: Object, R, FieldVal, Value: Object, Args: ArgumentsList> {
        let keyPath: KeyPath<T.SubSchema, FieldVal>

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
         - parameter arguments: The arguments for the field.
         - parameter builder: A closure to build the nested selection on this selection.
        */
        public func callAsFunction(
            alias: String? = nil,
            arguments: Args,
            @_SelectionSetBuilder<Value> _ builder: @escaping (_Selector<Value>) -> _SelectionSet<R>
        ) -> _Selection<T, Value.Result> {
            // Accessing the keypath makes the Field property wrapper populate a dictionary for the Object instance
            // with the string name of the keypath.
            let _ = T.schema[keyPath: keyPath]
            let selectedFields = builder(_Selector<Value>())
            guard let key = T.key(forPath: keyPath) else {
                fatalError("No key set - is this value wrapped in a @Field property wrapper?")
            }
            return _Selection(
                key: key,
                alias: alias,
                arguments: (try? _ArgumentEncoder().encode(arguments)) ?? [],
                renderedSelectionSet: selectedFields.render(),
                createResult: { try Value.createUnsafeResult(from: $0, key: alias ?? key) },
                items: selectedFields.items,
                renderedFragmentDeclarations: [],
                error: nil
            )
        }

        /**
         - parameter alias: The alias to use for this field in the rendered GraphQL document.
         - parameter arguments: The arguments for the field.
         - parameter builder: A closure to build the nested selection on this selection.
        */
        public func callAsFunction(
            alias: String? = nil,
            arguments: Args,
            @_SelectionSetBuilder<Value> _ builder: @escaping () -> _SelectionSet<R>
        ) -> _Selection<T, Value.Result> {
            return self.callAsFunction(alias: alias, arguments: arguments) { _ in return builder() }
        }
    }
}

extension _Selector._AliasSelector where Args == NoArguments {
    /**
     - parameter alias: The alias to use for this field in the rendered GraphQL document.
    */
    public func callAsFunction(
        alias: String?
    ) -> _Selection<T, Value.Result> {
        // Accessing the keypath makes the Field property wrapper populate a dictionary for the Object instance
        // with the string name of the keypath.
        let _ = T.schema[keyPath: keyPath]
        guard let key = T.key(forPath: keyPath) else {
            fatalError("No key set - is this value wrapped in a @Field property wrapper?")
        }
        return _Selection(
            key: key,
            alias: alias,
            arguments: [],
            renderedSelectionSet: nil,
            createResult: { try Value.createUnsafeResult(from: $0, key: alias ?? key) },
            items: [],
            renderedFragmentDeclarations: [],
            error: nil
        )
    }
}

extension _Selector._AliasObjectSelector where Args == NoArguments {
    /**
     - parameter alias: The alias to use for this field in the rendered GraphQL document.
     - parameter builder: A closure to build the nested selection on this selection.
    */
    public func callAsFunction(
        alias: String? = nil,
        @_SelectionSetBuilder<Value> _ builder: @escaping (_Selector<Value>) -> _SelectionSet<R>
    ) -> _Selection<T, Value.Result> {
        // Accessing the keypath makes the Field property wrapper populate a dictionary for the Object instance
        // with the string name of the keypath.
        let _ = T.schema[keyPath: keyPath]
        let selectedFields = builder(_Selector<Value>())
        guard let key = T.key(forPath: keyPath) else {
            fatalError("No key set - is this value wrapped in a @Field property wrapper?")
        }
        return _Selection(
            key: key,
            alias: alias,
            arguments: [],
            renderedSelectionSet: selectedFields.render(),
            createResult: { try Value.createUnsafeResult(from: $0, key: alias ?? key) },
            items: selectedFields.items,
            renderedFragmentDeclarations: [],
            error: nil
        )
    }

    /**
     - parameter alias: The alias to use for this field in the rendered GraphQL document.
     - parameter builder: A closure to build the nested selection on this selection.
    */
    public func callAsFunction(
        alias: String? = nil,
        @_SelectionSetBuilder<Value> _ builder: @escaping () -> _SelectionSet<R>
    ) -> _Selection<T, Value.Result> {
        return self.callAsFunction(alias: alias) { _ in return builder() }
    }
}
