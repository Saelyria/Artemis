// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Float and [Float] render as expected

extension TestInterface5_Float_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i5_float 
        }
        XCTAssertEqual(query.render(), "{i5_float}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i5_floatArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i5_floatArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i5_floats 
        }
        XCTAssertEqual(query.render(), "{i5_floats}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i5_floatsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i5_floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Float and [Float] with aliases render as expected

extension TestInterface5_Float_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i5_float(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i5_float}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i5_floatArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i5_floatArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i5_floats(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i5_floats}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i5_floatsArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i5_floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Float and [Float] render as expected

extension TestInterface5_Float_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.i5_float 
            $0.i5_float 
        }
        XCTAssertEqual(query.render(), "{i5_float,i5_float}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.i5_floatArgs(arguments: .testDefault) 
            $0.i5_floatArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i5_floatArgs\(testArgs),i5_floatArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.i5_floats 
            $0.i5_floats 
        }
        XCTAssertEqual(query.render(), "{i5_floats,i5_floats}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.i5_floatsArgs(arguments: .testDefault) 
            $0.i5_floatsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i5_floatsArgs\(testArgs),i5_floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Float and [Float]

extension TestInterface5_Float_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_float 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i5_float}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_floatArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i5_floatArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_floats 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i5_floats}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_floatsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i5_floatsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Float and [Float] can be selected on a sub-selection of Object

extension TestInterface5_Float_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_float 
                $0.i5_float 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i5_float,i5_float}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_floatArgs(arguments: .testDefault) 
                $0.i5_floatArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i5_floatArgs\(testArgs),i5_floatArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_floats 
                $0.i5_floats 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i5_floats,i5_floats}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i5_floatsArgs(arguments: .testDefault) 
                $0.i5_floatsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i5_floatsArgs\(testArgs),i5_floatsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Float and [Float] can be used at the top level of an operation

extension TestInterface5_Float_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_float 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_float}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_floatArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_floatArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_floats 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_floats}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i5_floatsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i5_floatsArgs\(testArgs)}")
    }
}
