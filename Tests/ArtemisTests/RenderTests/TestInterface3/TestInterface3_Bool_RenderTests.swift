// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Bool and [Bool] render as expected

extension TestInterface3_Bool_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_bool 
        }
        XCTAssertEqual(query.render(), "{i3_bool}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_boolArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i3_boolArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_bools 
        }
        XCTAssertEqual(query.render(), "{i3_bools}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_boolsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i3_boolsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Bool and [Bool] with aliases render as expected

extension TestInterface3_Bool_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_bool(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i3_bool}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i3_boolArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i3_boolArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_bools(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i3_bools}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i3_boolsArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i3_boolsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Bool and [Bool] render as expected

extension TestInterface3_Bool_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.i3_bool 
            $0.i3_bool 
        }
        XCTAssertEqual(query.render(), "{i3_bool,i3_bool}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.i3_boolArgs(arguments: .testDefault) 
            $0.i3_boolArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i3_boolArgs\(testArgs),i3_boolArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.i3_bools 
            $0.i3_bools 
        }
        XCTAssertEqual(query.render(), "{i3_bools,i3_bools}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.i3_boolsArgs(arguments: .testDefault) 
            $0.i3_boolsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i3_boolsArgs\(testArgs),i3_boolsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Bool and [Bool]

extension TestInterface3_Bool_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_bool 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_bool}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_boolArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_boolArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_bools 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_bools}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_boolsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_boolsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Bool and [Bool] can be selected on a sub-selection of Object

extension TestInterface3_Bool_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_bool 
                $0.i3_bool 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_bool,i3_bool}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_boolArgs(arguments: .testDefault) 
                $0.i3_boolArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_boolArgs\(testArgs),i3_boolArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_bools 
                $0.i3_bools 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_bools,i3_bools}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i3_boolsArgs(arguments: .testDefault) 
                $0.i3_boolsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i3_boolsArgs\(testArgs),i3_boolsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] can be used at the top level of an operation

extension TestInterface3_Bool_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_bool 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_bool}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_boolArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_boolArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_bools 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_bools}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i3_boolsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i3_boolsArgs\(testArgs)}")
    }
}
