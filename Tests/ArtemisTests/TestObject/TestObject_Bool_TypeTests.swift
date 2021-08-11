// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Bool and [Bool] render as expected

extension TestObject_Bool_TypeTests {
    func testSingleRender() {
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

    func testSingleArgsRender() {
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

    func testArrayRender() {
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

    func testOptionalRender() {
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
    func testSingleAliasRender() {
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

    func testSingleArgsAliasRender() {
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
    func testSingleOnObjectRender() {
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

    func testSingleArgsOnObjectRender() {
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

    func testArrayOnObjectRender() {
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

    func testOptionalOnObjectRender() {
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
        let aliased = res?.get(\.bool, alias: "alias")
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
        let aliased = res?.get(\.boolArgs, alias: "alias")
        XCTAssertEqual(aliased, true)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] can be used at the top level of an operation

extension TestObject_Bool_TypeTests {
    func testSingleOnFragmentRender() {
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

    func testSingleArgsOnFragmentRender() {
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

    func testArrayOnFragmentRender() {
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

    func testOptionalOnFragmentRender() {
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

    func testArrayOnObjectFragmentRender() {
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

    func testOptionalOnObjectFragmentRender() {
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
