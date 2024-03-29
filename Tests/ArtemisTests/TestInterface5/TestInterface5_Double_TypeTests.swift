// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Double and [Double] render as expected

extension TestInterface5_Double_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_double 
        }
        let response = Data("""
        {
            "data": {
                "i5_double": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_doubleArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i5_doubleArgs": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i5_doubles 
        }
        let response = Data("""
        {
            "data": {
                "i5_doubles": [1.23, 3.21]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_doubles}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_doubleOptional 
        }
        let response = Data("""
        {
            "data": {
                "i5_doubleOptional": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i5_doubleOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure single selections of Double and [Double] with aliases render as expected

extension TestInterface5_Double_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_double(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i5_double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i5_doubleArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i5_doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Double and [Double] on an Object

extension TestInterface5_Double_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_double 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_double": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_double}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_double, 1.23)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_doubleArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_doubleArgs": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_doubleArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_doubleArgs, 1.23)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_doubles 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_doubles": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_doubles}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_doubles?.count, 2)
        XCTAssertEqual(res?.i5_doubles?[safe: 0], 1.23)
        XCTAssertEqual(res?.i5_doubles?[safe: 1], 3.21)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_doubleOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i5_doubleOptional": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i5_doubleOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_doubleOptional, 1.23)
    }

}

// MARK: - Tests to ensure an alias of Double and [Double] on an Object can be used to pull values out of a result

extension TestInterface5_Double_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_double(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i5_double}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i5_double(alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_doubleArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i5_doubleArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i5_doubleArgs(alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testArrayAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_doubles(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i5_doubles}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i5_doubles(alias: "alias")
        XCTAssertEqual(aliased?[safe: 0], 1.23)
        XCTAssertEqual(aliased?[safe: 1], 3.21)
    }

}

// MARK: - Tests to ensure fragments on Query selecting Double and [Double] can be used at the top level of an operation

extension TestInterface5_Double_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_double 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_double": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_doubleArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_doubleArgs": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_doubles 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_doubles": [1.23, 3.21]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_doubles}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_doubleOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i5_doubleOptional": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_doubleOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Double and [Double] can be used at the top level of an operation with aliases

extension TestInterface5_Double_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_double(alias: "alias") 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i5_double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_doubleArgs(alias: "alias", arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i5_doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}


// MARK: - Tests to ensure fragments on TestInterface5 can be used on selections of Double or [Double]

extension TestInterface5_Double_TypeTests {
    func testSingleOnTestInterface5Fragment() {
        let fragment = Fragment("fragName", on: TestInterface5.self) {
            $0.i5_double 
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
                    "i5_double": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface5{i5_double}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_double, 1.23)
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface5.self) {
            $0.i5_double 
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
                    { "i5_double": 1.23 },
                    { "i5_double": 3.21 }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface5{i5_double}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i5_double, 1.23)
        XCTAssertEqual(res?[safe: 1]?.i5_double, 3.21)
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface5.self) {
            $0.i5_double 
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
                    "i5_double": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface5{i5_double}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i5_double, 1.23)
    }
}
