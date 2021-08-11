// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of TestObject and [TestObject] render as expected

extension TestObject_TestObject_TypeTests {
    func testSingleRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.testObject { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "testObject": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgsRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.testObjectArgs(arguments: .testDefault) { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "testObjectArgs": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectArgs\(testArgs){int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testArrayRender() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.testObjects { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "testObjects": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }

    func testOptionalRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.testObjectOptional { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "testObjectOptional": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }
}

// MARK: - Tests to ensure single selections of TestObject and [TestObject] with aliases render as expected

extension TestObject_TestObject_TypeTests {
    func testSingleAliasRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.testObject(alias: "alias") { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "alias": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:testObject{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.testObjectArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "alias": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:testObjectArgs\(testArgs){int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of TestObject and [TestObject] on an Object

extension TestObject_TestObject_TypeTests {
    func testSingleOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testObject { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "testObject": { "int": 321 }
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{testObject{int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.testObject?.int, 321)
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testObjectArgs(arguments: .testDefault) { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "testObjectArgs": { "int": 321 }
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{testObjectArgs\(testArgs){int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.testObjectArgs?.int, 321)
    }

    func testArrayOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testObjects { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "testObjects": [{ "int": 321 }, { "int": 123 }]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{testObjects{int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.testObjects?.count, 2)
        XCTAssertEqual(res?.testObjects?[safe: 0]?.int, 321)
        XCTAssertEqual(res?.testObjects?[safe: 1]?.int, 123)
    }

    func testOptionalOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testObjectOptional { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "testObjectOptional": { "int": 321 }
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{testObjectOptional{int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.testObjectOptional?.int, 321)
    }
}

// MARK: - Tests to ensure an alias of TestObject and [TestObject] on an Object can be used to pull values out of a result

extension TestObject_TestObject_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testObject(alias: "alias") { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": { "int": 321 }
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:testObject{int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.testObject, alias: "alias")
        XCTAssertEqual(aliased?.int, 321)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testObjectArgs(alias: "alias", arguments: .testDefault) { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": { "int": 321 }
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:testObjectArgs\(testArgs){int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.testObjectArgs, alias: "alias")
        XCTAssertEqual(aliased?.int, 321)
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestObject and [TestObject] can be used at the top level of an operation

extension TestObject_TestObject_TypeTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testObject { $0.int }
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "testObject": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testObject{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testObjectArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "testObjectArgs": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testObjectArgs\(testArgs){int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testObjects { $0.int }
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "testObjects": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testObjects{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }

    func testOptionalOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testObjectOptional { $0.int }
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "testObjectOptional": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testObjectOptional{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestObject and [TestObject] can be used at the top level of an operation with aliases

extension TestObject_TestObject_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testObject(alias: "alias") { $0.int }
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:testObject{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testObjectArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:testObjectArgs\(testArgs){int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }
}
