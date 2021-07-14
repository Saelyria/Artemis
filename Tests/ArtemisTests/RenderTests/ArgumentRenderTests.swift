import XCTest
@testable import Artemis

/**
 Tests for ensuring that `ArgumentsList` rendered as expected.
 */
final class ArgumentsListRenderTests: XCTestCase {
    func testArgsListRender() throws {
        let rendered = try ArgumentEncoder().encode(Schema.TestArguments.testDefault)
        XCTAssertEqual(rendered, Schema.TestArguments.expectedTestRenderedString)
    }
}
