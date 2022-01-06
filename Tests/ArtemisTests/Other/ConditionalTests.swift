import XCTest
@testable import Artemis

class ConditionalTests: XCTestCase {
    func testIfTrue() {
        let include = true
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int
                if include {
                    $0.bool
                }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "int": 123,
                    "bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{int,bool}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 123)
        XCTAssertEqual(res?.bool, true)
    }

    func testIfFalse() {
        let include = false
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int
                if include {
                    $0.bool
                }
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
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 123)
        XCTAssertEqual(res?.bool, nil)
    }

    func testIfElseTrue() {
        let include = true
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                if include {
                    $0.bool
                } else {
                    $0.string
                }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{bool}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.bool, true)
        XCTAssertEqual(res?.string, nil)
    }

    func testIfElseFalse() {
        let include = false
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                if include {
                    $0.bool
                } else {
                    $0.string
                }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "string": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{string}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.bool, nil)
        XCTAssertEqual(res?.string, "value")
    }
}

extension ConditionalTests {
    func testIfElseTrueWithOther() {
        let include = true
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int
                if include {
                    $0.bool
                } else {
                    $0.string
                }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "int": 123,
                    "bool": true
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{int,bool}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 123)
        XCTAssertEqual(res?.bool, true)
        XCTAssertEqual(res?.string, nil)
    }

    func testIfElseFalseWithOther() {
        let include = false
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int
                if include {
                    $0.bool
                } else {
                    $0.string
                }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "int": 123,
                    "string": "value"
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{int,string}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 123)
        XCTAssertEqual(res?.bool, nil)
        XCTAssertEqual(res?.string, "value")
    }
}

extension ConditionalTests {
    func testIfTrueMultiple() {
        let include = true
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int
                if include {
                    $0.bool
                    $0.double
                }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "int": 123,
                    "bool": true,
                    "double": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{int,bool,double}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 123)
        XCTAssertEqual(res?.bool, true)
        XCTAssertEqual(res?.double, 1.23)
    }

    func testIfFalseMultiple() {
        let include = false
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int
                if include {
                    $0.bool
                    $0.double
                }
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
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.int, 123)
        XCTAssertEqual(res?.bool, nil)
        XCTAssertEqual(res?.double, nil)
    }

    func testIfElseTrueMultiple() {
        let include = true
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                if include {
                    $0.bool
                    $0.double
                } else {
                    $0.string
                    $0.int
                }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "bool": true,
                    "double": 1.23
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{bool,double}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.bool, true)
        XCTAssertEqual(res?.double, 1.23)
        XCTAssertEqual(res?.string, nil)
        XCTAssertEqual(res?.int, nil)
    }

    func testIfElseFalseMultiple() {
        let include = false
        let query: _Operation<TestSchema, Partial<TestObject>> = .query {
            $0.testObject {
                if include {
                    $0.bool
                    $0.double
                } else {
                    $0.string
                    $0.int
                }
            }
        }
        let response = Data("""
        {
            "data": {
                "testObject": {
                    "string": "value",
                    "int": 123
                }
            }
        }
        """.utf8)

        XCTAssertEqual(query.render(), "{testObject{string,int}}")
        let res = try? query.createResult(from: response)
        XCTAssertEqual(res?.bool, nil)
        XCTAssertEqual(res?.double, nil)
        XCTAssertEqual(res?.string, "value")
        XCTAssertEqual(res?.int, 123)
    }
}
