import XCTest
@testable import Artemis

/**
 Smoke tests for ensuring that queries render with other properties like pretty printing as expected.
 */
final class OtherRenderTests: XCTestCase {
    func testDebugRender() throws {
//        let fragment = Fragment("fragName", on: Query.self) {
//            $0.objectsArgs(arguments: .testDefault) {
//                $0.int
//            }
//        }
//        let objectFragment = Fragment("objectFragName", on: TestObject.self) {
//            $0.bool
//            $0.double
//            $0.object {
//                $0.bool
//            }
//        }
//        let query: _Operation<Query, ([Partial<TestObject>], Never)> = .query {
//            $0.objects {
//                $0.enums
//                objectFragment
//            }
//            fragment
//        }
//
//        let expected = """
//        {
//           objects {
//              enums
//              ...objectFragName
//           }
//           ...fragName
//        }
//        """
//        XCTAssertEqual(query.renderDebug(), expected)
    }
}
