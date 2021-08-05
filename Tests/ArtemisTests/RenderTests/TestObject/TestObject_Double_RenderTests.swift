// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Double and [Double] render as expected

extension TestObject_Double_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.double 
        }
        XCTAssertEqual(query.render(), "{double}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.doubleArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{doubleArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.doubles 
        }
        XCTAssertEqual(query.render(), "{doubles}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.doublesArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{doublesArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Double and [Double] with aliases render as expected

extension TestObject_Double_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.double(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:double}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Double.Result> = .query {
            $0.doubleArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:doubleArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.doubles(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:doubles}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Double.Result]> = .query {
            $0.doublesArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:doublesArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Double and [Double] render as expected

extension TestObject_Double_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Double.Result, Double.Result)> = .query {
            $0.double 
            $0.double 
        }
        XCTAssertEqual(query.render(), "{double,double}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Double.Result, Double.Result)> = .query {
            $0.doubleArgs(arguments: .testDefault) 
            $0.doubleArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{doubleArgs\(testArgs),doubleArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Double.Result], [Double.Result])> = .query {
            $0.doubles 
            $0.doubles 
        }
        XCTAssertEqual(query.render(), "{doubles,doubles}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Double.Result], [Double.Result])> = .query {
            $0.doublesArgs(arguments: .testDefault) 
            $0.doublesArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{doublesArgs\(testArgs),doublesArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Double and [Double]

extension TestObject_Double_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.double 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{double}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doubleArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{doubleArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doubles 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{doubles}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doublesArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{doublesArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure aliases render as expected on sub-selections of Double and [Double]

extension TestObject_Double_RenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.double(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:double}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doubleArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:doubleArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doubles(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:doubles}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doublesArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:doublesArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Double and [Double] can be selected on a sub-selection of Object

extension TestObject_Double_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.double 
                $0.double 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{double,double}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doubleArgs(arguments: .testDefault) 
                $0.doubleArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{doubleArgs\(testArgs),doubleArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doubles 
                $0.doubles 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{doubles,doubles}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.doublesArgs(arguments: .testDefault) 
                $0.doublesArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{doublesArgs\(testArgs),doublesArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Double and [Double] can be used at the top level of an operation

extension TestObject_Double_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.double 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{double}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.doubleArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{doubleArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.doubles 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{doubles}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.doublesArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{doublesArgs\(testArgs)}")
    }
}
