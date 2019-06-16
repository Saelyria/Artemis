import Foundation

/*
@_functionBuilder
struct QueryOperationBuilder {
    static func buildBlock
        <Q: AnyQueryOperation>
        (_ arg1: Q)
        -> AggregateOperationItem1<Querying, Q>
    {
        return AggregateOperationItem1(op1: arg1)
    }
    
    static func buildBlock
        <Q1: AnyQueryOperation, Q2: AnyQueryOperation>
        (_ arg1: Q1, _ arg2: Q2)
        -> AggregateOperationItem2<Querying, Q1, Q2>
    {
        return AggregateOperationItem2(op1: arg1, op2: arg2)
    }
    
    static func buildBlock
        <Q1: AnyQueryOperation, Q2: AnyQueryOperation, Q3: AnyQueryOperation>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3)
        -> AggregateOperationItem3<Querying, Q1, Q2, Q3>
    {
        return AggregateOperationItem3(op1: arg1, op2: arg2, op3: arg3)
    }
    
    static func buildBlock
        <Q1: AnyQueryOperation, Q2: AnyQueryOperation, Q3: AnyQueryOperation, Q4: AnyQueryOperation>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4)
        -> AggregateOperationItem4<Querying, Q1, Q2, Q3, Q4>
    {
        return AggregateOperationItem4(op1: arg1, op2: arg2, op3: arg3, op4: arg4)
    }
    
    static func buildBlock
        <Q1: AnyQueryOperation, Q2: AnyQueryOperation, Q3: AnyQueryOperation, Q4: AnyQueryOperation, Q5: AnyQueryOperation>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5)
        -> AggregateOperationItem5<Querying, Q1, Q2, Q3, Q4, Q5>
    {
        return AggregateOperationItem5(op1: arg1, op2: arg2, op3: arg3, op4: arg4, op5: arg5)
    }
    
    static func buildBlock
        <Q1: AnyQueryOperation, Q2: AnyQueryOperation, Q3: AnyQueryOperation, Q4: AnyQueryOperation, Q5: AnyQueryOperation, Q6: AnyQueryOperation>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5, _ arg6: Q6)
        -> AggregateOperationItem6<Querying, Q1, Q2, Q3, Q4, Q5, Q6>
    {
        return AggregateOperationItem6(op1: arg1, op2: arg2, op3: arg3, op4: arg4, op5: arg5, op6: arg6)
    }
    
    static func buildBlock
        <Q1: AnyQueryOperation, Q2: AnyQueryOperation, Q3: AnyQueryOperation, Q4: AnyQueryOperation, Q5: AnyQueryOperation, Q6: AnyQueryOperation, Q7: AnyQueryOperation>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5, _ arg6: Q6, _ arg7: Q7)
        -> AggregateOperationItem7<Querying, Q1, Q2, Q3, Q4, Q5, Q6, Q7>
    {
        return AggregateOperationItem7(op1: arg1, op2: arg2, op3: arg3, op4: arg4, op5: arg5, op6: arg6, op7: arg7)
    }
}
*/

@_functionBuilder
public struct QuerySubSelectionBuilder {
    public static func buildBlock
        <T, Q: GraphQLItem>
        (_ arg1: Q)
        -> AggregateGraphQLItem<T>
        where Q.T == T
    {
        return AggregateGraphQLItem([arg1])
    }
    
    public static func buildBlock
        <T, Q1: GraphQLItem, Q2: GraphQLItem>
        (_ arg1: Q1, _ arg2: Q2)
        -> AggregateGraphQLItem<T>
        where Q1.T == T, Q2.T == T
    {
        return AggregateGraphQLItem([arg1, arg2])
    }
    
    public static func buildBlock
        <T, Q1: GraphQLItem, Q2: GraphQLItem, Q3: GraphQLItem>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3)
        -> AggregateGraphQLItem<T>
        where Q1.T == T, Q2.T == T, Q3.T == T
    {
        return AggregateGraphQLItem([arg1, arg2, arg3])
    }
    
    public static func buildBlock
        <T, Q1: GraphQLItem, Q2: GraphQLItem, Q3: GraphQLItem, Q4: GraphQLItem>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4)
        -> AggregateGraphQLItem<T>
        where Q1.T == T, Q2.T == T, Q3.T == T, Q4.T == T
    {
        return AggregateGraphQLItem([arg1, arg2, arg3, arg4])
    }
    
    public static func buildBlock
        <T, Q1: GraphQLItem, Q2: GraphQLItem, Q3: GraphQLItem, Q4: GraphQLItem, Q5: GraphQLItem>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5)
        -> AggregateGraphQLItem<T>
        where Q1.T == T, Q2.T == T, Q3.T == T, Q4.T == T, Q5.T == T
    {
        return AggregateGraphQLItem([arg1, arg2, arg3, arg4, arg5])
    }

    public static func buildBlock
        <T, Q1: GraphQLItem, Q2: GraphQLItem, Q3: GraphQLItem, Q4: GraphQLItem, Q5: GraphQLItem, Q6: GraphQLItem>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5, _ arg6: Q6)
        -> AggregateGraphQLItem<T>
        where Q1.T == T, Q2.T == T, Q3.T == T, Q4.T == T, Q5.T == T, Q6.T == T
    {
        return AggregateGraphQLItem([arg1, arg2, arg3, arg4, arg5, arg6])
    }
    
    public static func buildBlock
        <T, Q1: GraphQLItem, Q2: GraphQLItem, Q3: GraphQLItem, Q4: GraphQLItem, Q5: GraphQLItem, Q6: GraphQLItem, Q7: GraphQLItem>
        (_ arg1: Q1, _ arg2: Q2, _ arg3: Q3, _ arg4: Q4, _ arg5: Q5, _ arg6: Q6, _ arg7: Q7)
        -> AggregateGraphQLItem<T>
        where Q1.T == T, Q2.T == T, Q3.T == T, Q4.T == T, Q5.T == T, Q6.T == T, Q7.T == T
    {
        return AggregateGraphQLItem([arg1, arg2, arg3, arg4, arg5, arg6, arg7])
    }
}
