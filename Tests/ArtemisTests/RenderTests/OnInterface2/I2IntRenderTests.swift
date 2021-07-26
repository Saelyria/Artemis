import XCTest
@testable import Artemis

/**
 Test for selecting ints on a query where the field is declared on the second interface, ensuring they render the
 expected query string.
 */
final class I2IntRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Query, Int> = .query {
            $0.i2_int
        }
        XCTAssertEqual(query.render(), "{i2_int}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Int> = .query {
            $0.i2_intArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_intArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Int]> = .query {
            $0.i2_ints
        }
        XCTAssertEqual(query.render(), "{i2_ints}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Int]> = .query {
            $0.i2_intsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_intsArgs\(testArgs)}")
    }
}

extension I2IntRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Int> = .query {
            $0.i2_int(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_int}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Int> = .query {
            $0.i2_intArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_intArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Int]> = .query {
            $0.i2_ints(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_ints}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Int]> = .query {
            $0.i2_intsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_intsArgs\(testArgs)}")
    }
}

extension I2IntRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Int, Int)> = .query {
            $0.i2_int
            $0.i2_int
        }
        XCTAssertEqual(query.render(), "{i2_int,i2_int}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Int, Int)> = .query {
            $0.i2_intArgs(arguments: .testDefault)
            $0.i2_intArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_intArgs\(testArgs),i2_intArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Int], [Int])> = .query {
            $0.i2_ints
            $0.i2_ints
        }
        XCTAssertEqual(query.render(), "{i2_ints,i2_ints}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Int], [Int])> = .query {
            $0.i2_intsArgs(arguments: .testDefault)
            $0.i2_intsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_intsArgs\(testArgs),i2_intsArgs\(testArgs)}")
    }
}

// MARK: -

extension I2IntRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_int
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_int}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_intsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_intsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_ints
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_ints}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_intsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_intsArgs\(testArgs)}}")
    }
}

extension I2IntRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_int(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_int}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_intArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_intArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_ints(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_ints}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_intsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_intsArgs\(testArgs)}}")
    }
}

extension I2IntRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_int
                $0.i2_int
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_int,i2_int}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_intArgs(arguments: .testDefault)
                $0.i2_intArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_intArgs\(testArgs),i2_intArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_ints
                $0.i2_ints
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_ints,i2_ints}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_intsArgs(arguments: .testDefault)
                $0.i2_intsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_intsArgs\(testArgs),i2_intsArgs\(testArgs)}}")
    }
}

extension I2IntRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_int
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_int}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_intArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_intArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_ints
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_ints}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_intsArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_intsArgs\(testArgs)}")
    }
}
