// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of String and [String] render as expected

extension TestObject_String_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.string 
        }
        let response = Data("""
        {
            "data": {
                "string": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.stringArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "stringArgs": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.strings 
        }
        let response = Data("""
        {
            "data": {
                "strings": ["value", "value2"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{strings}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.stringOptional 
        }
        let response = Data("""
        {
            "data": {
                "stringOptional": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{stringOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}

// MARK: - Tests to ensure single selections of String and [String] with aliases render as expected

extension TestObject_String_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.string(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.stringArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of String and [String] on an Object

extension TestObject_String_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
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

        XCTAssertEqual(query.render(), "{testObject{string}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.string, "value")
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
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

        XCTAssertEqual(query.render(), "{testObject{stringArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.stringArgs, "value")
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.strings 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "strings": ["value", "value2"]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{strings}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.strings?.count, 2)
        XCTAssertEqual(res?.strings?[safe: 0], "value")
        XCTAssertEqual(res?.strings?[safe: 1], "value2")
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.stringOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "stringOptional": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{stringOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.stringOptional, "value")
    }
}

// MARK: - Tests to ensure an alias of String and [String] on an Object can be used to pull values out of a result

extension TestObject_String_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
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

        XCTAssertEqual(query.render(), "{testObject{alias:string}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.string(alias: "alias")
        XCTAssertEqual(aliased, "value")
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
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

        XCTAssertEqual(query.render(), "{testObject{alias:stringArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.stringArgs(alias: "alias")
        XCTAssertEqual(aliased, "value")
    }
}

// MARK: - Tests to ensure fragments on Query selecting String and [String] can be used at the top level of an operation

extension TestObject_String_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.string 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "string": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.stringArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "stringArgs": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.strings 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "strings": ["value", "value2"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{strings}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], "value")
        XCTAssertEqual(res?[safe: 1], "value2")
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.stringOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "stringOptional": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{stringOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}

// MARK: - Tests to ensure fragments on Query selecting String and [String] can be used at the top level of an operation with aliases

extension TestObject_String_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.string(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:string}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.stringArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:stringArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}

// MARK: - Test selections of String on Mutation

extension TestObject_String_TypeTests {
    func testMutationSelection() {
        let mutation: _Operation<TestSchema, SelectionType.Result> = .mutation {
            $0.mut_string 
        }
        let response = Data("""
        {
            "data": {
                "mut_string": "value"
            }
        }
        """.utf8)

        XCTAssertEqual(mutation.render(), "mutation{mut_string}")
        let res = try? mutation.createResult(from: response)
        XCTAssertEqual(res, "value")
    }
}

// MARK: - Tests to ensure fragments on TestObject can be used on selections of String or [String]

extension TestObject_String_TypeTests {
    func testSingleOnTestObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.string 
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
                    "string": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestObject{string}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.string, "value")
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.string 
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
                    { "string": "value" },
                    { "string": "value2" }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestObject{string}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.string, "value")
        XCTAssertEqual(res?[safe: 1]?.string, "value2")
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.string 
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
                    "string": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestObject{string}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.string, "value")
    }
}
