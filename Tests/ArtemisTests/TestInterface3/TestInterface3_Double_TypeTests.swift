// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Double and [Double] render as expected

extension TestInterface3_Double_TypeTests {
    func testSingleRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_double 
        }
        let response = Data("""
        {
            "data": {
                "i3_double": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_doubleArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i3_doubleArgs": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayRender() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i3_doubles 
        }
        let response = Data("""
        {
            "data": {
                "i3_doubles": [1.23, 3.21]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_doubles}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testOptionalRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_doubleOptional 
        }
        let response = Data("""
        {
            "data": {
                "i3_doubleOptional": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i3_doubleOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure single selections of Double and [Double] with aliases render as expected

extension TestInterface3_Double_TypeTests {
    func testSingleAliasRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_double(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i3_double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i3_doubleArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i3_doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Double and [Double] on an Object

extension TestInterface3_Double_TypeTests {
    func testSingleOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_double 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_double": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_double}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_double, 1.23)
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_doubleArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_doubleArgs": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_doubleArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_doubleArgs, 1.23)
    }

    func testArrayOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_doubles 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_doubles": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_doubles}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_doubles?.count, 2)
        XCTAssertEqual(res?.i3_doubles?[safe: 0], 1.23)
        XCTAssertEqual(res?.i3_doubles?[safe: 1], 3.21)
    }

    func testOptionalOnObjectRender() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_doubleOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i3_doubleOptional": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i3_doubleOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_doubleOptional, 1.23)
    }
}

// MARK: - Tests to ensure an alias of Double and [Double] on an Object can be used to pull values out of a result

extension TestInterface3_Double_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_double(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i3_double}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i3_double, alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_doubleArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i3_doubleArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.get(\.i3_doubleArgs, alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Double and [Double] can be used at the top level of an operation

extension TestInterface3_Double_TypeTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_double 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_double": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_doubleArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_doubleArgs": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_doubles 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_doubles": [1.23, 3.21]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_doubles}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testOptionalOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_doubleOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i3_doubleOptional": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_doubleOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Double and [Double] can be used at the top level of an operation with aliases

extension TestInterface3_Double_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_double(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i3_double}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_doubleArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i3_doubleArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure fragments on TestInterface3 can be used on selections of Double or [Double]

extension TestInterface3_Double_TypeTests {
    func testSingleOnTestInterface3Fragment() {
        let fragment = Fragment("fragName", on: TestInterface3.self) {
            $0.i3_double 
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
                    "i3_double": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface3{i3_double}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_double, 1.23)
    }

    func testArrayOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestInterface3.self) {
            $0.i3_double 
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
                    { "i3_double": 1.23 },
                    { "i3_double": 3.21 }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface3{i3_double}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i3_double, 1.23)
        XCTAssertEqual(res?[safe: 1]?.i3_double, 3.21)
    }

    func testOptionalOnObjectFragmentRender() {
        let fragment = Fragment("fragName", on: TestInterface3.self) {
            $0.i3_double 
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
                    "i3_double": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface3{i3_double}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i3_double, 1.23)
    }
}
