import XCTest
@testable import Artemis

class MaxSelectionTests: XCTestCase {
    func testMaxSelection() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int(alias: "one")
                $0.int(alias: "two")
                $0.int(alias: "three")
                $0.int(alias: "four")
                $0.int(alias: "five")
                $0.int(alias: "six")
                $0.int(alias: "seven")
                $0.int(alias: "eight")
                $0.int(alias: "nine")
                $0.int(alias: "ten")
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "one": 1,
                    "two": 2,
                    "three": 3,
                    "four": 4,
                    "five": 5,
                    "six": 6,
                    "seven": 7,
                    "eight": 8,
                    "nine": 9,
                    "ten": 10
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{one:int,two:int,three:int,four:int,five:int,six:int,seven:int,eight:int,nine:int,ten:int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, nil)
        XCTAssertEqual(res?.get(\.int, alias: "one"), 1)
        XCTAssertEqual(res?.get(\.int, alias: "two"), 2)
        XCTAssertEqual(res?.get(\.int, alias: "three"), 3)
        XCTAssertEqual(res?.get(\.int, alias: "four"), 4)
        XCTAssertEqual(res?.get(\.int, alias: "five"), 5)
        XCTAssertEqual(res?.get(\.int, alias: "six"), 6)
        XCTAssertEqual(res?.get(\.int, alias: "seven"), 7)
        XCTAssertEqual(res?.get(\.int, alias: "eight"), 8)
        XCTAssertEqual(res?.get(\.int, alias: "nine"), 9)
        XCTAssertEqual(res?.get(\.int, alias: "ten"), 10)
    }
}
