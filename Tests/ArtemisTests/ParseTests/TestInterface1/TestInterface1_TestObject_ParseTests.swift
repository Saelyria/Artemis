// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure TestObject and [TestObject] can be used to pull values out of a result

extension TestInterface1_TestObject_ParseTests {
    func testSingleParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i1_testObject { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "i1_testObject": { "int": 321 }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgsParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i1_testObjectArgs(arguments: .testDefault) { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "i1_testObjectArgs": { "int": 321 }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testArrayParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i1_testObjects { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "i1_testObjects": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }

    func testArrayArgsParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i1_testObjectsArgs(arguments: .testDefault) { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "i1_testObjectsArgs": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }
}

// MARK: - Tests to ensure an alias of TestObject and [TestObject] can be used to pull values out of a result

extension TestInterface1_TestObject_ParseTests {
    func testSingleAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i1_testObject(alias: "alias") { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "alias": { "int": 321 }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgsAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i1_testObjectArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "alias": { "int": 321 }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testArrayAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i1_testObjects(alias: "alias") { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "alias": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }

    func testArrayArgsAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i1_testObjectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        let response = Data("""
        {
            "data": {
                "alias": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }
}

// MARK: - Tests to ensure TestObject and [TestObject] on an Object can be used to pull values out of a result

extension TestInterface1_TestObject_ParseTests {
    func testSingleOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testObject { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testObject": { "int": 321 }
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_testObject?.int, 321)
    }

    func testSingleArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testObjectArgs(arguments: .testDefault) { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testObjectArgs": { "int": 321 }
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_testObjectArgs?.int, 321)
    }

    func testArrayOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testObjects { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testObjects": [{ "int": 321 }, { "int": 123 }]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_testObjects?.count, 2)
        XCTAssertEqual(res?.i1_testObjects?[safe: 0]?.int, 321)
        XCTAssertEqual(res?.i1_testObjects?[safe: 1]?.int, 123)
    }

    func testArrayArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testObjectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testObjectsArgs": [{ "int": 321 }, { "int": 123 }]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_testObjectsArgs?.count, 2)
        XCTAssertEqual(res?.i1_testObjectsArgs?[safe: 0]?.int, 321)
        XCTAssertEqual(res?.i1_testObjectsArgs?[safe: 1]?.int, 123)
    }
}

// MARK: - Tests to ensure an alias of TestObject and [TestObject] on an Object can be used to pull values out of a result

extension TestInterface1_TestObject_ParseTests {
    func testSingleAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testObject(alias: "alias") { $0.int }
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i1_testObject, alias: "alias")
        XCTAssertEqual(aliased?.int, 321)
    }

    func testSingleArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testObjectArgs(alias: "alias", arguments: .testDefault) { $0.int }
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i1_testObjectArgs, alias: "alias")
        XCTAssertEqual(aliased?.int, 321)
    }

    func testArrayAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testObjects(alias: "alias") { $0.int }
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)

        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i1_testObjects, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0]?.int, 321)
        XCTAssertEqual(aliased?[safe: 1]?.int, 123)
        XCTAssertNil(res?.i1_testObjects)
    }

    func testArrayArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testObjectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)

        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i1_testObjectsArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0]?.int, 321)
        XCTAssertEqual(aliased?[safe: 1]?.int, 123)
        XCTAssertNil(res?.i1_testObjectsArgs)
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestObject and [TestObject] can be used to pull values out of a result

extension TestInterface1_TestObject_ParseTests {
    func testSingleOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testObject { $0.int }
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_testObject": { "int": 321 }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgsOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testObjectArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_testObjectArgs": { "int": 321 }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testArrayOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testObjects { $0.int }
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_testObjects": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }

    func testArrayArgsOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testObjectsArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_testObjectsArgs": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestObject and [TestObject] with aliases can be used to pull values out of a result

extension TestInterface1_TestObject_ParseTests {
    func testSingleAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testObject(alias: "alias") { $0.int }
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": { "int": 321 }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testSingleArgsAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testObjectArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": { "int": 321 }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 321)
    }

    func testArrayAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testObjects(alias: "alias") { $0.int }
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }

    func testArrayArgsAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testObjectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": [{ "int": 321 }, { "int": 123 }]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 321)
        XCTAssertEqual(res?[safe: 1]?.int, 123)
    }
}


// MARK: - Tests to ensure fragments on TestObject selecting TestObject and [TestObject] can be used to pull values out of a result

extension TestInterface1_TestObject_ParseTests {
    func testSingleOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_testObject { $0.int }
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testObject": { "int": 321 }
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i1_testObject?.int, 321)
    }

    func testSingleArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_testObjectArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testObjectArgs": { "int": 321 }
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i1_testObjectArgs?.int, 321)
    }

    func testArrayOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_testObjects { $0.int }
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testObjects": [{ "int": 321 }, { "int": 123 }]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i1_testObjects?.count, 2)
        XCTAssertEqual(res?.i1_testObjects?[safe: 0]?.int, 321)
        XCTAssertEqual(res?.i1_testObjects?[safe: 1]?.int, 123)
    }

    func testArrayArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_testObjectsArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testObjectsArgs": [{ "int": 321 }, { "int": 123 }]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i1_testObjectsArgs?.count, 2)
        XCTAssertEqual(res?.i1_testObjectsArgs?[safe: 0]?.int, 321)
        XCTAssertEqual(res?.i1_testObjectsArgs?[safe: 1]?.int, 123)
    }
}

// MARK: - Tests to ensure fragments on TestObject selecting TestObject and [TestObject] with aliases can be used to pull values out of a result

extension TestInterface1_TestObject_ParseTests {
    func testSingleAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_testObject(alias: "alias") { $0.int }
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
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

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i1_testObject, alias: "alias")
        XCTAssertEqual(aliased?.int, 321)
        XCTAssertNil(res?.i1_testObject)
    }

    func testSingleArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_testObjectArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
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

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i1_testObjectArgs, alias: "alias")
        XCTAssertEqual(aliased?.int, 321)
        XCTAssertNil(res?.i1_testObjectArgs)
    }

    func testArrayAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_testObjects(alias: "alias") { $0.int }
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
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

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i1_testObjects, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0]?.int, 321)
        XCTAssertEqual(aliased?[safe: 1]?.int, 123)
        XCTAssertNil(res?.i1_testObjects)
    }

    func testArrayArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_testObjectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, TestObject.Result> = .query {
            $0.testObject {
                fragment
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

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i1_testObjectsArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0]?.int, 321)
        XCTAssertEqual(aliased?[safe: 1]?.int, 123)
        XCTAssertNil(res?.i1_testObjectsArgs)
    }
}
