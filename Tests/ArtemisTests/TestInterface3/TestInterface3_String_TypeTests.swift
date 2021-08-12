// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of String and [String] render as expected

extension TestInterface3_String_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_string 
        }
        let response = Data("""
        {
            "data": {
                "i3_string": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_stringArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i3_stringArgs": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i3_strings 
        }
        let response = Data("""
        {
            "data": {
                "i3_strings": ["value", "value2"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_strings}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_stringOptional 
        }
        let response = Data("""
        {
            "data": {
                "i3_stringOptional": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_stringOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}

// MARK: - Tests to ensure single selections of String and [String] with aliases render as expected

extension TestInterface3_String_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_string(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i3_string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_stringArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i3_stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of String and [String] on an Object

extension TestInterface3_String_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_string 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_string": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_string}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_string, "value")
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_stringArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_stringArgs": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_stringArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_stringArgs, "value")
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_strings 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_strings": ["value", "value2"]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_strings}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_strings?.count, 2)
        XCTAssertEqual(res?.i3_strings?[safe: 0], "value")
        XCTAssertEqual(res?.i3_strings?[safe: 1], "value2")
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_stringOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_stringOptional": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_stringOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_stringOptional, "value")
    }
}

// MARK: - Tests to ensure an alias of String and [String] on an Object can be used to pull values out of a result

extension TestInterface3_String_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_string(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i3_string}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i3_string(alias: "alias")
        XCTAssertEqual(aliased, "value")
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_stringArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i3_stringArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i3_stringArgs(alias: "alias")
        XCTAssertEqual(aliased, "value")
    }
}

// MARK: - Tests to ensure fragments on Query selecting String and [String] can be used at the top level of an operation

extension TestInterface3_String_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_string 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_string": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_stringArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_stringArgs": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_strings 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_strings": ["value", "value2"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_strings}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_stringOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_stringOptional": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_stringOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}

// MARK: - Tests to ensure fragments on Query selecting String and [String] can be used at the top level of an operation with aliases

extension TestInterface3_String_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_string(alias: "alias") 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i3_string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_stringArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i3_stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}


// MARK: - Tests to ensure fragments on TestInterface3 can be used on selections of String or [String]

extension TestInterface3_String_TypeTests {
    func testSingleOnTestInterface3Fragment() {
        let fragment = Fragment("fragName", on: TestInterface3.self) {
            $0.i3_string 
        }
        let query: _Operation<TestSchema, TestObject.Result> = .query {
            $0.testObject {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_string": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface3{i3_string}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_string, "value")
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface3.self) {
            $0.i3_string 
        }
        let query: _Operation<TestSchema, [TestObject.Result]> = .query {
            $0.testObjects {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObjects": [
                    { "i3_string": "value" },
                    { "i3_string": "value2" }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface3{i3_string}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i3_string, "value")
        XCTAssertEqual(res?[safe: 1]?.i3_string, "value2")
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface3.self) {
            $0.i3_string 
        }
        let query: _Operation<TestSchema, TestObject.Result> = .query {
            $0.testObjectOptional {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObjectOptional": {
                    "i3_string": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface3{i3_string}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_string, "value")
    }
}
