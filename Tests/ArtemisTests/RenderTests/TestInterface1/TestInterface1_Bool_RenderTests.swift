// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Bool and [Bool] render as expected

extension TestInterface1_Bool_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, Bool.Result> = .query {
            $0.i1_bool 
        }
        XCTAssertEqual(query.render(), "{i1_bool}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Bool.Result> = .query {
            $0.i1_boolArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_boolArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Bool.Result]> = .query {
            $0.i1_bools 
        }
        XCTAssertEqual(query.render(), "{i1_bools}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Bool.Result]> = .query {
            $0.i1_boolsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_boolsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Bool and [Bool] with aliases render as expected

extension TestInterface1_Bool_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Bool.Result> = .query {
            $0.i1_bool(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i1_bool}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Bool.Result> = .query {
            $0.i1_boolArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i1_boolArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Bool.Result]> = .query {
            $0.i1_bools(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i1_bools}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Bool.Result]> = .query {
            $0.i1_boolsArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i1_boolsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Bool and [Bool] render as expected

extension TestInterface1_Bool_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Bool.Result, Bool.Result)> = .query {
            $0.i1_bool 
            $0.i1_bool 
        }
        XCTAssertEqual(query.render(), "{i1_bool,i1_bool}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Bool.Result, Bool.Result)> = .query {
            $0.i1_boolArgs(arguments: .testDefault) 
            $0.i1_boolArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_boolArgs\(testArgs),i1_boolArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Bool.Result], [Bool.Result])> = .query {
            $0.i1_bools 
            $0.i1_bools 
        }
        XCTAssertEqual(query.render(), "{i1_bools,i1_bools}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Bool.Result], [Bool.Result])> = .query {
            $0.i1_boolsArgs(arguments: .testDefault) 
            $0.i1_boolsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_boolsArgs\(testArgs),i1_boolsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Bool and [Bool]

extension TestInterface1_Bool_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_bool 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_bool}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_boolArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_boolArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_bools 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_bools}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_boolsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_boolsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Bool and [Bool] can be selected on a sub-selection of Object

extension TestInterface1_Bool_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_bool 
                $0.i1_bool 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_bool,i1_bool}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_boolArgs(arguments: .testDefault) 
                $0.i1_boolArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_boolArgs\(testArgs),i1_boolArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_bools 
                $0.i1_bools 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_bools,i1_bools}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_boolsArgs(arguments: .testDefault) 
                $0.i1_boolsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_boolsArgs\(testArgs),i1_boolsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] can be used at the top level of an operation

extension TestInterface1_Bool_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_bool 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_bool}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_boolArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_boolArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_bools 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_bools}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_boolsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_boolsArgs\(testArgs)}")
    }
}
