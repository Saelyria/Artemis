// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of TestEnum and [TestEnum] render as expected

extension TestInterface1_TestEnum_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i1_testEnum 
        }
        let response = Data("""
        {
            "data": {
                "i1_testEnum": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i1_testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i1_testEnumArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i1_testEnumArgs": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i1_testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i1_testEnums 
        }
        let response = Data("""
        {
            "data": {
                "i1_testEnums": ["FIRST", "SECOND"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i1_testEnums}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], .first)
        XCTAssertEqual(res?[safe: 1], .second)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i1_testEnumOptional 
        }
        let response = Data("""
        {
            "data": {
                "i1_testEnumOptional": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i1_testEnumOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Tests to ensure single selections of TestEnum and [TestEnum] with aliases render as expected

extension TestInterface1_TestEnum_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i1_testEnum(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i1_testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i1_testEnumArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i1_testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of TestEnum and [TestEnum] on an Object

extension TestInterface1_TestEnum_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testEnum 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testEnum": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i1_testEnum}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_testEnum, .first)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testEnumArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testEnumArgs": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i1_testEnumArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_testEnumArgs, .first)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testEnums 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testEnums": ["FIRST", "SECOND"]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i1_testEnums}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_testEnums?.count, 2)
        XCTAssertEqual(res?.i1_testEnums?[safe: 0], .first)
        XCTAssertEqual(res?.i1_testEnums?[safe: 1], .second)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testEnumOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i1_testEnumOptional": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i1_testEnumOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_testEnumOptional, .first)
    }

}

// MARK: - Tests to ensure an alias of TestEnum and [TestEnum] on an Object can be used to pull values out of a result

extension TestInterface1_TestEnum_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testEnum(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i1_testEnum}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i1_testEnum(alias: "alias")
        XCTAssertEqual(aliased, .first)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testEnumArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i1_testEnumArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i1_testEnumArgs(alias: "alias")
        XCTAssertEqual(aliased, .first)
    }

    func testArrayAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_testEnums(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i1_testEnums}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i1_testEnums(alias: "alias")
        XCTAssertEqual(aliased?[safe: 0], .first)
        XCTAssertEqual(aliased?[safe: 1], .second)
    }

}

// MARK: - Tests to ensure fragments on Query selecting TestEnum and [TestEnum] can be used at the top level of an operation

extension TestInterface1_TestEnum_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testEnum 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_testEnum": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testEnumArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_testEnumArgs": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testEnums 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_testEnums": ["FIRST", "SECOND"]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_testEnums}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], .first)
        XCTAssertEqual(res?[safe: 1], .second)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testEnumOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i1_testEnumOptional": "FIRST"
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_testEnumOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}

// MARK: - Tests to ensure fragments on Query selecting TestEnum and [TestEnum] can be used at the top level of an operation with aliases

extension TestInterface1_TestEnum_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testEnum(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i1_testEnum}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_testEnumArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i1_testEnumArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, .first)
    }
}


// MARK: - Tests to ensure fragments on TestInterface1 can be used on selections of TestEnum or [TestEnum]

extension TestInterface1_TestEnum_TypeTests {
    func testSingleOnTestInterface1Fragment() {
        let fragment = Fragment("fragName", on: TestInterface1.self) {
            $0.i1_testEnum 
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
                    "i1_testEnum": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface1{i1_testEnum}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_testEnum, .first)
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface1.self) {
            $0.i1_testEnum 
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
                    { "i1_testEnum": "FIRST" },
                    { "i1_testEnum": "SECOND" }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface1{i1_testEnum}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i1_testEnum, .first)
        XCTAssertEqual(res?[safe: 1]?.i1_testEnum, .second)
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface1.self) {
            $0.i1_testEnum 
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
                    "i1_testEnum": "FIRST"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface1{i1_testEnum}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i1_testEnum, .first)
    }
}
