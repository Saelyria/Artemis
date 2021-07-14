import XCTest
@testable import Artemis

/**
 Test for selecting ints on a query where the field is declared on the first interface, ensuring they render the
 expected query string.
 */
final class I1IntRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.i1_int
        }
        XCTAssertEqual(query.render(), "{i1_int}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.i1_intArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_intArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.i1_ints
        }
        XCTAssertEqual(query.render(), "{i1_ints}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.i1_intsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_intsArgs\(testArgs)}")
    }
}

extension I1IntRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.i1_int(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_int}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.i1_intArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_intArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.i1_ints(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_ints}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.i1_intsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_intsArgs\(testArgs)}")
    }
}

extension I1IntRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Schema.Query, (Int, Int)> = .query {
            $0.i1_int
            $0.i1_int
        }
        XCTAssertEqual(query.render(), "{i1_int,i1_int}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Schema.Query, (Int, Int)> = .query {
            $0.i1_intArgs(arguments: .testDefault)
            $0.i1_intArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_intArgs\(testArgs),i1_intArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Schema.Query, ([Int], [Int])> = .query {
            $0.i1_ints
            $0.i1_ints
        }
        XCTAssertEqual(query.render(), "{i1_ints,i1_ints}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Schema.Query, ([Int], [Int])> = .query {
            $0.i1_intsArgs(arguments: .testDefault)
            $0.i1_intsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_intsArgs\(testArgs),i1_intsArgs\(testArgs)}")
    }
}

// MARK: -

extension I1IntRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_int
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_int}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_intsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_intsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_ints
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_ints}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_intsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_intsArgs\(testArgs)}}")
    }
}

extension I1IntRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_int(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_int}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_intArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_intArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_ints(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_ints}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_intsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_intsArgs\(testArgs)}}")
    }
}

extension I1IntRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_int
                $0.i1_int
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_int,i1_int}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_intArgs(arguments: .testDefault)
                $0.i1_intArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_intArgs\(testArgs),i1_intArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_ints
                $0.i1_ints
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_ints,i1_ints}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_intsArgs(arguments: .testDefault)
                $0.i1_intsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_intsArgs\(testArgs),i1_intsArgs\(testArgs)}}")
    }
}
