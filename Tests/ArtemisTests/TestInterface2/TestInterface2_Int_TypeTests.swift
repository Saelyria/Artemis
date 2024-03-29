// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Int and [Int] render as expected

extension TestInterface2_Int_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_int 
        }
        let response = Data("""
        {
            "data": {
                "i2_int": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_intArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i2_intArgs": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i2_ints 
        }
        let response = Data("""
        {
            "data": {
                "i2_ints": [123, 321]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_ints}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_intOptional 
        }
        let response = Data("""
        {
            "data": {
                "i2_intOptional": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_intOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure single selections of Int and [Int] with aliases render as expected

extension TestInterface2_Int_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_int(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i2_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_intArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i2_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Int and [Int] on an Object

extension TestInterface2_Int_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_int 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_int}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_int, 123)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_intArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_intArgs": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_intArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_intArgs, 123)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_ints 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_ints": [123, 321]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_ints}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_ints?.count, 2)
        XCTAssertEqual(res?.i2_ints?[safe: 0], 123)
        XCTAssertEqual(res?.i2_ints?[safe: 1], 321)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_intOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_intOptional": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_intOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_intOptional, 123)
    }

}

// MARK: - Tests to ensure an alias of Int and [Int] on an Object can be used to pull values out of a result

extension TestInterface2_Int_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_int(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i2_int}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i2_int(alias: "alias")
        XCTAssertEqual(aliased, 123)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_intArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i2_intArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i2_intArgs(alias: "alias")
        XCTAssertEqual(aliased, 123)
    }

    func testArrayAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_ints(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i2_ints}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i2_ints(alias: "alias")
        XCTAssertEqual(aliased?[safe: 0], 123)
        XCTAssertEqual(aliased?[safe: 1], 321)
    }

}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] can be used at the top level of an operation

extension TestInterface2_Int_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_int 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_int": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_intArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_intArgs": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_ints 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_ints": [123, 321]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_ints}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 123)
        XCTAssertEqual(res?[safe: 1], 321)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_intOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_intOptional": 123
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_intOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] can be used at the top level of an operation with aliases

extension TestInterface2_Int_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_int(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i2_int}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_intArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i2_intArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 123)
    }
}


// MARK: - Tests to ensure fragments on TestInterface2 can be used on selections of Int or [Int]

extension TestInterface2_Int_TypeTests {
    func testSingleOnTestInterface2Fragment() {
        let fragment = Fragment("fragName", on: TestInterface2.self) {
            $0.i2_int 
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
                    "i2_int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface2{i2_int}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_int, 123)
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface2.self) {
            $0.i2_int 
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
                    { "i2_int": 123 },
                    { "i2_int": 321 }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface2{i2_int}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i2_int, 123)
        XCTAssertEqual(res?[safe: 1]?.i2_int, 321)
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface2.self) {
            $0.i2_int 
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
                    "i2_int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface2{i2_int}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_int, 123)
    }
}
