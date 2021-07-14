import XCTest
@testable import Artemis

/**
 Test for selecting doubles on a query, ensuring they render the expected query string.
 */
final class ObjectDoubleRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Schema.Query, Double> = .query {
            $0.double
        }
        XCTAssertEqual(query.render(), "{double}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Schema.Query, Double> = .query {
            $0.doubleArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{doubleArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Schema.Query, [Double]> = .query {
            $0.doubles
        }
        XCTAssertEqual(query.render(), "{doubles}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Schema.Query, [Double]> = .query {
            $0.doublesArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{doublesArgs\(testArgs)}")
    }
}

extension ObjectDoubleRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Schema.Query, Double> = .query {
            $0.double(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:double}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Schema.Query, Double> = .query {
            $0.doubleArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:doubleArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Schema.Query, [Double]> = .query {
            $0.doubles(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:doubles}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Schema.Query, [Double]> = .query {
            $0.doublesArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:doublesArgs\(testArgs)}")
    }
}

extension ObjectDoubleRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Schema.Query, (Double, Double)> = .query {
            $0.double
            $0.double
        }
        XCTAssertEqual(query.render(), "{double,double}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Schema.Query, (Double, Double)> = .query {
            $0.doubleArgs(arguments: .testDefault)
            $0.doubleArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{doubleArgs\(testArgs),doubleArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Schema.Query, ([Double], [Double])> = .query {
            $0.doubles
            $0.doubles
        }
        XCTAssertEqual(query.render(), "{doubles,doubles}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Schema.Query, ([Double], [Double])> = .query {
            $0.doublesArgs(arguments: .testDefault)
            $0.doublesArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{doublesArgs\(testArgs),doublesArgs\(testArgs)}")
    }
}

// MARK: -

extension ObjectDoubleRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.double
            }
        }
        XCTAssertEqual(query.render(), "{object{double}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.doublesArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{doublesArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.doubles
            }
        }
        XCTAssertEqual(query.render(), "{object{doubles}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.doublesArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{doublesArgs\(testArgs)}}")
    }
}

extension ObjectDoubleRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.double(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:double}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.doubleArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:doubleArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.doubles(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:doubles}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.doublesArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:doublesArgs\(testArgs)}}")
    }
}

extension ObjectDoubleRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.double
                $0.double
            }
        }
        XCTAssertEqual(query.render(), "{object{double,double}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.doubleArgs(arguments: .testDefault)
                $0.doubleArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{doubleArgs\(testArgs),doubleArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.doubles
                $0.doubles
            }
        }
        XCTAssertEqual(query.render(), "{object{doubles,doubles}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.doublesArgs(arguments: .testDefault)
                $0.doublesArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{doublesArgs\(testArgs),doublesArgs\(testArgs)}}")
    }
}

extension ObjectDoubleRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.double
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{double}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.doubleArgs(arguments: .testDefault)
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{doubleArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.doubles
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{doubles}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.doublesArgs(arguments: .testDefault)
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{doublesArgs\(testArgs)}")
    }
}
