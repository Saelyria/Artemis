// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of TestEnum and [TestEnum] render as expected

extension TestObject_TestEnum_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.testEnum 
        }
        let response = Data("""
        {
            "data": {
                "testEnum": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.testEnumArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "testEnumArgs": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.testEnums 
        }
        let response = Data("""
        {
            "data": {
                "testEnums": ["FIRST", "SECOND"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testEnums}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], .first)
        XCTAssertEqual(res?[safe: 1], .second)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.testEnumOptional 
        }
        let response = Data("""
        {
            "data": {
                "testEnumOptional": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testEnumOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Tests to ensure single selections of TestEnum and [TestEnum] with aliases render as expected

extension TestObject_TestEnum_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.testEnum(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.testEnumArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of TestEnum and [TestEnum] on an Object

extension TestObject_TestEnum_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnum 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "testEnum": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{testEnum}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.testEnum, .first)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnumArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "testEnumArgs": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{testEnumArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.testEnumArgs, .first)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnums 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "testEnums": ["FIRST", "SECOND"]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{testEnums}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.testEnums?.count, 2)
        XCTAssertEqual(res?.testEnums?[safe: 0], .first)
        XCTAssertEqual(res?.testEnums?[safe: 1], .second)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnumOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "testEnumOptional": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{testEnumOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.testEnumOptional, .first)
    }

}

// MARK: - Tests to ensure an alias of TestEnum and [TestEnum] on an Object can be used to pull values out of a result

extension TestObject_TestEnum_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnum(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:testEnum}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.testEnum(alias: "alias")
        XCTAssertEqual(aliased, .first)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnumArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:testEnumArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.testEnumArgs(alias: "alias")
        XCTAssertEqual(aliased, .first)
    }

    func testArrayAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.testEnums(alias: "alias") 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "alias": ["FIRST", "SECOND"]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{alias:testEnums}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.testEnums(alias: "alias")
        XCTAssertEqual(aliased?[safe: 0], .first)
        XCTAssertEqual(aliased?[safe: 1], .second)
    }

}

// MARK: - Tests to ensure fragments on Query selecting TestEnum and [TestEnum] can be used at the top level of an operation

extension TestObject_TestEnum_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testEnum 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "testEnum": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testEnumArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "testEnumArgs": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testEnums 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "testEnums": ["FIRST", "SECOND"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testEnums}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], .first)
        XCTAssertEqual(res?[safe: 1], .second)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testEnumOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "testEnumOptional": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{testEnumOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestEnum and [TestEnum] can be used at the top level of an operation with aliases

extension TestObject_TestEnum_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testEnum(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.testEnumArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Test selections of TestEnum on Mutation

extension TestObject_TestEnum_TypeTests {
    func testMutationSelection() {
        let mutation: _Operation<TestSchema, SelectionType.Result> = .mutation {
            $0.mut_testEnum 
        }
        let response = Data("""
        {
            "data": {
                "mut_testEnum": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(mutation.render(), "mutation{mut_testEnum}")
        let res = try? mutation.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Tests to ensure fragments on TestObject can be used on selections of TestEnum or [TestEnum]

extension TestObject_TestEnum_TypeTests {
    func testSingleOnTestObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.testEnum 
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
                    "testEnum": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestObject{testEnum}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.testEnum, .first)
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.testEnum 
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
                    { "testEnum": "FIRST" },
                    { "testEnum": "SECOND" }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestObject{testEnum}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.testEnum, .first)
        XCTAssertEqual(res?[safe: 1]?.testEnum, .second)
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.testEnum 
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
                    "testEnum": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestObject{testEnum}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.testEnum, .first)
    }
}
