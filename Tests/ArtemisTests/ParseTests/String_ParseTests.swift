import XCTest
@testable import Artemis

extension String_ParseTests {
    func testSingleParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.string
        }
        let response = Data("""
        {
            "data": {
                "string": "value"
            }
        }
        """.utf8)

        let res = try query.createResult(from: response)

        XCTAssertEqual(res, "value")
    }

    func testSingleArgsParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.stringArgs(arguments: .testDefault)
        }
        let response = Data("""
        {
            "data": {
                "stringArgs": "value"
            }
        }
        """.utf8)

        let res = try query.createResult(from: response)

        XCTAssertEqual(res, "value")
    }

    func testArrayParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.strings
        }
        let response = Data("""
        {
            "data": {
                "strings": ["value1", "value2"]
            }
        }
        """.utf8)

        let res = try query.createResult(from: response)

        XCTAssertEqual(res.count, 2)
        XCTAssertEqual(res[0], "value1")
        XCTAssertEqual(res[1], "value2")
    }

    func testArrayArgsParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.stringsArgs(arguments: .testDefault)
        }
        let response = Data("""
        {
            "data": {
                "stringsArgs": ["value1", "value2"]
            }
        }
        """.utf8)

        let res = try query.createResult(from: response)

        XCTAssertEqual(res.count, 2)
        XCTAssertEqual(res[0], "value1")
        XCTAssertEqual(res[1], "value2")
    }
}

extension String_ParseTests {
    func testSingleAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.string(alias: "alias")
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        let res = try query.createResult(from: response)

        XCTAssertEqual(res, "value")
    }

    func testSingleArgsAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.stringArgs(alias: "alias", arguments: .testDefault)
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        let res = try query.createResult(from: response)

        XCTAssertEqual(res, "value")
    }

    func testArrayAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.strings(alias: "alias")
        }
        let response = Data("""
        {
            "data": {
                "alias": ["value1", "value2"]
            }
        }
        """.utf8)

        let res = try query.createResult(from: response)

        XCTAssertEqual(res.count, 2)
        XCTAssertEqual(res[0], "value1")
        XCTAssertEqual(res[1], "value2")
    }

    func testArrayArgsAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.stringsArgs(alias: "alias", arguments: .testDefault)
        }
        let response = Data("""
        {
            "data": {
                "alias": ["value1", "value2"]
            }
        }
        """.utf8)

        let res = try query.createResult(from: response)

        XCTAssertEqual(res.count, 2)
        XCTAssertEqual(res[0], "value1")
        XCTAssertEqual(res[1], "value2")
    }
}

extension String_ParseTests {
    func testSingleOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.string
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "string": "value"
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject> = try query.createResult(from: response)

        XCTAssertEqual(res.values.count, 1)
        XCTAssertEqual(res.string, "value")
    }

    func testSingleArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.stringArgs(arguments: .testDefault)
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "stringArgs": "value"
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject> = try query.createResult(from: response)

        XCTAssertEqual(res.values.count, 1)
        XCTAssertEqual(res.stringArgs, "value")
    }

    func testArrayOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.strings
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "strings": ["value1", "value2"]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject> = try query.createResult(from: response)

        XCTAssertEqual(res.values.count, 1)
        XCTAssertEqual(res.strings?.count, 2)
        XCTAssertEqual(res.strings?[0], "value1")
        XCTAssertEqual(res.strings?[1], "value2")
    }

    func testArrayArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.stringsArgs(arguments: .testDefault)
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "stringsArgs": ["value1", "value2"]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject> = try query.createResult(from: response)

        XCTAssertEqual(res.values.count, 1)
        XCTAssertEqual(res.stringsArgs?.count, 2)
        XCTAssertEqual(res.stringsArgs?[0], "value1")
        XCTAssertEqual(res.stringsArgs?[1], "value2")
    }
}

extension String_ParseTests {
    func testSingleAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.string(alias: "alias")
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": "value"
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject> = try query.createResult(from: response)

        XCTAssertEqual(res.values.count, 1)
        let aliased = res.get(\.string, alias: "alias")
        XCTAssertEqual(aliased, "value")
    }

    func testSingleArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.stringArgs(alias: "alias", arguments: .testDefault)
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": "value"
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject> = try query.createResult(from: response)

        XCTAssertEqual(res.values.count, 1)
        let aliased = res.get(\.stringArgs, alias: "alias")
        XCTAssertEqual(aliased, "value")
    }

    func testArrayAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.strings(alias: "alias")
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": ["value1", "value2"]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject> = try query.createResult(from: response)

        XCTAssertEqual(res.values.count, 1)
        let aliased = res.get(\.strings, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[0], "value1")
        XCTAssertEqual(aliased?[1], "value2")
        XCTAssertNil(res.strings)
    }

    func testArrayArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.stringsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": ["value1", "value2"]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject> = try query.createResult(from: response)

        XCTAssertEqual(res.values.count, 1)
        let aliased = res.get(\.stringsArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[0], "value1")
        XCTAssertEqual(aliased?[1], "value2")
        XCTAssertNil(res.stringsArgs)
    }
}
