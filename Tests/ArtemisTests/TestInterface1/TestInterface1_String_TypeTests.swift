// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of String and [String] render as expected

extension TestInterface1_String_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i1_string 
        }
        let response = Data("""
        {
            "data": {
                "i1_string": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i1_string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i1_stringArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i1_stringArgs": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i1_stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i1_strings 
        }
        let response = Data("""
        {
            "data": {
                "i1_strings": ["value", "value2"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i1_strings}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i1_stringOptional 
        }
        let response = Data("""
        {
            "data": {
                "i1_stringOptional": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i1_stringOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}

// MARK: - Tests to ensure single selections of String and [String] with aliases render as expected

extension TestInterface1_String_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i1_string(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i1_string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i1_stringArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i1_stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of String and [String] on an Object

extension TestInterface1_String_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_string 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_string": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i1_string}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_string, "value")
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_stringArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_stringArgs": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i1_stringArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_stringArgs, "value")
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_strings 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_strings": ["value", "value2"]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i1_strings}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_strings?.count, 2)
        XCTAssertEqual(res?.i1_strings?[safe: 0], "value")
        XCTAssertEqual(res?.i1_strings?[safe: 1], "value2")
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_stringOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_stringOptional": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i1_stringOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_stringOptional, "value")
    }
}

// MARK: - Tests to ensure an alias of String and [String] on an Object can be used to pull values out of a result

extension TestInterface1_String_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_string(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i1_string}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i1_string, alias: "alias")
        XCTAssertEqual(aliased, "value")
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_stringArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i1_stringArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i1_stringArgs, alias: "alias")
        XCTAssertEqual(aliased, "value")
    }
}

// MARK: - Tests to ensure fragments on Query selecting String and [String] can be used at the top level of an operation

extension TestInterface1_String_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_string 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_string": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_stringArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_stringArgs": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_strings 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_strings": ["value", "value2"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_strings}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_stringOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_stringOptional": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_stringOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}

// MARK: - Tests to ensure fragments on Query selecting String and [String] can be used at the top level of an operation with aliases

extension TestInterface1_String_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_string(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i1_string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_stringArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i1_stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}


// MARK: - Tests to ensure fragments on TestInterface1 can be used on selections of String or [String]

extension TestInterface1_String_TypeTests {
    func testSingleOnTestInterface1Fragment() {
        let fragment = Fragment("fragName", on: TestInterface1.self) {
            $0.i1_string 
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
                    "i1_string": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface1{i1_string}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_string, "value")
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface1.self) {
            $0.i1_string 
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
                    { "i1_string": "value" },
                    { "i1_string": "value2" }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface1{i1_string}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i1_string, "value")
        XCTAssertEqual(res?[safe: 1]?.i1_string, "value2")
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface1.self) {
            $0.i1_string 
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
                    "i1_string": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface1{i1_string}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_string, "value")
    }
}
