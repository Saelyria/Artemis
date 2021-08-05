// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of Float and [Float] render as expected

extension TestInterface2_Float_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, Float.Result> = .query {
            $0.i2_float 
        }
        XCTAssertEqual(query.render(), "{i2_float}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Float.Result> = .query {
            $0.i2_floatArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_floatArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Float.Result]> = .query {
            $0.i2_floats 
        }
        XCTAssertEqual(query.render(), "{i2_floats}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Float.Result]> = .query {
            $0.i2_floatsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Float and [Float] with aliases render as expected

extension TestInterface2_Float_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Float.Result> = .query {
            $0.i2_float(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i2_float}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Float.Result> = .query {
            $0.i2_floatArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i2_floatArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Float.Result]> = .query {
            $0.i2_floats(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i2_floats}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Float.Result]> = .query {
            $0.i2_floatsArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i2_floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Float and [Float] render as expected

extension TestInterface2_Float_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Float.Result, Float.Result)> = .query {
            $0.i2_float 
            $0.i2_float 
        }
        XCTAssertEqual(query.render(), "{i2_float,i2_float}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Float.Result, Float.Result)> = .query {
            $0.i2_floatArgs(arguments: .testDefault) 
            $0.i2_floatArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_floatArgs\(testArgs),i2_floatArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Float.Result], [Float.Result])> = .query {
            $0.i2_floats 
            $0.i2_floats 
        }
        XCTAssertEqual(query.render(), "{i2_floats,i2_floats}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Float.Result], [Float.Result])> = .query {
            $0.i2_floatsArgs(arguments: .testDefault) 
            $0.i2_floatsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i2_floatsArgs\(testArgs),i2_floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Float and [Float]

extension TestInterface2_Float_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_float 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_float}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floatArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_floatArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floats 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_floats}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floatsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_floatsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure aliases render as expected on sub-selections of Float and [Float]

extension TestInterface2_Float_RenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_float(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i2_float}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floatArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i2_floatArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floats(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i2_floats}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floatsArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:i2_floatsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Float and [Float] can be selected on a sub-selection of Object

extension TestInterface2_Float_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_float 
                $0.i2_float 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_float,i2_float}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floatArgs(arguments: .testDefault) 
                $0.i2_floatArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_floatArgs\(testArgs),i2_floatArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floats 
                $0.i2_floats 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_floats,i2_floats}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i2_floatsArgs(arguments: .testDefault) 
                $0.i2_floatsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i2_floatsArgs\(testArgs),i2_floatsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Float and [Float] can be used at the top level of an operation

extension TestInterface2_Float_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_float 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_float}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_floatArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_floatArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_floats 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_floats}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_floatsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_floatsArgs\(testArgs)}")
    }
}
