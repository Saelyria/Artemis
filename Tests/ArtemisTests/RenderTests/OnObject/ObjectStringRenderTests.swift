import XCTest
@testable import Artemis

/**
 Test for selecting strings on a query, ensuring they render the expected query string.
 */
final class ObjectStringRenderTests: XCTestCase, RenderTestCase {
    typealias SelectionType = String
    typealias SelectionBase = TestObject
}

// MARK: - Tests to ensure single selections of String and [String] render as expected

extension ObjectStringRenderTests {
    func testSingleRender() {
        let query: _Operation<Query, String> = .query {
            $0.string
        }
        XCTAssertEqual(query.render(), "{string}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, String> = .query {
            $0.stringArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{stringArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [String]> = .query {
            $0.strings
        }
        XCTAssertEqual(query.render(), "{strings}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [String]> = .query {
            $0.stringsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{stringsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of String and [String] with aliases render as expected

extension ObjectStringRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, String> = .query {
            $0.string(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:string}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, String> = .query {
            $0.stringArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:stringArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [String]> = .query {
            $0.strings(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:strings}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [String]> = .query {
            $0.stringsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:stringsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of String and [String] render as expected

extension ObjectStringRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (String, String)> = .query {
            $0.string
            $0.string
        }
        XCTAssertEqual(query.render(), "{string,string}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (String, String)> = .query {
            $0.stringArgs(arguments: .testDefault)
            $0.stringArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{stringArgs\(testArgs),stringArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([String], [String])> = .query {
            $0.strings
            $0.strings
        }
        XCTAssertEqual(query.render(), "{strings,strings}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([String], [String])> = .query {
            $0.stringsArgs(arguments: .testDefault)
            $0.stringsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{stringsArgs\(testArgs),stringsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of String and [String]

extension ObjectStringRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.string
            }
        }
        XCTAssertEqual(query.render(), "{object{string}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{stringsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.strings
            }
        }
        XCTAssertEqual(query.render(), "{object{strings}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{stringsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure aliases render as expected on sub-selections of String and [String]

extension ObjectStringRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.string(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:string}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.stringArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:stringArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.strings(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:strings}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.stringsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:stringsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure String and [String] can be selected on a sub-selection of Object

extension ObjectStringRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.string
                $0.string
            }
        }
        XCTAssertEqual(query.render(), "{object{string,string}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.stringArgs(arguments: .testDefault)
                $0.stringArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{stringArgs\(testArgs),stringArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.strings
                $0.strings
            }
        }
        XCTAssertEqual(query.render(), "{object{strings,strings}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.stringsArgs(arguments: .testDefault)
                $0.stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{stringsArgs\(testArgs),stringsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting String and [String] can be used at the top level of an operation

extension ObjectStringRenderTests {
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
