// Generated using Sourcery 1.5.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Artemis

// MARK: - Tests to ensure single selections of String and [String] render as expected

extension TestObject_String_RenderTests {
    func testSingleRender() {
        let query: _Operation<Query, String.Result> = .query {
            $0.string 
        }
        XCTAssertEqual(query.render(), "{string}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, String.Result> = .query {
            $0.stringArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{stringArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [String.Result]> = .query {
            $0.strings 
        }
        XCTAssertEqual(query.render(), "{strings}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [String.Result]> = .query {
            $0.stringsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{stringsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of String and [String] with aliases render as expected

extension TestObject_String_RenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, String.Result> = .query {
            $0.string(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:string}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, String.Result> = .query {
            $0.stringArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:stringArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [String.Result]> = .query {
            $0.strings(alias: "alias") 
        }
        XCTAssertEqual(query.render(), "{alias:strings}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [String.Result]> = .query {
            $0.stringsArgs(alias: "alias", arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{alias:stringsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of String and [String] render as expected

extension TestObject_String_RenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (String.Result, String.Result)> = .query {
            $0.string 
            $0.string 
        }
        XCTAssertEqual(query.render(), "{string,string}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (String.Result, String.Result)> = .query {
            $0.stringArgs(arguments: .testDefault) 
            $0.stringArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{stringArgs\(testArgs),stringArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([String.Result], [String.Result])> = .query {
            $0.strings 
            $0.strings 
        }
        XCTAssertEqual(query.render(), "{strings,strings}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([String.Result], [String.Result])> = .query {
            $0.stringsArgs(arguments: .testDefault) 
            $0.stringsArgs(arguments: .testDefault) 
        }
        XCTAssertEqual(query.render(), "{stringsArgs\(testArgs),stringsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of String and [String]

extension TestObject_String_RenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.string 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{string}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.stringArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{stringArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.strings 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{strings}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.stringsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{stringsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure aliases render as expected on sub-selections of String and [String]

extension TestObject_String_RenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.string(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:string}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.stringArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:stringArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.strings(alias: "alias") 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:strings}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.stringsArgs(alias: "alias", arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{alias:stringsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure String and [String] can be selected on a sub-selection of Object

extension TestObject_String_RenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.string 
                $0.string 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{string,string}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.stringArgs(arguments: .testDefault) 
                $0.stringArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{stringArgs\(testArgs),stringArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.strings 
                $0.strings 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{strings,strings}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.testObject {
                $0.stringsArgs(arguments: .testDefault) 
                $0.stringsArgs(arguments: .testDefault) 
            }
        }
        XCTAssertEqual(query.render(), "{testObject{stringsArgs\(testArgs),stringsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting String and [String] can be used at the top level of an operation

extension TestObject_String_RenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.string 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{string}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.stringArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{stringArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.strings 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{strings}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.stringsArgs(arguments: .testDefault) 
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{stringsArgs\(testArgs)}")
    }
}
