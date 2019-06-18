import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(QueryRenderingTests.allTests),
    ]
}
#endif
