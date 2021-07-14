import XCTest
@testable import Artemis

/**
 Test for selecting doubles on a query where the field is declared on the second interface, ensuring they render the
 expected query string.
 */
final class I2DoubleRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Schema.Query, Double> = .query {
            $0.i2_double
        }
        XCTAssertEqual(query.render(), "{i2_double}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Schema.Query, Double> = .query {
            $0.i2_doubleArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_doubleArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Schema.Query, [Double]> = .query {
            $0.i2_doubles
        }
        XCTAssertEqual(query.render(), "{i2_doubles}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Schema.Query, [Double]> = .query {
            $0.i2_doublesArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_doublesArgs\(testArgs)}")
    }
}

extension I2DoubleRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Schema.Query, Double> = .query {
            $0.i2_double(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_double}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Schema.Query, Double> = .query {
            $0.i2_doubleArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_doubleArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Schema.Query, [Double]> = .query {
            $0.i2_doubles(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_doubles}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Schema.Query, [Double]> = .query {
            $0.i2_doublesArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_doublesArgs\(testArgs)}")
    }
}

extension I2DoubleRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Schema.Query, (Double, Double)> = .query {
            $0.i2_double
            $0.i2_double
        }
        XCTAssertEqual(query.render(), "{i2_double,i2_double}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Schema.Query, (Double, Double)> = .query {
            $0.i2_doubleArgs(arguments: .testDefault)
            $0.i2_doubleArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_doubleArgs\(testArgs),i2_doubleArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Schema.Query, ([Double], [Double])> = .query {
            $0.i2_doubles
            $0.i2_doubles
        }
        XCTAssertEqual(query.render(), "{i2_doubles,i2_doubles}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Schema.Query, ([Double], [Double])> = .query {
            $0.i2_doublesArgs(arguments: .testDefault)
            $0.i2_doublesArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_doublesArgs\(testArgs),i2_doublesArgs\(testArgs)}")
    }
}

// MARK: -

extension I2DoubleRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_double
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_double}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_doublesArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_doublesArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_doubles
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_doubles}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_doublesArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_doublesArgs\(testArgs)}}")
    }
}

extension I2DoubleRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_double(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_double}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_doubleArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_doubleArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_doubles(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_doubles}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_doublesArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_doublesArgs\(testArgs)}}")
    }
}

extension I2DoubleRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_double
                $0.i2_double
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_double,i2_double}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_doubleArgs(arguments: .testDefault)
                $0.i2_doubleArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_doubleArgs\(testArgs),i2_doubleArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_doubles
                $0.i2_doubles
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_doubles,i2_doubles}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i2_doublesArgs(arguments: .testDefault)
                $0.i2_doublesArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_doublesArgs\(testArgs),i2_doublesArgs\(testArgs)}}")
    }
}
