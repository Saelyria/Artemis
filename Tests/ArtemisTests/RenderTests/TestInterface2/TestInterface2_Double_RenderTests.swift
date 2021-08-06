// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Double and [Double] render as expected

extension TestInterface2_Double_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.i2_double 
        }
        XCTAssertEqual(query.render(), "{i2_double}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.i2_doubleArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_doubleArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.i2_doubles 
        }
        XCTAssertEqual(query.render(), "{i2_doubles}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.i2_doublesArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_doublesArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Double and [Double] with aliases render as expected

extension TestInterface2_Double_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.i2_double(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i2_double}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.i2_doubleArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i2_doubleArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.i2_doubles(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i2_doubles}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.i2_doublesArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i2_doublesArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Double and [Double] render as expected

extension TestInterface2_Double_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Double.Result, Double.Result)> = .query {
            $0.i2_double 
            $0.i2_double 
        }
        XCTAssertEqual(query.render(), "{i2_double,i2_double}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Double.Result, Double.Result)> = .query {
            $0.i2_doubleArgs(arguments: .testDefault) 
            $0.i2_doubleArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_doubleArgs\(testArgs),i2_doubleArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Double.Result], [Double.Result])> = .query {
            $0.i2_doubles 
            $0.i2_doubles 
        }
        XCTAssertEqual(query.render(), "{i2_doubles,i2_doubles}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Double.Result], [Double.Result])> = .query {
            $0.i2_doublesArgs(arguments: .testDefault) 
            $0.i2_doublesArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_doublesArgs\(testArgs),i2_doublesArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Double and [Double]

extension TestInterface2_Double_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_double 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_double}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_doubleArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_doubleArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_doubles 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_doubles}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_doublesArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_doublesArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Double and [Double] can be selected on a sub-selection of Object

extension TestInterface2_Double_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_double 
                $0.i2_double 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_double,i2_double}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_doubleArgs(arguments: .testDefault) 
                $0.i2_doubleArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_doubleArgs\(testArgs),i2_doubleArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_doubles 
                $0.i2_doubles 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_doubles,i2_doubles}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_doublesArgs(arguments: .testDefault) 
                $0.i2_doublesArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_doublesArgs\(testArgs),i2_doublesArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Double and [Double] can be used at the top level of an operation

extension TestInterface2_Double_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_double 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_double}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_doubleArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_doubleArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_doubles 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_doubles}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_doublesArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_doublesArgs\(testArgs)}")
    }
}
