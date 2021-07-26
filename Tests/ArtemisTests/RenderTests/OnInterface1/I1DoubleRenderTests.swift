import XCTest
@testable import Artemis

/**
 Test for selecting doubles on a query where the field is declared on the second interface, ensuring they render the
 expected query string.
 */
final class I1DoubleRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Query, Double> = .query {
            $0.i1_double
        }
        XCTAssertEqual(query.render(), "{i1_double}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Double> = .query {
            $0.i1_doubleArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_doubleArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Double]> = .query {
            $0.i1_doubles
        }
        XCTAssertEqual(query.render(), "{i1_doubles}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Double]> = .query {
            $0.i1_doublesArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_doublesArgs\(testArgs)}")
    }
}

extension I1DoubleRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Double> = .query {
            $0.i1_double(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_double}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Double> = .query {
            $0.i1_doubleArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_doubleArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Double]> = .query {
            $0.i1_doubles(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_doubles}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Double]> = .query {
            $0.i1_doublesArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_doublesArgs\(testArgs)}")
    }
}

extension I1DoubleRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Double, Double)> = .query {
            $0.i1_double
            $0.i1_double
        }
        XCTAssertEqual(query.render(), "{i1_double,i1_double}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Double, Double)> = .query {
            $0.i1_doubleArgs(arguments: .testDefault)
            $0.i1_doubleArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_doubleArgs\(testArgs),i1_doubleArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Double], [Double])> = .query {
            $0.i1_doubles
            $0.i1_doubles
        }
        XCTAssertEqual(query.render(), "{i1_doubles,i1_doubles}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Double], [Double])> = .query {
            $0.i1_doublesArgs(arguments: .testDefault)
            $0.i1_doublesArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_doublesArgs\(testArgs),i1_doublesArgs\(testArgs)}")
    }
}

// MARK: -

extension I1DoubleRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_double
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_double}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_doublesArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_doublesArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_doubles
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_doubles}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_doublesArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_doublesArgs\(testArgs)}}")
    }
}

extension I1DoubleRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_double(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_double}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_doubleArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_doubleArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_doubles(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_doubles}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_doublesArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_doublesArgs\(testArgs)}}")
    }
}

extension I1DoubleRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_double
                $0.i1_double
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_double,i1_double}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_doubleArgs(arguments: .testDefault)
                $0.i1_doubleArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_doubleArgs\(testArgs),i1_doubleArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_doubles
                $0.i1_doubles
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_doubles,i1_doubles}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_doublesArgs(arguments: .testDefault)
                $0.i1_doublesArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_doublesArgs\(testArgs),i1_doublesArgs\(testArgs)}}")
    }
}

extension I1DoubleRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_double
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_double}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_doubleArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_doubleArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_doubles
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_doubles}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_doublesArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_doublesArgs\(testArgs)}")
    }
}
