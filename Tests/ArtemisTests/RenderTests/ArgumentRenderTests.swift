import XCTest
@testable import Artemis

/**
 Tests for ensuring that `ArgumentsList` rendered as expected.
 */
final class ArgumentsListRenderTests: XCTestCase {
    func testArgsListRender() throws {
        let rendered = try ArgumentEncoder().encode(TestArguments.testDefault)
        XCTAssertEqual(rendered, TestArguments.expectedTestRenderedString)
    }
}
