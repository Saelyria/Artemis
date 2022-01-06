// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Float and [Float] render as expected

extension TestInterface2_Float_TypeTests {
    func testSingle() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_float 
        }
        let response = Data("""
        {
            "data": {
                "i2_float": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_float}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgs() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_floatArgs(arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "i2_floatArgs": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_floatArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArray() {
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            $0.i2_floats 
        }
        let response = Data("""
        {
            "data": {
                "i2_floats": [1.23, 3.21]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_floats}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testOptional() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_floatOptional 
        }
        let response = Data("""
        {
            "data": {
                "i2_floatOptional": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{i2_floatOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure single selections of Float and [Float] with aliases render as expected

extension TestInterface2_Float_TypeTests {
    func testSingleAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_float(alias: "alias") 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i2_float}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAlias() {
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            $0.i2_floatArgs(alias: "alias", arguments: .testDefault) 
        }
        let response = Data("""
        {
            "data": {
                "alias": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{alias:i2_floatArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Float and [Float] on an Object

extension TestInterface2_Float_TypeTests {
    func testSingleOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_float 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_float": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_float}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_float, 1.23)
    }

    func testSingleArgsOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floatArgs(arguments: .testDefault) 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_floatArgs": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_floatArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_floatArgs, 1.23)
    }

    func testArrayOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floats 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_floats": [1.23, 3.21]
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_floats}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_floats?.count, 2)
        XCTAssertEqual(res?.i2_floats?[safe: 0], 1.23)
        XCTAssertEqual(res?.i2_floats?[safe: 1], 3.21)
    }

    func testOptionalOnObject() {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floatOptional 
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "i2_floatOptional": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{i2_floatOptional}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_floatOptional, 1.23)
    }

}

// MARK: - Tests to ensure an alias of Float and [Float] on an Object can be used to pull values out of a result

extension TestInterface2_Float_TypeTests {
    func testSingleAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_float(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i2_float}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i2_float(alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testSingleArgsAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floatArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i2_floatArgs\(testArgs)}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i2_floatArgs(alias: "alias")
        XCTAssertEqual(aliased, 1.23)
    }

    func testArrayAliasOnObject() throws {
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floats(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{testObject{alias:i2_floats}}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        let aliased = res?.i2_floats(alias: "alias")
        XCTAssertEqual(aliased?[safe: 0], 1.23)
        XCTAssertEqual(aliased?[safe: 1], 3.21)
    }

}

// MARK: - Tests to ensure fragments on Query selecting Float and [Float] can be used at the top level of an operation

extension TestInterface2_Float_TypeTests {
    func testSingleOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_float 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_float": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_float}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_floatArgs(arguments: .testDefault) 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_floatArgs": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_floatArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testArrayOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_floats 
        }
        let query: _Operation<TestSchema, [SelectionType.Result]> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_floats": [1.23, 3.21]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_floats}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0], 1.23)
        XCTAssertEqual(res?[safe: 1], 3.21)
    }

    func testOptionalOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_floatOptional 
        }
        let query: _Operation<TestSchema, SelectionType.Result> = .query {
            fragment
        }
        let response = Data("""
        {
            "data": {
                "i2_floatOptional": 1.23
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_floatOptional}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}

// MARK: - Tests to ensure fragments on Query selecting Float and [Float] can be used at the top level of an operation with aliases

extension TestInterface2_Float_TypeTests {
    func testSingleAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_float(alias: "alias") 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i2_float}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }

    func testSingleArgsAliasOnFragment() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_floatArgs(alias: "alias", arguments: .testDefault) 
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

        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{alias:i2_floatArgs\(testArgs)}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res, 1.23)
    }
}


// MARK: - Tests to ensure fragments on TestInterface2 can be used on selections of Float or [Float]

extension TestInterface2_Float_TypeTests {
    func testSingleOnTestInterface2Fragment() {
        let fragment = Fragment("fragName", on: TestInterface2.self) {
            $0.i2_float 
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
                    "i2_float": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{...fragName}},fragment fragName on TestInterface2{i2_float}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_float, 1.23)
    }

    func testArrayOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface2.self) {
            $0.i2_float 
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
                    { "i2_float": 1.23 },
                    { "i2_float": 3.21 }
                ]
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjects{...fragName}},fragment fragName on TestInterface2{i2_float}")
        let res: [Partial<TestObject>]? = try? query.createResult(from: response)
        XCTAssertEqual(res?.count, 2)
        XCTAssertEqual(res?[safe: 0]?.i2_float, 1.23)
        XCTAssertEqual(res?[safe: 1]?.i2_float, 3.21)
    }

    func testOptionalOnObjectFragment() {
        let fragment = Fragment("fragName", on: TestInterface2.self) {
            $0.i2_float 
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
                    "i2_float": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObjectOptional{...fragName}},fragment fragName on TestInterface2{i2_float}")
        let res: Partial<TestObject>? = try? query.createResult(from: response)
        XCTAssertEqual(res?.values.count, 1)
        XCTAssertEqual(res?.i2_float, 1.23)
    }
}
