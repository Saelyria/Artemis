// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure Double and [Double] can be used to pull values out of a result

extension TestInterface1_Double_ParseTests {
    func testSingleParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i1_double 
        }
        let response = Data("""
        {
            "data": {
                "i1_double": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i1_doubleArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i1_doubleArgs": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayParse() throws {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i1_doubles 
        }
        let response = Data("""
        {
            "data": {
                "i1_doubles": [1.23, 3.21]
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
            $0.i1_doublesArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i1_doublesArgs": [1.23, 3.21]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }
}

// MARK: - Tests to ensure an alias of Double and [Double] can be used to pull values out of a result

extension TestInterface1_Double_ParseTests {
    func testSingleAliasParse() throws {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i1_double(alias: "alias") 
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
            $0.i1_doubleArgs(alias: "alias", arguments: .testDefault) 
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
            $0.i1_doubles(alias: "alias") 
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
            $0.i1_doublesArgs(alias: "alias", arguments: .testDefault) 
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

// MARK: - Tests to ensure Double and [Double] on an Object can be used to pull values out of a result

extension TestInterface1_Double_ParseTests {
    func testSingleOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_double 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_double": 1.23
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_double, 1.23)
    }

    func testSingleArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doubleArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_doubleArgs": 1.23
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_doubleArgs, 1.23)
    }

    func testArrayOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doubles 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_doubles": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_doubles?.count, 2)
        XCTAssertEqual(res?.i1_doubles?[safe: 0], 1.23)
        XCTAssertEqual(res?.i1_doubles?[safe: 1], 3.21)
    }

    func testArrayArgsOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doublesArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_doublesArgs": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_doublesArgs?.count, 2)
        XCTAssertEqual(res?.i1_doublesArgs?[safe: 0], 1.23)
        XCTAssertEqual(res?.i1_doublesArgs?[safe: 1], 3.21)
    }
}

// MARK: - Tests to ensure an alias of Double and [Double] on an Object can be used to pull values out of a result

extension TestInterface1_Double_ParseTests {
    func testSingleAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_double(alias: "alias") 
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
        let aliased = res?.get(\.i1_double, alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testSingleArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doubleArgs(alias: "alias", arguments: .testDefault) 
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
        let aliased = res?.get(\.i1_doubleArgs, alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testArrayAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doubles(alias: "alias") 
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
        let aliased = res?.get(\.i1_doubles, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 1.23)
        XCTAssertEqual(aliased?[safe: 1], 3.21)
        XCTAssertNil(res?.i1_doubles)
    }

    func testArrayArgsAliasOnObjectParse() throws {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doublesArgs(alias: "alias", arguments: .testDefault) 
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
        let aliased = res?.get(\.i1_doublesArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 1.23)
        XCTAssertEqual(aliased?[safe: 1], 3.21)
        XCTAssertNil(res?.i1_doublesArgs)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Double and [Double] can be used to pull values out of a result

extension TestInterface1_Double_ParseTests {
    func testSingleOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_double 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_double": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_doubleArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_doubleArgs": 1.23
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_doubles 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_doubles": [1.23, 3.21]
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
            $0.i1_doublesArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_doublesArgs": [1.23, 3.21]
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Double and [Double] with aliases can be used to pull values out of a result

extension TestInterface1_Double_ParseTests {
    func testSingleAliasOnFragmentParse() throws {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_double(alias: "alias") 
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
            $0.i1_doubleArgs(alias: "alias", arguments: .testDefault) 
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
            $0.i1_doubles(alias: "alias") 
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
            $0.i1_doublesArgs(alias: "alias", arguments: .testDefault) 
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


// MARK: - Tests to ensure fragments on TestObject selecting Double and [Double] can be used to pull values out of a result

extension TestInterface1_Double_ParseTests {
    func testSingleOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_double 
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
                    "i1_double": 1.23
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i1_double, 1.23)
    }

    func testSingleArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_doubleArgs(arguments: .testDefault) 
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
                    "i1_doubleArgs": 1.23
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i1_doubleArgs, 1.23)
    }

    func testArrayOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_doubles 
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
                    "i1_doubles": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i1_doubles?.count, 2)
        XCTAssertEqual(res?.i1_doubles?[safe: 0], 1.23)
        XCTAssertEqual(res?.i1_doubles?[safe: 1], 3.21)
    }

    func testArrayArgsOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_doublesArgs(arguments: .testDefault) 
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
                    "i1_doublesArgs": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.i1_doublesArgs?.count, 2)
        XCTAssertEqual(res?.i1_doublesArgs?[safe: 0], 1.23)
        XCTAssertEqual(res?.i1_doublesArgs?[safe: 1], 3.21)
    }
}

// MARK: - Tests to ensure fragments on TestObject selecting Double and [Double] with aliases can be used to pull values out of a result

extension TestInterface1_Double_ParseTests {
    func testSingleAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_double(alias: "alias") 
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
        let aliased = res?.get(\.i1_double, alias: "alias")
        XCTAssertEqual(aliased, 1.23)
        XCTAssertNil(res?.i1_double)
    }

    func testSingleArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_doubleArgs(alias: "alias", arguments: .testDefault) 
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
        let aliased = res?.get(\.i1_doubleArgs, alias: "alias")
        XCTAssertEqual(aliased, 1.23)
        XCTAssertNil(res?.i1_doubleArgs)
    }

    func testArrayAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_doubles(alias: "alias") 
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
        let aliased = res?.get(\.i1_doubles, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 1.23)
        XCTAssertEqual(aliased?[safe: 1], 3.21)
        XCTAssertNil(res?.i1_doubles)
    }

    func testArrayArgsAliasOnObjectFragmentParse() throws {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.i1_doublesArgs(alias: "alias", arguments: .testDefault) 
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
        let aliased = res?.get(\.i1_doublesArgs, alias: "alias")
        XCTAssertEqual(aliased?.count, 2)
        XCTAssertEqual(aliased?[safe: 0], 1.23)
        XCTAssertEqual(aliased?[safe: 1], 3.21)
        XCTAssertNil(res?.i1_doublesArgs)
    }
}
