import Foundation

/**
 A protocol describing a top-level root operation type.
 
 Objects conforming to this protocol declare the 'Result' type (either `Partial<T>` or a tuple of `Partial`s). This
 object can either be a `Query`/`Mutation` object or an `AggregateOperationItem` that wraps multiple of them.
 */
protocol AnyAggregateOperation: AnyGraphQLItem {
    associatedtype Result
    
    func createResult(from: [String : Any]) throws -> Result
}

protocol AnyAggregateOperationItem: AnyAggregateOperation {
    var items: [AnyGraphQLItem] { get }
    associatedtype OperationType
}
extension AnyAggregateOperationItem {
    func render() -> String {
        return "\(self.items.map { "\($0.render())" }.joined(separator: ", "))"
    }
    
    func renderDebug() -> String {
        return "\(self.items.reduce(into: "", { $0.append("\($1.render())\n") }))"
    }
    
    func unsafeIncludedKeyPaths() -> [(String, AnyKeyPath)] {
        return []
    }
}

class AggregateOperationItem1
    <OperationType, Q1: AnyAggregateOperation>
    : AnyAggregateOperationItem
{
    typealias Result = Q1.Result
    
    var items: [AnyGraphQLItem] { [op1] }
    let op1: Q1
    
    init(op1: Q1) {
        self.op1 = op1
    }
    
    func createResult(from dict: [String : Any]) throws -> Result {
        return try op1.createResult(from: dict)
    }
}

class AggregateOperationItem2
    <OperationType, Q1: AnyAggregateOperation, Q2: AnyAggregateOperation>
    : AnyAggregateOperationItem
{
    typealias Result = (Q1.Result, Q2.Result)

    var items: [AnyGraphQLItem] { [op1, op2] }
    let op1: Q1, op2: Q2
    
    init(op1: Q1, op2: Q2) {
        self.op1 = op1; self.op2 = op2
    }
    
    func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try op1.createResult(from: dict),
            try op2.createResult(from: dict)
        )
    }
}

class AggregateOperationItem3
    <OperationType, Q1: AnyAggregateOperation, Q2: AnyAggregateOperation, Q3: AnyAggregateOperation>
    : AnyAggregateOperationItem
{
    typealias Result = (Q1.Result, Q2.Result, Q3.Result)

    var items: [AnyGraphQLItem] { [op1, op2, op3] }
    let op1: Q1, op2: Q2, op3: Q3
    
    init(op1: Q1, op2: Q2, op3: Q3) {
        self.op1 = op1; self.op2 = op2; self.op3 = op3
    }

    func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try op1.createResult(from: dict),
            try op2.createResult(from: dict),
            try op3.createResult(from: dict)
        )
    }
}

class AggregateOperationItem4
    <OperationType, Q1: AnyAggregateOperation, Q2: AnyAggregateOperation, Q3: AnyAggregateOperation, Q4: AnyAggregateOperation>
    : AnyAggregateOperationItem
{
    typealias Result = (Q1.Result, Q2.Result, Q3.Result, Q4.Result)
    
    var items: [AnyGraphQLItem] { [op1, op2, op3, op4] }
    let op1: Q1, op2: Q2, op3: Q3, op4: Q4
    
    init(op1: Q1, op2: Q2, op3: Q3, op4: Q4) {
        self.op1 = op1; self.op2 = op2; self.op3 = op3; self.op4 = op4
    }
    
    func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try op1.createResult(from: dict),
            try op2.createResult(from: dict),
            try op3.createResult(from: dict),
            try op4.createResult(from: dict)
        )
    }
}

class AggregateOperationItem5
    <OperationType, Q1: AnyAggregateOperation, Q2: AnyAggregateOperation, Q3: AnyAggregateOperation, Q4: AnyAggregateOperation, Q5: AnyAggregateOperation>
    : AnyAggregateOperationItem
{
    typealias Result = (Q1.Result, Q2.Result, Q3.Result, Q4.Result, Q5.Result)
    
    var items: [AnyGraphQLItem] { [op1, op2, op3, op4, op5] }
    let op1: Q1, op2: Q2, op3: Q3, op4: Q4, op5: Q5
    
    init(op1: Q1, op2: Q2, op3: Q3, op4: Q4, op5: Q5) {
        self.op1 = op1; self.op2 = op2; self.op3 = op3; self.op4 = op4; self.op5 = op5
    }
    
    func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try op1.createResult(from: dict),
            try op2.createResult(from: dict),
            try op3.createResult(from: dict),
            try op4.createResult(from: dict),
            try op5.createResult(from: dict)
        )
    }
}

class AggregateOperationItem6
    <OperationType, Q1: AnyAggregateOperation, Q2: AnyAggregateOperation, Q3: AnyAggregateOperation, Q4: AnyAggregateOperation, Q5: AnyAggregateOperation, Q6: AnyAggregateOperation>
    : AnyAggregateOperationItem
{
    typealias Result = (Q1.Result, Q2.Result, Q3.Result, Q4.Result, Q5.Result, Q6.Result)
    
    var items: [AnyGraphQLItem] { [op1, op2, op3, op4, op5, op6] }
    let op1: Q1, op2: Q2, op3: Q3, op4: Q4, op5: Q5, op6: Q6
    
    init(op1: Q1, op2: Q2, op3: Q3, op4: Q4, op5: Q5, op6: Q6) {
        self.op1 = op1; self.op2 = op2; self.op3 = op3; self.op4 = op4; self.op5 = op5; self.op6 = op6
    }
    
    func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try op1.createResult(from: dict),
            try op2.createResult(from: dict),
            try op3.createResult(from: dict),
            try op4.createResult(from: dict),
            try op5.createResult(from: dict),
            try op6.createResult(from: dict)
        )
    }
}

class AggregateOperationItem7
    <OperationType, Q1: AnyAggregateOperation, Q2: AnyAggregateOperation, Q3: AnyAggregateOperation, Q4: AnyAggregateOperation, Q5: AnyAggregateOperation, Q6: AnyAggregateOperation, Q7: AnyAggregateOperation>
    : AnyAggregateOperationItem
{
    typealias Result = (Q1.Result, Q2.Result, Q3.Result, Q4.Result, Q5.Result, Q6.Result, Q7.Result)
    
    var items: [AnyGraphQLItem] { [op1, op2, op3, op4, op5, op6, op7] }
    let op1: Q1, op2: Q2, op3: Q3, op4: Q4, op5: Q5, op6: Q6, op7: Q7
    
    init(op1: Q1, op2: Q2, op3: Q3, op4: Q4, op5: Q5, op6: Q6, op7: Q7) {
        self.op1 = op1; self.op2 = op2; self.op3 = op3; self.op4 = op4; self.op5 = op5; self.op6 = op6; self.op7 = op7
    }
    
    func createResult(from dict: [String : Any]) throws -> Result {
        return (
            try op1.createResult(from: dict),
            try op2.createResult(from: dict),
            try op3.createResult(from: dict),
            try op4.createResult(from: dict),
            try op5.createResult(from: dict),
            try op6.createResult(from: dict),
            try op7.createResult(from: dict)
        )
    }
}
