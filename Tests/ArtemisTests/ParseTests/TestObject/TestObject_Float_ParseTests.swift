// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure Float and [Float] can be used to pull values out of a result

extension TestObject_Float_ParseTests {
    func testSingleParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.float 
        }
        let response = Data("""
        {
            "data": {
                "float": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.floatArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "floatArgs": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.floats 
        }
        let response = Data("""
        {
            "data": {
                "floats": [1.23, 3.21]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testArrayArgsParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.floatsArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "floatsArgs": [1.23, 3.21]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }
}

// MARK: - Tests to ensure an alias of Float and [Float] can be used to pull values out of a result

extension TestObject_Float_ParseTests {
    func testSingleAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.float(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.floatArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.floats(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": [1.23, 3.21]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testArrayArgsAliasParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.floatsArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": [1.23, 3.21]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }
}

// MARK: - Tests to ensure Float and [Float] on an Object can be used to pull values out of a result

extension TestObject_Float_ParseTests {
    func testSingleOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.float 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "float": 1.23
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.float, 1.23)
    }

    func testSingleArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floatArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "floatArgs": 1.23
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.floatArgs, 1.23)
    }

    func testArrayOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floats 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "floats": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.floats?.count, 2)
        XCTAssertEqual(res?.floats?[safe: 0], 1.23)
        XCTAssertEqual(res?.floats?[safe: 1], 3.21)
    }

    func testArrayArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floatsArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "floatsArgs": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.floatsArgs?.count, 2)
        XCTAssertEqual(res?.floatsArgs?[safe: 0], 1.23)
        XCTAssertEqual(res?.floatsArgs?[safe: 1], 3.21)
    }
}

// MARK: - Tests to ensure an alias of Float and [Float] on an Object can be used to pull values out of a result

extension TestObject_Float_ParseTests {
    func testSingleAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.float(alias: "alias") 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": 1.23
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.float, alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testSingleArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floatArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": 1.23
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.floatArgs, alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testArrayAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floats(alias: "alias") 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)

        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.floats, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 1.23)
        XCTAssertEqual(aliased?[safe: 1], 3.21)
        XCTAssertNil(res?.floats)
    }

    func testArrayArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floatsArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)

        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.floatsArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 1.23)
        XCTAssertEqual(aliased?[safe: 1], 3.21)
        XCTAssertNil(res?.floatsArgs)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Float and [Float] can be used to pull values out of a result

extension TestObject_Float_ParseTests {
    func testSingleOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.float 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "float": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floatArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "floatArgs": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floats 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "floats": [1.23, 3.21]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testArrayArgsOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floatsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "floatsArgs": [1.23, 3.21]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Float and [Float] with aliases can be used to pull values out of a result

extension TestObject_Float_ParseTests {
    func testSingleAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.float(alias: "alias") 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floatArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floats(alias: "alias") 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": [1.23, 3.21]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testArrayArgsAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floatsArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": [1.23, 3.21]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }
}


// MARK: - Tests to ensure fragments on TestObject selecting Float and [Float] can be used to pull values out of a result

extension TestObject_Float_ParseTests {
    func testSingleOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.float 
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
                    "float": 1.23
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.float, 1.23)
    }

    func testSingleArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.floatArgs(arguments: .testDefault) 
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
                    "floatArgs": 1.23
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.floatArgs, 1.23)
    }

    func testArrayOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.floats 
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
                    "floats": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.floats?.count, 2)
        XCTAssertEqual(res?.floats?[safe: 0], 1.23)
        XCTAssertEqual(res?.floats?[safe: 1], 3.21)
    }

    func testArrayArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.floatsArgs(arguments: .testDefault) 
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
                    "floatsArgs": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.floatsArgs?.count, 2)
        XCTAssertEqual(res?.floatsArgs?[safe: 0], 1.23)
        XCTAssertEqual(res?.floatsArgs?[safe: 1], 3.21)
    }
}

// MARK: - Tests to ensure fragments on TestObject selecting Float and [Float] with aliases can be used to pull values out of a result

extension TestObject_Float_ParseTests {
    func testSingleAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.float(alias: "alias") 
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
                    "alias": 1.23
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.float, alias: "alias")
        XCTAssertEqual(aliased, 1.23)
        XCTAssertNil(res?.float)
    }

    func testSingleArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.floatArgs(alias: "alias", arguments: .testDefault) 
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
                    "alias": 1.23
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.floatArgs, alias: "alias")
        XCTAssertEqual(aliased, 1.23)
        XCTAssertNil(res?.floatArgs)
    }

    func testArrayAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.floats(alias: "alias") 
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
                    "alias": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.floats, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 1.23)
        XCTAssertEqual(aliased?[safe: 1], 3.21)
        XCTAssertNil(res?.floats)
    }

    func testArrayArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.floatsArgs(alias: "alias", arguments: .testDefault) 
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
                    "alias": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        let aliased = res?.get(\.floatsArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 1.23)
        XCTAssertEqual(aliased?[safe: 1], 3.21)
        XCTAssertNil(res?.floatsArgs)
    }
}
