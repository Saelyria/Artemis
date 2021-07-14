import XCTest
@testable import Artemis

/**
 Test for selecting ints on a query, ensuring they render the expected query string.
 */
final class ObjectIntRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.int
        }
        XCTAssertEqual(query.render(), "{int}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.intArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{intArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.ints
        }
        XCTAssertEqual(query.render(), "{ints}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.intsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{intsArgs\(testArgs)}")
    }
}

extension ObjectIntRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.int(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:int}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.intArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:intArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.ints(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:ints}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.intsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:intsArgs\(testArgs)}")
    }
}

extension ObjectIntRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Schema.Query, (Int, Int)> = .query {
            $0.int
            $0.int
        }
        XCTAssertEqual(query.render(), "{int,int}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Schema.Query, (Int, Int)> = .query {
            $0.intArgs(arguments: .testDefault)
            $0.intArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{intArgs\(testArgs),intArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Schema.Query, ([Int], [Int])> = .query {
            $0.ints
            $0.ints
        }
        XCTAssertEqual(query.render(), "{ints,ints}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Schema.Query, ([Int], [Int])> = .query {
            $0.intsArgs(arguments: .testDefault)
            $0.intsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{intsArgs\(testArgs),intsArgs\(testArgs)}")
    }
}

// MARK: -

extension ObjectIntRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.int
            }
        }
        XCTAssertEqual(query.render(), "{object{int}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.intsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{intsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.ints
            }
        }
        XCTAssertEqual(query.render(), "{object{ints}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.intsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{intsArgs\(testArgs)}}")
    }
}

extension ObjectIntRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.int(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:int}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.intArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:intArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.ints(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:ints}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.intsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:intsArgs\(testArgs)}}")
    }
}

extension ObjectIntRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.int
                $0.int
            }
        }
        XCTAssertEqual(query.render(), "{object{int,int}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.intArgs(arguments: .testDefault)
                $0.intArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{intArgs\(testArgs),intArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.ints
                $0.ints
            }
        }
        XCTAssertEqual(query.render(), "{object{ints,ints}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.intsArgs(arguments: .testDefault)
                $0.intsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{intsArgs\(testArgs),intsArgs\(testArgs)}}")
    }
}

extension ObjectIntRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.int
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{int}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.intArgs(arguments: .testDefault)
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{intArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.ints
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{ints}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.intsArgs(arguments: .testDefault)
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{intsArgs\(testArgs)}")
    }
}
