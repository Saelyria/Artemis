// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Double and [Double] render as expected

extension TestObject_Double_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.double 
        }
        let response = Data("""
        {
            "data": {
                "double": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.doubleArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "doubleArgs": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.doubles 
        }
        let response = Data("""
        {
            "data": {
                "doubles": [1.23, 3.21]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{doubles}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.doubleOptional 
        }
        let response = Data("""
        {
            "data": {
                "doubleOptional": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{doubleOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure single selections of Double and [Double] with aliases render as expected

extension TestObject_Double_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.double(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.doubleArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Double and [Double] on an Object

extension TestObject_Double_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.double 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "double": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{double}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.double, 1.23)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doubleArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "doubleArgs": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{doubleArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.doubleArgs, 1.23)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doubles 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "doubles": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{doubles}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.doubles?.count, 2)
        XCTAssertEqual(res?.doubles?[safe: 0], 1.23)
        XCTAssertEqual(res?.doubles?[safe: 1], 3.21)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doubleOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "doubleOptional": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{doubleOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.doubleOptional, 1.23)
    }
}

// MARK: - Tests to ensure an alias of Double and [Double] on an Object can be used to pull values out of a result

extension TestObject_Double_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.double(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:double}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.double(alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doubleArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:doubleArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.doubleArgs(alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Double and [Double] can be used at the top level of an operation

extension TestObject_Double_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.double 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "double": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.doubleArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "doubleArgs": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.doubles 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "doubles": [1.23, 3.21]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{doubles}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.doubleOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "doubleOptional": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{doubleOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Double and [Double] can be used at the top level of an operation with aliases

extension TestObject_Double_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.double(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.doubleArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Test selections of Double on Mutation

extension TestObject_Double_TypeTests {
    func testMutationSelection() {
        let mutation: _Operation<TestSchema, SelectionType.Result> = .mutation {
            $0.mut_double 
        }
        let response = Data("""
        {
            "data": {
                "mut_double": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(mutation.render(), "mutation{mut_double}")
        let res = try? mutation.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure fragments on TestObject can be used on selections of Double or [Double]

extension TestObject_Double_TypeTests {
    func testSingleOnTestObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.double 
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
                    "double": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestObject{double}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.double, 1.23)
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.double 
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
                    { "double": 1.23 },
                    { "double": 3.21 }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestObject{double}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.double, 1.23)
        XCTAssertEqual(res?[safe: 1]?.double, 3.21)
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.double 
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
                    "double": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestObject{double}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.double, 1.23)
    }
}
