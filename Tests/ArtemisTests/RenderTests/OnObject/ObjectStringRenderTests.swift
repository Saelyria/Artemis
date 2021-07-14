import XCTest
@testable import Artemis

/**
 Test for selecting strings on a query, ensuring they render the expected query string.
 */
final class ObjectStringRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.string
        }
        XCTAssertEqual(query.render(), "{string}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.stringArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{stringArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.strings
        }
        XCTAssertEqual(query.render(), "{strings}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.stringsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{stringsArgs\(testArgs)}")
    }
}

extension ObjectStringRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.string(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:string}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.stringArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:stringArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.strings(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:strings}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.stringsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:stringsArgs\(testArgs)}")
    }
}

extension ObjectStringRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Schema.Query, (String, String)> = .query {
            $0.string
            $0.string
        }
        XCTAssertEqual(query.render(), "{string,string}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Schema.Query, (String, String)> = .query {
            $0.stringArgs(arguments: .testDefault)
            $0.stringArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{stringArgs\(testArgs),stringArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Schema.Query, ([String], [String])> = .query {
            $0.strings
            $0.strings
        }
        XCTAssertEqual(query.render(), "{strings,strings}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Schema.Query, ([String], [String])> = .query {
            $0.stringsArgs(arguments: .testDefault)
            $0.stringsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{stringsArgs\(testArgs),stringsArgs\(testArgs)}")
    }
}

// MARK: -

extension ObjectStringRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.string
            }
        }
        XCTAssertEqual(query.render(), "{object{string}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{stringsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.strings
            }
        }
        XCTAssertEqual(query.render(), "{object{strings}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{stringsArgs\(testArgs)}}")
    }
}

extension ObjectStringRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.string(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:string}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.stringArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:stringArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.strings(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:strings}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.stringsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:stringsArgs\(testArgs)}}")
    }
}

extension ObjectStringRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.string
                $0.string
            }
        }
        XCTAssertEqual(query.render(), "{object{string,string}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.stringArgs(arguments: .testDefault)
                $0.stringArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{stringArgs\(testArgs),stringArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.strings
                $0.strings
            }
        }
        XCTAssertEqual(query.render(), "{object{strings,strings}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.stringsArgs(arguments: .testDefault)
                $0.stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{stringsArgs\(testArgs),stringsArgs\(testArgs)}}")
    }
}

extension ObjectStringRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.TestObject.self) {
            $0.string
        }
        XCTAssertEqual(fragment.render(), "fragment fragName on TestObject{string}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.TestObject.self) {
            $0.stringArgs(arguments: .testDefault)
        }
        XCTAssertEqual(fragment.render(), "fragment fragName on TestObject{stringArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.TestObject.self) {
            $0.strings
        }
        XCTAssertEqual(fragment.render(), "fragment fragName on TestObject{strings}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.TestObject.self) {
            $0.stringsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(fragment.render(), "fragment fragName on TestObject{stringsArgs\(testArgs)}")
    }
}
