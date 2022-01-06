// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of TestObject and [TestObject] render as expected

extension TestInterface5_TestObject_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_testObject { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "i5_testObject": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_testObject{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_testObjectArgs(arguments: .testDefault) { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "i5_testObjectArgs": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_testObjectArgs\(testArgs){int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i5_testObjects { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "i5_testObjects": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_testObjects{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_testObjectOptional { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "i5_testObjectOptional": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_testObjectOptional{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }
}

// MARK: - Tests to ensure single selections of TestObject and [TestObject] with aliases render as expected

extension TestInterface5_TestObject_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_testObject(alias: "alias") { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "alias": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i5_testObject{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_testObjectArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "alias": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i5_testObjectArgs\(testArgs){int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of TestObject and [TestObject] on an Object

extension TestInterface5_TestObject_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_testObject { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_testObject": { "int": 321 }
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_testObject{int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_testObject?.int, 321)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_testObjectArgs(arguments: .testDefault) { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_testObjectArgs": { "int": 321 }
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_testObjectArgs\(testArgs){int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_testObjectArgs?.int, 321)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_testObjects { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_testObjects": [{ "int": 321 }, { "int": 123 }]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_testObjects{int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_testObjects?.count, 2)
        XCTAssertEqual(res?.i5_testObjects?[safe: 0]?.int, 321)
        XCTAssertEqual(res?.i5_testObjects?[safe: 1]?.int, 123)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_testObjectOptional { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_testObjectOptional": { "int": 321 }
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_testObjectOptional{int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_testObjectOptional?.int, 321)
    }

    func testArrayArgsOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_testObjectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_testObjectsArgs": [{ "int": 321 }, { "int": 123 }]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_testObjectsArgs\(testArgs){int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_testObjectsArgs?[safe: 0]?.int, 321)
        XCTAssertEqual(res?.i5_testObjectsArgs?[safe: 1]?.int, 123)
    }
}

// MARK: - Tests to ensure an alias of TestObject and [TestObject] on an Object can be used to pull values out of a result

extension TestInterface5_TestObject_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_testObject(alias: "alias") { $0.int }
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

        XCTAssertEqual(query.render(), "{testObject{alias:i5_testObject{int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i5_testObject(alias: "alias")
        XCTAssertEqual(aliased?.int, 321)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_testObjectArgs(alias: "alias", arguments: .testDefault) { $0.int }
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

        XCTAssertEqual(query.render(), "{testObject{alias:i5_testObjectArgs\(testArgs){int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i5_testObjectArgs(alias: "alias")
        XCTAssertEqual(aliased?.int, 321)
    }

    func testArrayAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_testObjects(alias: "alias") { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": [{ "int": 321 }, { "int": 123 }]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:i5_testObjects{int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i5_testObjects(alias: "alias")
        XCTAssertEqual(aliased?[safe: 0]?.int, 321)
        XCTAssertEqual(aliased?[safe: 1]?.int, 123)
    }

    func testArrayArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_testObjectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": [{ "int": 321 }, { "int": 123 }]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:i5_testObjectsArgs\(testArgs){int}}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i5_testObjectsArgs(alias: "alias")
        XCTAssertEqual(aliased?[safe: 0]?.int, 321)
        XCTAssertEqual(aliased?[safe: 1]?.int, 123)
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestObject and [TestObject] can be used at the top level of an operation

extension TestInterface5_TestObject_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_testObject { $0.int }
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_testObject": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_testObject{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_testObjectArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_testObjectArgs": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_testObjectArgs\(testArgs){int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_testObjects { $0.int }
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_testObjects": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_testObjects{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_testObjectOptional { $0.int }
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_testObjectOptional": { "int": 321 }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_testObjectOptional{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestObject and [TestObject] can be used at the top level of an operation with aliases

extension TestInterface5_TestObject_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_testObject(alias: "alias") { $0.int }
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i5_testObject{int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_testObjectArgs(alias: "alias", arguments: .testDefault) { $0.int }
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i5_testObjectArgs\(testArgs){int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }
}
