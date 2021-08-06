// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Float and [Float] render as expected

extension TestObject_Float_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.float 
        }
        XCTAssertEqual(query.render(), "{float}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.floatArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{floatArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.floats 
        }
        XCTAssertEqual(query.render(), "{floats}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.floatsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Float and [Float] with aliases render as expected

extension TestObject_Float_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.float(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:float}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.floatArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:floatArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.floats(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:floats}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.floatsArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Float and [Float] render as expected

extension TestObject_Float_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.float 
            $0.float 
        }
        XCTAssertEqual(query.render(), "{float,float}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.floatArgs(arguments: .testDefault) 
            $0.floatArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{floatArgs\(testArgs),floatArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.floats 
            $0.floats 
        }
        XCTAssertEqual(query.render(), "{floats,floats}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.floatsArgs(arguments: .testDefault) 
            $0.floatsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{floatsArgs\(testArgs),floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Float and [Float]

extension TestObject_Float_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.float 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{float}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floatArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{floatArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floats 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{floats}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floatsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{floatsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Float and [Float] can be selected on a sub-selection of Object

extension TestObject_Float_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.float 
                $0.float 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{float,float}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floatArgs(arguments: .testDefault) 
                $0.floatArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{floatArgs\(testArgs),floatArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floats 
                $0.floats 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{floats,floats}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.floatsArgs(arguments: .testDefault) 
                $0.floatsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{floatsArgs\(testArgs),floatsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Float and [Float] can be used at the top level of an operation

extension TestObject_Float_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.float 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{float}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floatArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{floatArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floats 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{floats}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floatsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{floatsArgs\(testArgs)}")
    }
}
