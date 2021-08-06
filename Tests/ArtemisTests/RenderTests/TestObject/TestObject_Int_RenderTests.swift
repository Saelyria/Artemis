// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Int and [Int] render as expected

extension TestObject_Int_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, Int.Result> = .query {
            $0.int 
        }
        XCTAssertEqual(query.render(), "{int}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Int.Result> = .query {
            $0.intArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{intArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Int.Result]> = .query {
            $0.ints 
        }
        XCTAssertEqual(query.render(), "{ints}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Int.Result]> = .query {
            $0.intsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{intsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Int and [Int] with aliases render as expected

extension TestObject_Int_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Int.Result> = .query {
            $0.int(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:int}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Int.Result> = .query {
            $0.intArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:intArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Int.Result]> = .query {
            $0.ints(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:ints}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Int.Result]> = .query {
            $0.intsArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:intsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Int and [Int] render as expected

extension TestObject_Int_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Int.Result, Int.Result)> = .query {
            $0.int 
            $0.int 
        }
        XCTAssertEqual(query.render(), "{int,int}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Int.Result, Int.Result)> = .query {
            $0.intArgs(arguments: .testDefault) 
            $0.intArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{intArgs\(testArgs),intArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Int.Result], [Int.Result])> = .query {
            $0.ints 
            $0.ints 
        }
        XCTAssertEqual(query.render(), "{ints,ints}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Int.Result], [Int.Result])> = .query {
            $0.intsArgs(arguments: .testDefault) 
            $0.intsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{intsArgs\(testArgs),intsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Int and [Int]

extension TestObject_Int_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{int}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.intArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{intArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.ints 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{ints}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.intsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{intsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Int and [Int] can be selected on a sub-selection of Object

extension TestObject_Int_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.int 
                $0.int 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{int,int}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.intArgs(arguments: .testDefault) 
                $0.intArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{intArgs\(testArgs),intArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.ints 
                $0.ints 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{ints,ints}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.intsArgs(arguments: .testDefault) 
                $0.intsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{intsArgs\(testArgs),intsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Int and [Int] can be used at the top level of an operation

extension TestObject_Int_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.int 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{int}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.intArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{intArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.ints 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{ints}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.intsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{intsArgs\(testArgs)}")
    }
}
