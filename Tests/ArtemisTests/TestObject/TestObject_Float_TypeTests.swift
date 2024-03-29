// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Float and [Float] render as expected

extension TestObject_Float_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.float 
        }
        let response = Data("""
        {
            "data": {
                "float": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{float}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.floatArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "floatArgs": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{floatArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.floats 
        }
        let response = Data("""
        {
            "data": {
                "floats": [1.23, 3.21]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{floats}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.floatOptional 
        }
        let response = Data("""
        {
            "data": {
                "floatOptional": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{floatOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure single selections of Float and [Float] with aliases render as expected

extension TestObject_Float_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.float(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:float}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.floatArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:floatArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Float and [Float] on an Object

extension TestObject_Float_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.float 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "float": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{float}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.float, 1.23)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floatArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "floatArgs": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{floatArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.floatArgs, 1.23)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floats 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "floats": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{floats}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.floats?.count, 2)
        XCTAssertEqual(res?.floats?[safe: 0], 1.23)
        XCTAssertEqual(res?.floats?[safe: 1], 3.21)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floatOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "floatOptional": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{floatOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.floatOptional, 1.23)
    }

}

// MARK: - Tests to ensure an alias of Float and [Float] on an Object can be used to pull values out of a result

extension TestObject_Float_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.float(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:float}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.float(alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floatArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:floatArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.floatArgs(alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testArrayAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floats(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:floats}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.floats(alias: "alias")
        XCTAssertEqual(aliased?[safe: 0], 1.23)
        XCTAssertEqual(aliased?[safe: 1], 3.21)
    }

}

// MARK: - Tests to ensure fragments on Query selecting Float and [Float] can be used at the top level of an operation

extension TestObject_Float_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.float 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "float": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{float}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floatArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "floatArgs": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{floatArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floats 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "floats": [1.23, 3.21]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{floats}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floatOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "floatOptional": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{floatOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Float and [Float] can be used at the top level of an operation with aliases

extension TestObject_Float_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.float(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:float}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floatArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:floatArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Test selections of Float on Mutation

extension TestObject_Float_TypeTests {
    func testMutationSelection() {
        let mutation: _Operation<TestSchema, SelectionType.Result> = .mutation {
            $0.mut_float 
        }
        let response = Data("""
        {
            "data": {
                "mut_float": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(mutation.render(), "mutation{mut_float}")
        let res = try? mutation.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure fragments on TestObject can be used on selections of Float or [Float]

extension TestObject_Float_TypeTests {
    func testSingleOnTestObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.float 
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
                    "float": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestObject{float}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.float, 1.23)
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.float 
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
                    { "float": 1.23 },
                    { "float": 3.21 }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestObject{float}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.float, 1.23)
        XCTAssertEqual(res?[safe: 1]?.float, 3.21)
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestObject.self) {
            $0.float 
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
                    "float": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestObject{float}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.float, 1.23)
    }
}
