// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of TestEnum and [TestEnum] render as expected

extension TestInterface4_TestEnum_TypeTests {
    func testSingleRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i4_testEnum 
        }
        let response = Data("""
        {
            "data": {
                "i4_testEnum": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i4_testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgsRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i4_testEnumArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i4_testEnumArgs": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i4_testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testArrayRender() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i4_testEnums 
        }
        let response = Data("""
        {
            "data": {
                "i4_testEnums": ["FIRST", "SECOND"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i4_testEnums}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], .first)
        XCTAssertEqual(res?[safe: 1], .second)
    }

    func testOptionalRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i4_testEnumOptional 
        }
        let response = Data("""
        {
            "data": {
                "i4_testEnumOptional": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i4_testEnumOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Tests to ensure single selections of TestEnum and [TestEnum] with aliases render as expected

extension TestInterface4_TestEnum_TypeTests {
    func testSingleAliasRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i4_testEnum(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i4_testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i4_testEnumArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i4_testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of TestEnum and [TestEnum] on an Object

extension TestInterface4_TestEnum_TypeTests {
    func testSingleOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_testEnum 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_testEnum": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i4_testEnum}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_testEnum, .first)
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_testEnumArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_testEnumArgs": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i4_testEnumArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_testEnumArgs, .first)
    }

    func testArrayOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_testEnums 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_testEnums": ["FIRST", "SECOND"]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i4_testEnums}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_testEnums?.count, 2)
        XCTAssertEqual(res?.i4_testEnums?[safe: 0], .first)
        XCTAssertEqual(res?.i4_testEnums?[safe: 1], .second)
    }

    func testOptionalOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_testEnumOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_testEnumOptional": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i4_testEnumOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_testEnumOptional, .first)
    }
}

// MARK: - Tests to ensure an alias of TestEnum and [TestEnum] on an Object can be used to pull values out of a result

extension TestInterface4_TestEnum_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_testEnum(alias: "alias") 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:i4_testEnum}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i4_testEnum, alias: "alias")
        XCTAssertEqual(aliased, .first)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_testEnumArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:i4_testEnumArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i4_testEnumArgs, alias: "alias")
        XCTAssertEqual(aliased, .first)
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestEnum and [TestEnum] can be used at the top level of an operation

extension TestInterface4_TestEnum_TypeTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_testEnum 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_testEnum": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_testEnumArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_testEnumArgs": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_testEnums 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_testEnums": ["FIRST", "SECOND"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_testEnums}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], .first)
        XCTAssertEqual(res?[safe: 1], .second)
    }

    func testOptionalOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_testEnumOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_testEnumOptional": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_testEnumOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestEnum and [TestEnum] can be used at the top level of an operation with aliases

extension TestInterface4_TestEnum_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_testEnum(alias: "alias") 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i4_testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_testEnumArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i4_testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Tests to ensure fragments on TestInterface4 can be used on selections of TestEnum or [TestEnum]

extension TestInterface4_TestEnum_TypeTests {
    func testSingleOnTestInterface4Fragment() {
        let fragment = Fragment("fragName", on: TestInterface4.self) {
            $0.i4_testEnum 
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
                    "i4_testEnum": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface4{i4_testEnum}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_testEnum, .first)
    }

    func testArrayOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestInterface4.self) {
            $0.i4_testEnum 
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
                    { "i4_testEnum": "FIRST" },
                    { "i4_testEnum": "SECOND" }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface4{i4_testEnum}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i4_testEnum, .first)
        XCTAssertEqual(res?[safe: 1]?.i4_testEnum, .second)
    }

    func testOptionalOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestInterface4.self) {
            $0.i4_testEnum 
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
                    "i4_testEnum": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface4{i4_testEnum}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_testEnum, .first)
    }
}
