import XCTest
@testable import GraphQL

final class QueryRenderingTests: XCTestCase {
    func testExample() {
        let query: Query<QuerySchema, Partial<PersonSchema>> = Query {
            Select(\.person, arguments: .init(id: "123", number: 1)) {
                Select(\.firstName)
            }
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
