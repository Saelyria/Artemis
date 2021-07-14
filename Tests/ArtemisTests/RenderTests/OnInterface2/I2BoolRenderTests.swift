import XCTest
@testable import Artemis

/**
 Test for selecting bools on a query where the field is declared on the second interface, ensuring they render the
 expected query string.
 */
final class I2BoolRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Schema.Query, Bool> = .query {
            $0.i2_bool
        }
        XCTAssertEqual(query.render(), "{i2_bool}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Schema.Query, Bool> = .query {
            $0.i2_boolArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_boolArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Schema.Query, [Bool]> = .query {
            $0.i2_bools
        }
        XCTAssertEqual(query.render(), "{i2_bools}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Schema.Query, [Bool]> = .query {
            $0.i2_boolsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_boolsArgs\(testArgs)}")
    }
}

extension I2BoolRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Schema.Query, Bool> = .query {
            $0.i2_bool(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_bool}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Schema.Query, Bool> = .query {
            $0.i2_boolArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_boolArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Schema.Query, [Bool]> = .query {
            $0.i2_bools(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_bools}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Schema.Query, [Bool]> = .query {
            $0.i2_boolsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_boolsArgs\(testArgs)}")
    }
}

extension I2BoolRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Schema.Query, (Bool, Bool)> = .query {
            $0.i2_bool
            $0.i2_bool
        }
        XCTAssertEqual(query.render(), "{i2_bool,i2_bool}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Schema.Query, (Bool, Bool)> = .query {
            $0.i2_boolArgs(arguments: .testDefault)
            $0.i2_boolArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_boolArgs\(testArgs),i2_boolArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Schema.Query, ([Bool], [Bool])> = .query {
            $0.i2_bools
            $0.i2_bools
        }
        XCTAssertEqual(query.render(), "{i2_bools,i2_bools}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Schema.Query, ([Bool], [Bool])> = .query {
            $0.i2_boolsArgs(arguments: .testDefault)
            $0.i2_boolsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_boolsArgs\(testArgs),i2_boolsArgs\(testArgs)}")
    }
}

// MARK: -

extension I2BoolRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_bool
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_bool}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_boolsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_boolsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_bools
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_bools}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_boolsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_boolsArgs\(testArgs)}}")
    }
}

extension I2BoolRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_bool(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_bool}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_boolArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_boolArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_bools(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_bools}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_boolsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_boolsArgs\(testArgs)}}")
    }
}

extension I2BoolRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_bool
                $0.i2_bool
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_bool,i2_bool}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_boolArgs(arguments: .testDefault)
                $0.i2_boolArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_boolArgs\(testArgs),i2_boolArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_bools
                $0.i2_bools
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_bools,i2_bools}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_boolsArgs(arguments: .testDefault)
                $0.i2_boolsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_boolsArgs\(testArgs),i2_boolsArgs\(testArgs)}}")
    }
}
