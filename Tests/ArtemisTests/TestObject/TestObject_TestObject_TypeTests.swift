// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of TestObject and [TestObject] render as expected

extension TestObject_TestObject_TypeTests {
    func testSingle() {
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

    func testSingleArgs() {
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

    func testArray() {
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

    func testOptional() {
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
    func testSingleAlias() {
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

    func testSingleArgsAlias() {
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
    func testSingleOnObject() {
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

    func testSingleArgsOnObject() {
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

    func testArrayOnObject() {
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

    func testOptionalOnObject() {
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
        let aliased = res?.testObject(alias: "alias")
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
        let aliased = res?.testObjectArgs(alias: "alias")
        XCTAssertEqual(aliased?.int, 321)
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestObject and [TestObject] can be used at the top level of an operation

extension TestObject_TestObject_TypeTests {
    func testSingleOnFragment() {
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

    func testSingleArgsOnFragment() {
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

    func testArrayOnFragment() {
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

    func testOptionalOnFragment() {
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

// MARK: - Test selections of TestObject on Mutation

extension TestObject_TestObject_TypeTests {
    func testMutationSelection() {
        let mutation: _Operation<TestSchema, SelectionType.Result> = .mutation {
            $0.mut_testObject { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "mut_testObject": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(mutation.render(), "mutation{mut_testObject{int}}")
        let res = try? mutation.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }
}
