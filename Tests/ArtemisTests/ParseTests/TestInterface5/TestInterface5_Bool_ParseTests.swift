// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure Bool and [Bool] can be used to pull values out of a result

extension TestInterface5_Bool_ParseTests {
    func testSingleParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i5_bool 
        }
        let response = Data("""
        {
            "data": {
                "i5_bool": true
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i5_boolArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i5_boolArgs": true
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testArrayParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i5_bools 
        }
        let response = Data("""
        {
            "data": {
                "i5_bools": [true, false]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }

    func testArrayArgsParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i5_boolsArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i5_boolsArgs": [true, false]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }
}

// MARK: - Tests to ensure an alias of Bool and [Bool] can be used to pull values out of a result

extension TestInterface5_Bool_ParseTests {
    func testSingleAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i5_bool(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i5_boolArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testArrayAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i5_bools(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": [true, false]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }

    func testArrayArgsAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i5_boolsArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": [true, false]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }
}

// MARK: - Tests to ensure Bool and [Bool] on an Object can be used to pull values out of a result

extension TestInterface5_Bool_ParseTests {
    func testSingleOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_bool 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_bool": true
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_bool, true)
    }

    func testSingleArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_boolArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_boolArgs": true
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_boolArgs, true)
    }

    func testArrayOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_bools 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_bools": [true, false]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_bools?.count, 2)
        XCTAssertEqual(res?.i5_bools?[safe: 0], true)
        XCTAssertEqual(res?.i5_bools?[safe: 1], false)
    }

    func testArrayArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_boolsArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_boolsArgs": [true, false]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_boolsArgs?.count, 2)
        XCTAssertEqual(res?.i5_boolsArgs?[safe: 0], true)
        XCTAssertEqual(res?.i5_boolsArgs?[safe: 1], false)
    }
}

// MARK: - Tests to ensure an alias of Bool and [Bool] on an Object can be used to pull values out of a result

extension TestInterface5_Bool_ParseTests {
    func testSingleAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_bool(alias: "alias") 
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i5_bool, alias: "alias")
        XCTAssertEqual(aliased, true)
    }

    func testSingleArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_boolArgs(alias: "alias", arguments: .testDefault) 
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i5_boolArgs, alias: "alias")
        XCTAssertEqual(aliased, true)
    }

    func testArrayAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_bools(alias: "alias") 
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)

        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i5_bools, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], true)
        XCTAssertEqual(aliased?[safe: 1], false)
        XCTAssertNil(res?.i5_bools)
    }

    func testArrayArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_boolsArgs(alias: "alias", arguments: .testDefault) 
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)

        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i5_boolsArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], true)
        XCTAssertEqual(aliased?[safe: 1], false)
        XCTAssertNil(res?.i5_boolsArgs)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] can be used to pull values out of a result

extension TestInterface5_Bool_ParseTests {
    func testSingleOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_bool 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_bool": true
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_boolArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_boolArgs": true
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testArrayOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_bools 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_bools": [true, false]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }

    func testArrayArgsOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_boolsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_boolsArgs": [true, false]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] with aliases can be used to pull values out of a result

extension TestInterface5_Bool_ParseTests {
    func testSingleAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_bool(alias: "alias") 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testSingleArgsAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_boolArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": true
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, true)
    }

    func testArrayAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_bools(alias: "alias") 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": [true, false]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }

    func testArrayArgsAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_boolsArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": [true, false]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], true)
        XCTAssertEqual(res?[safe: 1], false)
    }
}


// MARK: - Tests to ensure fragments on TestObject selecting Bool and [Bool] can be used to pull values out of a result

extension TestInterface5_Bool_ParseTests {
    func testSingleOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i5_bool 
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
                    "i5_bool": true
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i5_bool, true)
    }

    func testSingleArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i5_boolArgs(arguments: .testDefault) 
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
                    "i5_boolArgs": true
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i5_boolArgs, true)
    }

    func testArrayOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i5_bools 
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
                    "i5_bools": [true, false]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i5_bools?.count, 2)
        XCTAssertEqual(res?.i5_bools?[safe: 0], true)
        XCTAssertEqual(res?.i5_bools?[safe: 1], false)
    }

    func testArrayArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i5_boolsArgs(arguments: .testDefault) 
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
                    "i5_boolsArgs": [true, false]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i5_boolsArgs?.count, 2)
        XCTAssertEqual(res?.i5_boolsArgs?[safe: 0], true)
        XCTAssertEqual(res?.i5_boolsArgs?[safe: 1], false)
    }
}

// MARK: - Tests to ensure fragments on TestObject selecting Bool and [Bool] with aliases can be used to pull values out of a result

extension TestInterface5_Bool_ParseTests {
    func testSingleAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i5_bool(alias: "alias") 
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
                    "alias": true
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i5_bool, alias: "alias")
        XCTAssertEqual(aliased, true)
        XCTAssertNil(res?.i5_bool)
    }

    func testSingleArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i5_boolArgs(alias: "alias", arguments: .testDefault) 
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
                    "alias": true
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i5_boolArgs, alias: "alias")
        XCTAssertEqual(aliased, true)
        XCTAssertNil(res?.i5_boolArgs)
    }

    func testArrayAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i5_bools(alias: "alias") 
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
                    "alias": [true, false]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i5_bools, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], true)
        XCTAssertEqual(aliased?[safe: 1], false)
        XCTAssertNil(res?.i5_bools)
    }

    func testArrayArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i5_boolsArgs(alias: "alias", arguments: .testDefault) 
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
                    "alias": [true, false]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i5_boolsArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], true)
        XCTAssertEqual(aliased?[safe: 1], false)
        XCTAssertNil(res?.i5_boolsArgs)
    }
}
