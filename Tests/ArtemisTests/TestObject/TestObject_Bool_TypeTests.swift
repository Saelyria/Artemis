// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Bool and [Bool] render as expected

extension TestObject_Bool_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.bool 
        }
        let response = Data("""
        {
            "data": {
                "bool": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.boolArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "boolArgs": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.bools 
        }
        let response = Data("""
        {
            "data": {
                "bools": [true, false]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{bools}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.boolOptional 
        }
        let response = Data("""
        {
            "data": {
                "boolOptional": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{boolOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Tests to ensure single selections of Bool and [Bool] with aliases render as expected

extension TestObject_Bool_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.bool(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.boolArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Bool and [Bool] on an Object

extension TestObject_Bool_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.bool 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{bool}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.bool, true)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.boolArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "boolArgs": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{boolArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.boolArgs, true)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.bools 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "bools": [true, false]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{bools}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.bools?.count, 2)
        XCTAssertEqual(res?.bools?[safe: 0], true)
        XCTAssertEqual(res?.bools?[safe: 1], false)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.boolOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "boolOptional": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{boolOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.boolOptional, true)
    }

}

// MARK: - Tests to ensure an alias of Bool and [Bool] on an Object can be used to pull values out of a result

extension TestObject_Bool_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.bool(alias: "alias") 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:bool}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.bool(alias: "alias")
        XCTAssertEqual(aliased, true)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.boolArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:boolArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.boolArgs(alias: "alias")
        XCTAssertEqual(aliased, true)
    }

    func testArrayAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.bools(alias: "alias") 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": [true, false]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:bools}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.bools(alias: "alias")
        XCTAssertEqual(aliased?[safe: 0], true)
        XCTAssertEqual(aliased?[safe: 1], false)
    }

}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] can be used at the top level of an operation

extension TestObject_Bool_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.bool 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "bool": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.boolArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "boolArgs": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.bools 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "bools": [true, false]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{bools}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.boolOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "boolOptional": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{boolOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] can be used at the top level of an operation with aliases

extension TestObject_Bool_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.bool(alias: "alias") 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.boolArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Test selections of Bool on Mutation

extension TestObject_Bool_TypeTests {
    func testMutationSelection() {
        let mutation: _Operation<TestSchema, SelectionType.Result> = .mutation {
            $0.mut_bool 
        }
        let response = Data("""
        {
            "data": {
                "mut_bool": true
            }
        }
        """.utf8)

        XCTAssertEqual(mutation.render(), "mutation{mut_bool}")
        let res = try? mutation.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Tests to ensure fragments on TestObject can be used on selections of Bool or [Bool]

extension TestObject_Bool_TypeTests {
    func testSingleOnTestObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.bool 
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
                    "bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestObject{bool}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.bool, true)
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.bool 
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
                    { "bool": true },
                    { "bool": false }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestObject{bool}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.bool, true)
        XCTAssertEqual(res?[safe: 1]?.bool, false)
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.bool 
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
                    "bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestObject{bool}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.bool, true)
    }
}
