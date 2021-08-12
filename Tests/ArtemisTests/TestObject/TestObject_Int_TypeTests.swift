// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Int and [Int] render as expected

extension TestObject_Int_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.int 
        }
        let response = Data("""
        {
            "data": {
                "int": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.intArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "intArgs": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.ints 
        }
        let response = Data("""
        {
            "data": {
                "ints": [123, 321]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{ints}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.intOptional 
        }
        let response = Data("""
        {
            "data": {
                "intOptional": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{intOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure single selections of Int and [Int] with aliases render as expected

extension TestObject_Int_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.int(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.intArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Int and [Int] on an Object

extension TestObject_Int_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{int}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.int, 123)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.intArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "intArgs": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{intArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.intArgs, 123)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.ints 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "ints": [123, 321]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{ints}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.ints?.count, 2)
        XCTAssertEqual(res?.ints?[safe: 0], 123)
        XCTAssertEqual(res?.ints?[safe: 1], 321)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.intOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "intOptional": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{intOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.intOptional, 123)
    }
}

// MARK: - Tests to ensure an alias of Int and [Int] on an Object can be used to pull values out of a result

extension TestObject_Int_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:int}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.int(alias: "alias")
        XCTAssertEqual(aliased, 123)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.intArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:intArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.intArgs(alias: "alias")
        XCTAssertEqual(aliased, 123)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] can be used at the top level of an operation

extension TestObject_Int_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.int 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "int": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.intArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "intArgs": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.ints 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "ints": [123, 321]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{ints}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.intOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "intOptional": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{intOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] can be used at the top level of an operation with aliases

extension TestObject_Int_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.int(alias: "alias") 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.intArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Test selections of Int on Mutation

extension TestObject_Int_TypeTests {
    func testMutationSelection() {
        let mutation: _Operation<TestSchema, SelectionType.Result> = .mutation {
            $0.mut_int 
        }
        let response = Data("""
        {
            "data": {
                "mut_int": 123
            }
        }
        """.utf8)

        XCTAssertEqual(mutation.render(), "mutation{mut_int}")
        let res = try? mutation.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure fragments on TestObject can be used on selections of Int or [Int]

extension TestObject_Int_TypeTests {
    func testSingleOnTestObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.int 
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
                    "int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestObject{int}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.int, 123)
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.int 
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
                    { "int": 123 },
                    { "int": 321 }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestObject{int}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.int, 123)
        XCTAssertEqual(res?[safe: 1]?.int, 321)
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.int 
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
                    "int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestObject{int}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.int, 123)
    }
}
