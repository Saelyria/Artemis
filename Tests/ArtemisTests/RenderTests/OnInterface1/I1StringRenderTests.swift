import XCTest
@testable import Artemis

/**
 Test for selecting strings on a query where the field is declared on the first interface, ensuring they render the
 expected query string.
 */
final class I1StringRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.i1_string
        }
        XCTAssertEqual(query.render(), "{i1_string}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.i1_stringArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_stringArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.i1_strings
        }
        XCTAssertEqual(query.render(), "{i1_strings}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.i1_stringsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_stringsArgs\(testArgs)}")
    }
}

extension I1StringRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.i1_string(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_string}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.i1_stringArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_stringArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.i1_strings(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_strings}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.i1_stringsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_stringsArgs\(testArgs)}")
    }
}

extension I1StringRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Schema.Query, (String, String)> = .query {
            $0.i1_string
            $0.i1_string
        }
        XCTAssertEqual(query.render(), "{i1_string,i1_string}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Schema.Query, (String, String)> = .query {
            $0.i1_stringArgs(arguments: .testDefault)
            $0.i1_stringArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_stringArgs\(testArgs),i1_stringArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Schema.Query, ([String], [String])> = .query {
            $0.i1_strings
            $0.i1_strings
        }
        XCTAssertEqual(query.render(), "{i1_strings,i1_strings}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Schema.Query, ([String], [String])> = .query {
            $0.i1_stringsArgs(arguments: .testDefault)
            $0.i1_stringsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_stringsArgs\(testArgs),i1_stringsArgs\(testArgs)}")
    }
}

// MARK: -

extension I1StringRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_string
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_string}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_stringsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_strings
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_strings}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_stringsArgs\(testArgs)}}")
    }
}

extension I1StringRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_string(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_string}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_stringArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_stringArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_strings(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_strings}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_stringsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_stringsArgs\(testArgs)}}")
    }
}

extension I1StringRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_string
                $0.i1_string
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_string,i1_string}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_stringArgs(arguments: .testDefault)
                $0.i1_stringArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_stringArgs\(testArgs),i1_stringArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_strings
                $0.i1_strings
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_strings,i1_strings}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_stringsArgs(arguments: .testDefault)
                $0.i1_stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_stringsArgs\(testArgs),i1_stringsArgs\(testArgs)}}")
    }
}
