// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Int and [Int] render as expected

extension TestInterface4_Int_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i4_int 
        }
        XCTAssertEqual(query.render(), "{i4_int}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i4_intArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i4_intArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i4_ints 
        }
        XCTAssertEqual(query.render(), "{i4_ints}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i4_intsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i4_intsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Int and [Int] with aliases render as expected

extension TestInterface4_Int_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i4_int(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i4_int}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i4_intArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i4_intArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i4_ints(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i4_ints}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i4_intsArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i4_intsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Int and [Int] render as expected

extension TestInterface4_Int_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.i4_int 
            $0.i4_int 
        }
        XCTAssertEqual(query.render(), "{i4_int,i4_int}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.i4_intArgs(arguments: .testDefault) 
            $0.i4_intArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i4_intArgs\(testArgs),i4_intArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.i4_ints 
            $0.i4_ints 
        }
        XCTAssertEqual(query.render(), "{i4_ints,i4_ints}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.i4_intsArgs(arguments: .testDefault) 
            $0.i4_intsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i4_intsArgs\(testArgs),i4_intsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Int and [Int]

extension TestInterface4_Int_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_int 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i4_int}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_intArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i4_intArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_ints 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i4_ints}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_intsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i4_intsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Int and [Int] can be selected on a sub-selection of Object

extension TestInterface4_Int_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_int 
                $0.i4_int 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i4_int,i4_int}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_intArgs(arguments: .testDefault) 
                $0.i4_intArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i4_intArgs\(testArgs),i4_intArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_ints 
                $0.i4_ints 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i4_ints,i4_ints}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i4_intsArgs(arguments: .testDefault) 
                $0.i4_intsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i4_intsArgs\(testArgs),i4_intsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] can be used at the top level of an operation

extension TestInterface4_Int_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_int 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_int}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_intArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, SelectionType.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_intArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_ints 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_ints}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i4_intsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i4_intsArgs\(testArgs)}")
    }
}
