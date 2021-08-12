import XCTest
@testable import Artemis

class MaxSelectionTests: XCTestCase {
    func testSelection2() {
        let query: _Operation<TestSchema, (Int, Int)> = .query {
            $0.int(alias: "one")
            $0.int(alias: "two")
        }
        let response = Data("""
        {
            "data": {
                "one": 1,
                "two": 2
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{one:int,two:int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.0, 1)
        XCTAssertEqual(res?.1, 2)
    }

    func testSelection3() {
        let query: _Operation<TestSchema, (Int, Int, Int)> = .query {
            $0.int(alias: "one")
            $0.int(alias: "two")
            $0.int(alias: "three")
        }
        let response = Data("""
        {
            "data": {
                "one": 1,
                "two": 2,
                "three": 3
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{one:int,two:int,three:int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.0, 1)
        XCTAssertEqual(res?.1, 2)
        XCTAssertEqual(res?.2, 3)
    }

    func testSelection4() {
        let query: _Operation<TestSchema, (Int, Int, Int, Int)> = .query {
            $0.int(alias: "one")
            $0.int(alias: "two")
            $0.int(alias: "three")
            $0.int(alias: "four")
        }
        let response = Data("""
        {
            "data": {
                "one": 1,
                "two": 2,
                "three": 3,
                "four": 4
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{one:int,two:int,three:int,four:int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.0, 1)
        XCTAssertEqual(res?.1, 2)
        XCTAssertEqual(res?.2, 3)
        XCTAssertEqual(res?.3, 4)
    }

    func testSelection5() {
        let query: _Operation<TestSchema, (Int, Int, Int, Int, Int)> = .query {
            $0.int(alias: "one")
            $0.int(alias: "two")
            $0.int(alias: "three")
            $0.int(alias: "four")
            $0.int(alias: "five")
        }
        let response = Data("""
        {
            "data": {
                "one": 1,
                "two": 2,
                "three": 3,
                "four": 4,
                "five": 5
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{one:int,two:int,three:int,four:int,five:int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.0, 1)
        XCTAssertEqual(res?.1, 2)
        XCTAssertEqual(res?.2, 3)
        XCTAssertEqual(res?.3, 4)
        XCTAssertEqual(res?.4, 5)
    }

    func testSelection6() {
        let query: _Operation<TestSchema, (Int, Int, Int, Int, Int, Int)> = .query {
            $0.int(alias: "one")
            $0.int(alias: "two")
            $0.int(alias: "three")
            $0.int(alias: "four")
            $0.int(alias: "five")
            $0.int(alias: "six")
        }
        let response = Data("""
        {
            "data": {
                "one": 1,
                "two": 2,
                "three": 3,
                "four": 4,
                "five": 5,
                "six": 6
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{one:int,two:int,three:int,four:int,five:int,six:int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.0, 1)
        XCTAssertEqual(res?.1, 2)
        XCTAssertEqual(res?.2, 3)
        XCTAssertEqual(res?.3, 4)
        XCTAssertEqual(res?.4, 5)
        XCTAssertEqual(res?.5, 6)
    }

    func testSelection7() {
        let query: _Operation<TestSchema, (Int, Int, Int, Int, Int, Int, Int)> = .query {
            $0.int(alias: "one")
            $0.int(alias: "two")
            $0.int(alias: "three")
            $0.int(alias: "four")
            $0.int(alias: "five")
            $0.int(alias: "six")
            $0.int(alias: "seven")
        }
        let response = Data("""
        {
            "data": {
                "one": 1,
                "two": 2,
                "three": 3,
                "four": 4,
                "five": 5,
                "six": 6,
                "seven": 7
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{one:int,two:int,three:int,four:int,five:int,six:int,seven:int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.0, 1)
        XCTAssertEqual(res?.1, 2)
        XCTAssertEqual(res?.2, 3)
        XCTAssertEqual(res?.3, 4)
        XCTAssertEqual(res?.4, 5)
        XCTAssertEqual(res?.5, 6)
        XCTAssertEqual(res?.6, 7)
    }

    func testSelection8() {
        let query: _Operation<TestSchema, (Int, Int, Int, Int, Int, Int, Int, Int)> = .query {
            $0.int(alias: "one")
            $0.int(alias: "two")
            $0.int(alias: "three")
            $0.int(alias: "four")
            $0.int(alias: "five")
            $0.int(alias: "six")
            $0.int(alias: "seven")
            $0.int(alias: "eight")
        }
        let response = Data("""
        {
            "data": {
                "one": 1,
                "two": 2,
                "three": 3,
                "four": 4,
                "five": 5,
                "six": 6,
                "seven": 7,
                "eight": 8
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{one:int,two:int,three:int,four:int,five:int,six:int,seven:int,eight:int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.0, 1)
        XCTAssertEqual(res?.1, 2)
        XCTAssertEqual(res?.2, 3)
        XCTAssertEqual(res?.3, 4)
        XCTAssertEqual(res?.4, 5)
        XCTAssertEqual(res?.5, 6)
        XCTAssertEqual(res?.6, 7)
        XCTAssertEqual(res?.7, 8)
    }

    func testSelection9() {
        let query: _Operation<TestSchema, (Int, Int, Int, Int, Int, Int, Int, Int, Int)> = .query {
            $0.int(alias: "one")
            $0.int(alias: "two")
            $0.int(alias: "three")
            $0.int(alias: "four")
            $0.int(alias: "five")
            $0.int(alias: "six")
            $0.int(alias: "seven")
            $0.int(alias: "eight")
            $0.int(alias: "nine")
        }
        let response = Data("""
        {
            "data": {
                "one": 1,
                "two": 2,
                "three": 3,
                "four": 4,
                "five": 5,
                "six": 6,
                "seven": 7,
                "eight": 8,
                "nine": 9
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{one:int,two:int,three:int,four:int,five:int,six:int,seven:int,eight:int,nine:int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.0, 1)
        XCTAssertEqual(res?.1, 2)
        XCTAssertEqual(res?.2, 3)
        XCTAssertEqual(res?.3, 4)
        XCTAssertEqual(res?.4, 5)
        XCTAssertEqual(res?.5, 6)
        XCTAssertEqual(res?.6, 7)
        XCTAssertEqual(res?.7, 8)
        XCTAssertEqual(res?.8, 9)
    }

    func testSelection10() {
        let query: _Operation<TestSchema, (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int)> = .query {
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
        let response = Data("""
        {
            "data": {
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
        """.utf8)

        XCTAssertEqual(query.render(), "{one:int,two:int,three:int,four:int,five:int,six:int,seven:int,eight:int,nine:int,ten:int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.0, 1)
        XCTAssertEqual(res?.1, 2)
        XCTAssertEqual(res?.2, 3)
        XCTAssertEqual(res?.3, 4)
        XCTAssertEqual(res?.4, 5)
        XCTAssertEqual(res?.5, 6)
        XCTAssertEqual(res?.6, 7)
        XCTAssertEqual(res?.7, 8)
        XCTAssertEqual(res?.8, 9)
        XCTAssertEqual(res?.9, 10)
    }
}

extension MaxSelectionTests {
    func testSelection2Nested() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int(alias: "one")
                $0.int(alias: "two")
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "one": 1,
                    "two": 2,
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{one:int,two:int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, nil)
        XCTAssertEqual(res?.get(\.int, alias: "one"), 1)
        XCTAssertEqual(res?.get(\.int, alias: "two"), 2)
    }
}
