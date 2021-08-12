// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Int and [Int] render as expected

extension TestInterface4_Int_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i4_int 
        }
        let response = Data("""
        {
            "data": {
                "i4_int": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i4_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i4_intArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i4_intArgs": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i4_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i4_ints 
        }
        let response = Data("""
        {
            "data": {
                "i4_ints": [123, 321]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i4_ints}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i4_intOptional 
        }
        let response = Data("""
        {
            "data": {
                "i4_intOptional": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i4_intOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure single selections of Int and [Int] with aliases render as expected

extension TestInterface4_Int_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i4_int(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i4_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i4_intArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i4_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Int and [Int] on an Object

extension TestInterface4_Int_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_int 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i4_int}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_int, 123)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_intArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_intArgs": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i4_intArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_intArgs, 123)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_ints 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_ints": [123, 321]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i4_ints}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_ints?.count, 2)
        XCTAssertEqual(res?.i4_ints?[safe: 0], 123)
        XCTAssertEqual(res?.i4_ints?[safe: 1], 321)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_intOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i4_intOptional": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i4_intOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_intOptional, 123)
    }
}

// MARK: - Tests to ensure an alias of Int and [Int] on an Object can be used to pull values out of a result

extension TestInterface4_Int_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_int(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i4_int}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i4_int(alias: "alias")
        XCTAssertEqual(aliased, 123)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_intArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i4_intArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i4_intArgs(alias: "alias")
        XCTAssertEqual(aliased, 123)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] can be used at the top level of an operation

extension TestInterface4_Int_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_int 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_int": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_intArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_intArgs": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_ints 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_ints": [123, 321]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_ints}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_intOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i4_intOptional": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_intOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] can be used at the top level of an operation with aliases

extension TestInterface4_Int_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_int(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i4_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_intArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i4_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}


// MARK: - Tests to ensure fragments on TestInterface4 can be used on selections of Int or [Int]

extension TestInterface4_Int_TypeTests {
    func testSingleOnTestInterface4Fragment() {
        let fragment = Fragment("fragName", on: TestInterface4.self) {
            $0.i4_int 
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
                    "i4_int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface4{i4_int}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_int, 123)
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface4.self) {
            $0.i4_int 
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
                    { "i4_int": 123 },
                    { "i4_int": 321 }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface4{i4_int}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i4_int, 123)
        XCTAssertEqual(res?[safe: 1]?.i4_int, 321)
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface4.self) {
            $0.i4_int 
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
                    "i4_int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface4{i4_int}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i4_int, 123)
    }
}
