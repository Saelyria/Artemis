import XCTest
@testable import Artemis

final class IntRenderTests: XCTestCase {
    func testIntRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.int
        }
        XCTAssertEqual(query.render(), "{int}")
    }

    func testIntArgsRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.intArgs
        }
        XCTAssertEqual(query.render(), "{intArgs}")
    }

    func testIntsRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.ints
        }
        XCTAssertEqual(query.render(), "{ints}")
    }

    func testIntsArgsRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.intsArgs
        }
        XCTAssertEqual(query.render(), "{intsArgs}")
    }
}
