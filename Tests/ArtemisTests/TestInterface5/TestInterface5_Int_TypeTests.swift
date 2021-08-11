// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Int and [Int] render as expected

extension TestInterface5_Int_TypeTests {
    func testSingleRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_int 
        }
        let response = Data("""
        {
            "data": {
                "i5_int": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_intArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i5_intArgs": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArrayRender() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i5_ints 
        }
        let response = Data("""
        {
            "data": {
                "i5_ints": [123, 321]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_ints}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testOptionalRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_intOptional 
        }
        let response = Data("""
        {
            "data": {
                "i5_intOptional": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_intOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure single selections of Int and [Int] with aliases render as expected

extension TestInterface5_Int_TypeTests {
    func testSingleAliasRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_int(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i5_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_intArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i5_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Int and [Int] on an Object

extension TestInterface5_Int_TypeTests {
    func testSingleOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_int 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_int}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_int, 123)
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_intArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_intArgs": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_intArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_intArgs, 123)
    }

    func testArrayOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_ints 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_ints": [123, 321]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_ints}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_ints?.count, 2)
        XCTAssertEqual(res?.i5_ints?[safe: 0], 123)
        XCTAssertEqual(res?.i5_ints?[safe: 1], 321)
    }

    func testOptionalOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_intOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_intOptional": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_intOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_intOptional, 123)
    }
}

// MARK: - Tests to ensure an alias of Int and [Int] on an Object can be used to pull values out of a result

extension TestInterface5_Int_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_int(alias: "alias") 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:i5_int}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i5_int, alias: "alias")
        XCTAssertEqual(aliased, 123)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_intArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:i5_intArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i5_intArgs, alias: "alias")
        XCTAssertEqual(aliased, 123)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] can be used at the top level of an operation

extension TestInterface5_Int_TypeTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_int 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_int": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_intArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_intArgs": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_ints 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_ints": [123, 321]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_ints}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testOptionalOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_intOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_intOptional": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_intOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] can be used at the top level of an operation with aliases

extension TestInterface5_Int_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_int(alias: "alias") 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i5_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_intArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i5_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure fragments on TestInterface5 can be used on selections of Int or [Int]

extension TestInterface5_Int_TypeTests {
    func testSingleOnTestInterface5Fragment() {
        let fragment = Fragment("fragName", on: TestInterface5.self) {
            $0.i5_int 
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
                    "i5_int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface5{i5_int}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_int, 123)
    }

    func testArrayOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestInterface5.self) {
            $0.i5_int 
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
                    { "i5_int": 123 },
                    { "i5_int": 321 }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface5{i5_int}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i5_int, 123)
        XCTAssertEqual(res?[safe: 1]?.i5_int, 321)
    }

    func testOptionalOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestInterface5.self) {
            $0.i5_int 
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
                    "i5_int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface5{i5_int}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_int, 123)
    }
}
