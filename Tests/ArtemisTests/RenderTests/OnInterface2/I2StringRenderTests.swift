import XCTest
@testable import Artemis

/**
 Test for selecting strings on a query where the field is declared on the second interface, ensuring they render the
 expected query string.
 */
final class I2StringRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.i2_string
        }
        XCTAssertEqual(query.render(), "{i2_string}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.i2_stringArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_stringArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.i2_strings
        }
        XCTAssertEqual(query.render(), "{i2_strings}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.i2_stringsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_stringsArgs\(testArgs)}")
    }
}

extension I2StringRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.i2_string(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_string}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Schema.Query, String> = .query {
            $0.i2_stringArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_stringArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.i2_strings(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_strings}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Schema.Query, [String]> = .query {
            $0.i2_stringsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_stringsArgs\(testArgs)}")
    }
}

extension I2StringRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Schema.Query, (String, String)> = .query {
            $0.i2_string
            $0.i2_string
        }
        XCTAssertEqual(query.render(), "{i2_string,i2_string}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Schema.Query, (String, String)> = .query {
            $0.i2_stringArgs(arguments: .testDefault)
            $0.i2_stringArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_stringArgs\(testArgs),i2_stringArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Schema.Query, ([String], [String])> = .query {
            $0.i2_strings
            $0.i2_strings
        }
        XCTAssertEqual(query.render(), "{i2_strings,i2_strings}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Schema.Query, ([String], [String])> = .query {
            $0.i2_stringsArgs(arguments: .testDefault)
            $0.i2_stringsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_stringsArgs\(testArgs),i2_stringsArgs\(testArgs)}")
    }
}

// MARK: -

extension I2StringRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_string
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_string}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_stringsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_strings
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_strings}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_stringsArgs\(testArgs)}}")
    }
}

extension I2StringRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_string(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_string}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_stringArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_stringArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_strings(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_strings}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_stringsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_stringsArgs\(testArgs)}}")
    }
}

extension I2StringRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_string
                $0.i2_string
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_string,i2_string}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_stringArgs(arguments: .testDefault)
                $0.i2_stringArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_stringArgs\(testArgs),i2_stringArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_strings
                $0.i2_strings
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_strings,i2_strings}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_stringsArgs(arguments: .testDefault)
                $0.i2_stringsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_stringsArgs\(testArgs),i2_stringsArgs\(testArgs)}}")
    }
}
