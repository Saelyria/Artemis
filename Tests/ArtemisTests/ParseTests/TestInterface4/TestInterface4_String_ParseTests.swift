// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure String and [String] can be used to pull values out of a result

extension TestInterface4_String_ParseTests {
    func testSingleParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i4_string 
        }
        let response = Data("""
        {
            "data": {
                "i4_string": "value"
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i4_stringArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i4_stringArgs": "value"
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testArrayParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i4_strings 
        }
        let response = Data("""
        {
            "data": {
                "i4_strings": ["value", "value2"]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }

    func testArrayArgsParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i4_stringsArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i4_stringsArgs": ["value", "value2"]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }
}

// MARK: - Tests to ensure an alias of String and [String] can be used to pull values out of a result

extension TestInterface4_String_ParseTests {
    func testSingleAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i4_string(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i4_stringArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testArrayAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i4_strings(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": ["value", "value2"]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }

    func testArrayArgsAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i4_stringsArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": ["value", "value2"]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }
}

// MARK: - Tests to ensure String and [String] on an Object can be used to pull values out of a result

extension TestInterface4_String_ParseTests {
    func testSingleOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_string 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_string": "value"
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_string, "value")
    }

    func testSingleArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_stringArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_stringArgs": "value"
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_stringArgs, "value")
    }

    func testArrayOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_strings 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_strings": ["value", "value2"]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_strings?.count, 2)
        XCTAssertEqual(res?.i4_strings?[safe: 0], "value")
        XCTAssertEqual(res?.i4_strings?[safe: 1], "value2")
    }

    func testArrayArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_stringsArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_stringsArgs": ["value", "value2"]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_stringsArgs?.count, 2)
        XCTAssertEqual(res?.i4_stringsArgs?[safe: 0], "value")
        XCTAssertEqual(res?.i4_stringsArgs?[safe: 1], "value2")
    }
}

// MARK: - Tests to ensure an alias of String and [String] on an Object can be used to pull values out of a result

extension TestInterface4_String_ParseTests {
    func testSingleAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_string(alias: "alias") 
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i4_string, alias: "alias")
        XCTAssertEqual(aliased, "value")
    }

    func testSingleArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_stringArgs(alias: "alias", arguments: .testDefault) 
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i4_stringArgs, alias: "alias")
        XCTAssertEqual(aliased, "value")
    }

    func testArrayAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_strings(alias: "alias") 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": ["value", "value2"]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)

        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i4_strings, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], "value")
        XCTAssertEqual(aliased?[safe: 1], "value2")
        XCTAssertNil(res?.i4_strings)
    }

    func testArrayArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_stringsArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": ["value", "value2"]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)

        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i4_stringsArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], "value")
        XCTAssertEqual(aliased?[safe: 1], "value2")
        XCTAssertNil(res?.i4_stringsArgs)
    }
}

// MARK: - Tests to ensure fragments on Query selecting String and [String] can be used to pull values out of a result

extension TestInterface4_String_ParseTests {
    func testSingleOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_string 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_string": "value"
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_stringArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_stringArgs": "value"
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testArrayOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_strings 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_strings": ["value", "value2"]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }

    func testArrayArgsOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_stringsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_stringsArgs": ["value", "value2"]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }
}

// MARK: - Tests to ensure fragments on Query selecting String and [String] with aliases can be used to pull values out of a result

extension TestInterface4_String_ParseTests {
    func testSingleAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_string(alias: "alias") 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_stringArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testArrayAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_strings(alias: "alias") 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": ["value", "value2"]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }

    func testArrayArgsAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_stringsArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": ["value", "value2"]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }
}


// MARK: - Tests to ensure fragments on TestObject selecting String and [String] can be used to pull values out of a result

extension TestInterface4_String_ParseTests {
    func testSingleOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i4_string 
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_string": "value"
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i4_string, "value")
    }

    func testSingleArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i4_stringArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_stringArgs": "value"
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i4_stringArgs, "value")
    }

    func testArrayOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i4_strings 
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_strings": ["value", "value2"]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i4_strings?.count, 2)
        XCTAssertEqual(res?.i4_strings?[safe: 0], "value")
        XCTAssertEqual(res?.i4_strings?[safe: 1], "value2")
    }

    func testArrayArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i4_stringsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_stringsArgs": ["value", "value2"]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i4_stringsArgs?.count, 2)
        XCTAssertEqual(res?.i4_stringsArgs?[safe: 0], "value")
        XCTAssertEqual(res?.i4_stringsArgs?[safe: 1], "value2")
    }
}

// MARK: - Tests to ensure fragments on TestObject selecting String and [String] with aliases can be used to pull values out of a result

extension TestInterface4_String_ParseTests {
    func testSingleAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i4_string(alias: "alias") 
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
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

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i4_string, alias: "alias")
        XCTAssertEqual(aliased, "value")
        XCTAssertNil(res?.i4_string)
    }

    func testSingleArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i4_stringArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
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

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i4_stringArgs, alias: "alias")
        XCTAssertEqual(aliased, "value")
        XCTAssertNil(res?.i4_stringArgs)
    }

    func testArrayAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i4_strings(alias: "alias") 
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": ["value", "value2"]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i4_strings, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], "value")
        XCTAssertEqual(aliased?[safe: 1], "value2")
        XCTAssertNil(res?.i4_strings)
    }

    func testArrayArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i4_stringsArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": ["value", "value2"]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i4_stringsArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], "value")
        XCTAssertEqual(aliased?[safe: 1], "value2")
        XCTAssertNil(res?.i4_stringsArgs)
    }
}
