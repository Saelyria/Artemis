// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure Int and [Int] can be used to pull values out of a result

extension TestInterface3_Int_ParseTests {
    func testSingleParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_int 
        }
        let response = Data("""
        {
            "data": {
                "i3_int": 123
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_intArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i3_intArgs": 123
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArrayParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_ints 
        }
        let response = Data("""
        {
            "data": {
                "i3_ints": [123, 321]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testArrayArgsParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_intsArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i3_intsArgs": [123, 321]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }
}

// MARK: - Tests to ensure an alias of Int and [Int] can be used to pull values out of a result

extension TestInterface3_Int_ParseTests {
    func testSingleAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_int(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_intArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArrayAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_ints(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": [123, 321]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testArrayArgsAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_intsArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": [123, 321]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }
}

// MARK: - Tests to ensure Int and [Int] on an Object can be used to pull values out of a result

extension TestInterface3_Int_ParseTests {
    func testSingleOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_int 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_int": 123
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_int, 123)
    }

    func testSingleArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_intArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_intArgs": 123
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_intArgs, 123)
    }

    func testArrayOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_ints 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_ints": [123, 321]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_ints?.count, 2)
        XCTAssertEqual(res?.i3_ints?[safe: 0], 123)
        XCTAssertEqual(res?.i3_ints?[safe: 1], 321)
    }

    func testArrayArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_intsArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_intsArgs": [123, 321]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_intsArgs?.count, 2)
        XCTAssertEqual(res?.i3_intsArgs?[safe: 0], 123)
        XCTAssertEqual(res?.i3_intsArgs?[safe: 1], 321)
    }
}

// MARK: - Tests to ensure an alias of Int and [Int] on an Object can be used to pull values out of a result

extension TestInterface3_Int_ParseTests {
    func testSingleAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_int(alias: "alias") 
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i3_int, alias: "alias")
        XCTAssertEqual(aliased, 123)
    }

    func testSingleArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_intArgs(alias: "alias", arguments: .testDefault) 
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

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i3_intArgs, alias: "alias")
        XCTAssertEqual(aliased, 123)
    }

    func testArrayAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_ints(alias: "alias") 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": [123, 321]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)

        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i3_ints, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 123)
        XCTAssertEqual(aliased?[safe: 1], 321)
        XCTAssertNil(res?.i3_ints)
    }

    func testArrayArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_intsArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": [123, 321]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)

        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i3_intsArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 123)
        XCTAssertEqual(aliased?[safe: 1], 321)
        XCTAssertNil(res?.i3_intsArgs)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] can be used to pull values out of a result

extension TestInterface3_Int_ParseTests {
    func testSingleOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_int 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_int": 123
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_intArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_intArgs": 123
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArrayOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_ints 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_ints": [123, 321]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testArrayArgsOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_intsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_intsArgs": [123, 321]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] with aliases can be used to pull values out of a result

extension TestInterface3_Int_ParseTests {
    func testSingleAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_int(alias: "alias") 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_intArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArrayAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_ints(alias: "alias") 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": [123, 321]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testArrayArgsAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_intsArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": [123, 321]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }
}


// MARK: - Tests to ensure fragments on TestObject selecting Int and [Int] can be used to pull values out of a result

extension TestInterface3_Int_ParseTests {
    func testSingleOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i3_int 
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
                    "i3_int": 123
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i3_int, 123)
    }

    func testSingleArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i3_intArgs(arguments: .testDefault) 
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
                    "i3_intArgs": 123
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i3_intArgs, 123)
    }

    func testArrayOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i3_ints 
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
                    "i3_ints": [123, 321]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i3_ints?.count, 2)
        XCTAssertEqual(res?.i3_ints?[safe: 0], 123)
        XCTAssertEqual(res?.i3_ints?[safe: 1], 321)
    }

    func testArrayArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i3_intsArgs(arguments: .testDefault) 
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
                    "i3_intsArgs": [123, 321]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i3_intsArgs?.count, 2)
        XCTAssertEqual(res?.i3_intsArgs?[safe: 0], 123)
        XCTAssertEqual(res?.i3_intsArgs?[safe: 1], 321)
    }
}

// MARK: - Tests to ensure fragments on TestObject selecting Int and [Int] with aliases can be used to pull values out of a result

extension TestInterface3_Int_ParseTests {
    func testSingleAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i3_int(alias: "alias") 
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
                    "alias": 123
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i3_int, alias: "alias")
        XCTAssertEqual(aliased, 123)
        XCTAssertNil(res?.i3_int)
    }

    func testSingleArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i3_intArgs(alias: "alias", arguments: .testDefault) 
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
                    "alias": 123
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i3_intArgs, alias: "alias")
        XCTAssertEqual(aliased, 123)
        XCTAssertNil(res?.i3_intArgs)
    }

    func testArrayAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i3_ints(alias: "alias") 
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
                    "alias": [123, 321]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i3_ints, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 123)
        XCTAssertEqual(aliased?[safe: 1], 321)
        XCTAssertNil(res?.i3_ints)
    }

    func testArrayArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i3_intsArgs(alias: "alias", arguments: .testDefault) 
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
                    "alias": [123, 321]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.i3_intsArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 123)
        XCTAssertEqual(aliased?[safe: 1], 321)
        XCTAssertNil(res?.i3_intsArgs)
    }
}
