// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Double and [Double] render as expected

extension TestInterface1_Double_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.i1_double 
        }
        XCTAssertEqual(query.render(), "{i1_double}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.i1_doubleArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_doubleArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.i1_doubles 
        }
        XCTAssertEqual(query.render(), "{i1_doubles}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.i1_doublesArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_doublesArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Double and [Double] with aliases render as expected

extension TestInterface1_Double_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.i1_double(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i1_double}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.i1_doubleArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i1_doubleArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.i1_doubles(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i1_doubles}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.i1_doublesArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i1_doublesArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Double and [Double] render as expected

extension TestInterface1_Double_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Double.Result, Double.Result)> = .query {
            $0.i1_double 
            $0.i1_double 
        }
        XCTAssertEqual(query.render(), "{i1_double,i1_double}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Double.Result, Double.Result)> = .query {
            $0.i1_doubleArgs(arguments: .testDefault) 
            $0.i1_doubleArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_doubleArgs\(testArgs),i1_doubleArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Double.Result], [Double.Result])> = .query {
            $0.i1_doubles 
            $0.i1_doubles 
        }
        XCTAssertEqual(query.render(), "{i1_doubles,i1_doubles}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Double.Result], [Double.Result])> = .query {
            $0.i1_doublesArgs(arguments: .testDefault) 
            $0.i1_doublesArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_doublesArgs\(testArgs),i1_doublesArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Double and [Double]

extension TestInterface1_Double_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_double 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_double}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doubleArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_doubleArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doubles 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_doubles}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doublesArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_doublesArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure aliases render as expected on sub-selections of Double and [Double]

extension TestInterface1_Double_RenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_double(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i1_double}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doubleArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i1_doubleArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doubles(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i1_doubles}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doublesArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i1_doublesArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Double and [Double] can be selected on a sub-selection of Object

extension TestInterface1_Double_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_double 
                $0.i1_double 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_double,i1_double}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doubleArgs(arguments: .testDefault) 
                $0.i1_doubleArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_doubleArgs\(testArgs),i1_doubleArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doubles 
                $0.i1_doubles 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_doubles,i1_doubles}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_doublesArgs(arguments: .testDefault) 
                $0.i1_doublesArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_doublesArgs\(testArgs),i1_doublesArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Double and [Double] can be used at the top level of an operation

extension TestInterface1_Double_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_double 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_double}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_doubleArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_doubleArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_doubles 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_doubles}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_doublesArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_doublesArgs\(testArgs)}")
    }
}
