// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of String and [String] render as expected

extension TestInterface1_String_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i1_string 
        }
        XCTAssertEqual(query.render(), "{i1_string}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i1_stringArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_stringArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i1_strings 
        }
        XCTAssertEqual(query.render(), "{i1_strings}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i1_stringsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_stringsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of String and [String] with aliases render as expected

extension TestInterface1_String_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i1_string(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i1_string}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, SelectionType.Result> = .query {
            $0.i1_stringArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i1_stringArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i1_strings(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:i1_strings}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [SelectionType.Result]> = .query {
            $0.i1_stringsArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:i1_stringsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of String and [String] render as expected

extension TestInterface1_String_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.i1_string 
            $0.i1_string 
        }
        XCTAssertEqual(query.render(), "{i1_string,i1_string}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (SelectionType.Result, SelectionType.Result)> = .query {
            $0.i1_stringArgs(arguments: .testDefault) 
            $0.i1_stringArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_stringArgs\(testArgs),i1_stringArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.i1_strings 
            $0.i1_strings 
        }
        XCTAssertEqual(query.render(), "{i1_strings,i1_strings}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([SelectionType.Result], [SelectionType.Result])> = .query {
            $0.i1_stringsArgs(arguments: .testDefault) 
            $0.i1_stringsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{i1_stringsArgs\(testArgs),i1_stringsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of String and [String]

extension TestInterface1_String_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_string 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_string}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_stringArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_stringArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_strings 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_strings}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_stringsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_stringsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure String and [String] can be selected on a sub-selection of Object

extension TestInterface1_String_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_string 
                $0.i1_string 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_string,i1_string}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_stringArgs(arguments: .testDefault) 
                $0.i1_stringArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_stringArgs\(testArgs),i1_stringArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_strings 
                $0.i1_strings 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_strings,i1_strings}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.i1_stringsArgs(arguments: .testDefault) 
                $0.i1_stringsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{i1_stringsArgs\(testArgs),i1_stringsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting String and [String] can be used at the top level of an operation

extension TestInterface1_String_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_string 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_string}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_stringArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_stringArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_strings 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_strings}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_stringsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_stringsArgs\(testArgs)}")
    }
}
