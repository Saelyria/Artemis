// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Bool and [Bool] render as expected

extension TestInterface2_Bool_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_bool 
        }
        let response = Data("""
        {
            "data": {
                "i2_bool": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_boolArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i2_boolArgs": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i2_bools 
        }
        let response = Data("""
        {
            "data": {
                "i2_bools": [true, false]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_bools}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_boolOptional 
        }
        let response = Data("""
        {
            "data": {
                "i2_boolOptional": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_boolOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Tests to ensure single selections of Bool and [Bool] with aliases render as expected

extension TestInterface2_Bool_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_bool(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i2_bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_boolArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i2_boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Bool and [Bool] on an Object

extension TestInterface2_Bool_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_bool 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_bool}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_bool, true)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_boolArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_boolArgs": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_boolArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_boolArgs, true)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_bools 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_bools": [true, false]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_bools}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_bools?.count, 2)
        XCTAssertEqual(res?.i2_bools?[safe: 0], true)
        XCTAssertEqual(res?.i2_bools?[safe: 1], false)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_boolOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_boolOptional": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_boolOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_boolOptional, true)
    }

}

// MARK: - Tests to ensure an alias of Bool and [Bool] on an Object can be used to pull values out of a result

extension TestInterface2_Bool_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_bool(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i2_bool}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i2_bool(alias: "alias")
        XCTAssertEqual(aliased, true)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_boolArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i2_boolArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i2_boolArgs(alias: "alias")
        XCTAssertEqual(aliased, true)
    }

    func testArrayAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_bools(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i2_bools}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i2_bools(alias: "alias")
        XCTAssertEqual(aliased?[safe: 0], true)
        XCTAssertEqual(aliased?[safe: 1], false)
    }

}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] can be used at the top level of an operation

extension TestInterface2_Bool_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_bool 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_bool": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_boolArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_boolArgs": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_bools 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_bools": [true, false]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_bools}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_boolOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_boolOptional": true
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_boolOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] can be used at the top level of an operation with aliases

extension TestInterface2_Bool_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_bool(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i2_bool}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_boolArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i2_boolArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }
}


// MARK: - Tests to ensure fragments on TestInterface2 can be used on selections of Bool or [Bool]

extension TestInterface2_Bool_TypeTests {
    func testSingleOnTestInterface2Fragment() {
        let fragment = Fragment("fragName", on: TestInterface2.self) {
            $0.i2_bool 
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
                    "i2_bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface2{i2_bool}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_bool, true)
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface2.self) {
            $0.i2_bool 
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
                    { "i2_bool": true },
                    { "i2_bool": false }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface2{i2_bool}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i2_bool, true)
        XCTAssertEqual(res?[safe: 1]?.i2_bool, false)
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface2.self) {
            $0.i2_bool 
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
                    "i2_bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface2{i2_bool}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_bool, true)
    }
}
