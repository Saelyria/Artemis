// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Bool and [Bool] render as expected

extension TestInterface3_Bool_TypeTests {
    func testSingleRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_bool 
        }
        let response = Data("""
        {
            "data": {
                "i3_bool": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_boolArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i3_boolArgs": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testArrayRender() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i3_bools 
        }
        let response = Data("""
        {
            "data": {
                "i3_bools": [true, false]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_bools}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }

    func testOptionalRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_boolOptional 
        }
        let response = Data("""
        {
            "data": {
                "i3_boolOptional": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_boolOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Tests to ensure single selections of Bool and [Bool] with aliases render as expected

extension TestInterface3_Bool_TypeTests {
    func testSingleAliasRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_bool(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i3_bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_boolArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i3_boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Bool and [Bool] on an Object

extension TestInterface3_Bool_TypeTests {
    func testSingleOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_bool 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_bool}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_bool, true)
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_boolArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_boolArgs": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_boolArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_boolArgs, true)
    }

    func testArrayOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_bools 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_bools": [true, false]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_bools}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_bools?.count, 2)
        XCTAssertEqual(res?.i3_bools?[safe: 0], true)
        XCTAssertEqual(res?.i3_bools?[safe: 1], false)
    }

    func testOptionalOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_boolOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_boolOptional": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_boolOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_boolOptional, true)
    }
}

// MARK: - Tests to ensure an alias of Bool and [Bool] on an Object can be used to pull values out of a result

extension TestInterface3_Bool_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_bool(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i3_bool}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i3_bool, alias: "alias")
        XCTAssertEqual(aliased, true)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_boolArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i3_boolArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i3_boolArgs, alias: "alias")
        XCTAssertEqual(aliased, true)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] can be used at the top level of an operation

extension TestInterface3_Bool_TypeTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_bool 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_bool": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_boolArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_boolArgs": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_bools 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_bools": [true, false]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_bools}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }

    func testOptionalOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_boolOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_boolOptional": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_boolOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] can be used at the top level of an operation with aliases

extension TestInterface3_Bool_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_bool(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i3_bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_boolArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i3_boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Tests to ensure fragments on TestInterface3 can be used on selections of Bool or [Bool]

extension TestInterface3_Bool_TypeTests {
    func testSingleOnTestInterface3Fragment() {
        let fragment = Fragment("fragName", on: TestInterface3.self) {
            $0.i3_bool 
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
                    "i3_bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface3{i3_bool}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_bool, true)
    }

    func testArrayOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestInterface3.self) {
            $0.i3_bool 
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
                    { "i3_bool": true },
                    { "i3_bool": false }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface3{i3_bool}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i3_bool, true)
        XCTAssertEqual(res?[safe: 1]?.i3_bool, false)
    }

    func testOptionalOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestInterface3.self) {
            $0.i3_bool 
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
                    "i3_bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface3{i3_bool}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_bool, true)
    }
}
