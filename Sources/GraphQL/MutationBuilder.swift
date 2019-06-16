import Foundation

/*

@_functionBuilder
struct MutationOperationBuilder {
    static func buildBlock
        <Q: AnyMutationOperation>
        (_ arg1: Q)
        -> AggregateOperationItem1<Mutating, Q>
    {
        return AggregateOperationItem1(op1: arg1)
    }
    
    static func buildBlock
        <Q1: AnyMutationOperation, Q2: AnyMutationOperation>
        (_ arg1: Q1, _ arg2: Q2)
        -> AggregateOperationItem2<Mutating, Q1, Q2>
    {
        return AggregateOperationItem2(op1: arg1, op2: arg2)
    }
    
    static func buildBlock
        <Q1: AnyMutationOperation, Q2: AnyMutationOperation, Q3: AnyMutationOperation>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3)
        -> AggregateOperationItem3<Mutating, Q1, Q2, Q3>
    {
        return AggregateOperationItem3(op1: arg1, op2: arg2, op3: arg3)
    }
    
    static func buildBlock
        <Q1: AnyMutationOperation, Q2: AnyMutationOperation, Q3: AnyMutationOperation, Q4: AnyMutationOperation>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4)
        -> AggregateOperationItem4<Mutating, Q1, Q2, Q3, Q4>
    {
        return AggregateOperationItem4(op1: arg1, op2: arg2, op3: arg3, op4: arg4)
    }
    
    static func buildBlock
        <Q1: AnyMutationOperation, Q2: AnyMutationOperation, Q3: AnyMutationOperation, Q4: AnyMutationOperation, Q5: AnyMutationOperation>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5)
        -> AggregateOperationItem5<Mutating, Q1, Q2, Q3, Q4, Q5>
    {
        return AggregateOperationItem5(op1: arg1, op2: arg2, op3: arg3, op4: arg4, op5: arg5)
    }
    
    static func buildBlock
        <Q1: AnyMutationOperation, Q2: AnyMutationOperation, Q3: AnyMutationOperation, Q4: AnyMutationOperation, Q5: AnyMutationOperation, Q6: AnyMutationOperation>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5, _ arg6: Q6)
        -> AggregateOperationItem6<Mutating, Q1, Q2, Q3, Q4, Q5, Q6>
    {
        return AggregateOperationItem6(op1: arg1, op2: arg2, op3: arg3, op4: arg4, op5: arg5, op6: arg6)
    }
    
    static func buildBlock
        <Q1: AnyMutationOperation, Q2: AnyMutationOperation, Q3: AnyMutationOperation, Q4: AnyMutationOperation, Q5: AnyMutationOperation, Q6: AnyMutationOperation, Q7: AnyMutationOperation>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5, _ arg6: Q6, _ arg7: Q7)
        -> AggregateOperationItem7<Mutating, Q1, Q2, Q3, Q4, Q5, Q6, Q7>
    {
        return AggregateOperationItem7(op1: arg1, op2: arg2, op3: arg3, op4: arg4, op5: arg5, op6: arg6, op7: arg7)
    }
}

typealias MutatingItem = Mutating & GraphQLItem

@_functionBuilder
struct MutationBuilder {
    static func buildBlock
        <T, Q: MutatingItem>
        (_ arg1: Q)
        -> AggregateGraphQLItem<T, Mutating>
        where Q.T == T
    {
        return AggregateGraphQLItem([arg1])
    }
    
    static func buildBlock
        <T, Q1: MutatingItem, Q2: MutatingItem>
        (_ arg1: Q1, _ arg2: Q2)
        -> AggregateGraphQLItem<T, Mutating>
        where Q1.T == T, Q2.T == T
    {
        return AggregateGraphQLItem([arg1, arg2])
    }
    
    static func buildBlock
        <T, Q1: MutatingItem, Q2: MutatingItem, Q3: MutatingItem>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3)
        -> AggregateGraphQLItem<T, Mutating>
        where Q1.T == T, Q2.T == T, Q3.T == T
    {
        return AggregateGraphQLItem([arg1, arg2, arg3])
    }
    
    static func buildBlock
        <T, Q1: MutatingItem, Q2: MutatingItem, Q3: MutatingItem, Q4: MutatingItem>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4)
        -> AggregateGraphQLItem<T, Mutating>
        where Q1.T == T, Q2.T == T, Q3.T == T, Q4.T == T
    {
        return AggregateGraphQLItem([arg1, arg2, arg3, arg4])
    }
    
    static func buildBlock
        <T, Q1: MutatingItem, Q2: MutatingItem, Q3: MutatingItem, Q4: MutatingItem, Q5: MutatingItem>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5)
        -> AggregateGraphQLItem<T, Mutating>
        where Q1.T == T, Q2.T == T, Q3.T == T, Q4.T == T, Q5.T == T
    {
        return AggregateGraphQLItem([arg1, arg2, arg3, arg4, arg5])
    }
    
    static func buildBlock
        <T, Q1: MutatingItem, Q2: MutatingItem, Q3: MutatingItem, Q4: MutatingItem, Q5: MutatingItem, Q6: MutatingItem>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5, _ arg6: Q6)
        -> AggregateGraphQLItem<T, Mutating>
        where Q1.T == T, Q2.T == T, Q3.T == T, Q4.T == T, Q5.T == T, Q6.T == T
    {
        return AggregateGraphQLItem([arg1, arg2, arg3, arg4, arg5, arg6])
    }
    
    static func buildBlock
        <T, Q1: MutatingItem, Q2: MutatingItem, Q3: MutatingItem, Q4: MutatingItem, Q5: MutatingItem, Q6: MutatingItem, Q7: MutatingItem>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5, _ arg6: Q6, _ arg7: Q7)
        -> AggregateGraphQLItem<T, Mutating>
        where Q1.T == T, Q2.T == T, Q3.T == T, Q4.T == T, Q5.T == T, Q6.T == T, Q7.T == T
    {
        return AggregateGraphQLItem([arg1, arg2, arg3, arg4, arg5, arg6, arg7])
    }
}

*/
