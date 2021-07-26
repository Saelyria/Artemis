import XCTest
@testable import Artemis

/**
 Test for selecting floats on a query where the field is declared on the second interface, ensuring they render the
 expected query string.
 */
final class I1FloatRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Query, Float> = .query {
            $0.i1_float
        }
        XCTAssertEqual(query.render(), "{i1_float}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Float> = .query {
            $0.i1_floatArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_floatArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.i1_floats
        }
        XCTAssertEqual(query.render(), "{i1_floats}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.i1_floatsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_floatsArgs\(testArgs)}")
    }
}

extension I1FloatRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Float> = .query {
            $0.i1_float(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_float}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Float> = .query {
            $0.i1_floatArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_floatArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.i1_floats(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_floats}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.i1_floatsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_floatsArgs\(testArgs)}")
    }
}

extension I1FloatRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Float, Float)> = .query {
            $0.i1_float
            $0.i1_float
        }
        XCTAssertEqual(query.render(), "{i1_float,i1_float}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Float, Float)> = .query {
            $0.i1_floatArgs(arguments: .testDefault)
            $0.i1_floatArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_floatArgs\(testArgs),i1_floatArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Float], [Float])> = .query {
            $0.i1_floats
            $0.i1_floats
        }
        XCTAssertEqual(query.render(), "{i1_floats,i1_floats}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Float], [Float])> = .query {
            $0.i1_floatsArgs(arguments: .testDefault)
            $0.i1_floatsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_floatsArgs\(testArgs),i1_floatsArgs\(testArgs)}")
    }
}

// MARK: -

extension I1FloatRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_float
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_float}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_floatsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_floatsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_floats
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_floats}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_floatsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_floatsArgs\(testArgs)}}")
    }
}

extension I1FloatRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_float(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_float}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_floatArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_floatArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_floats(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_floats}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_floatsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_floatsArgs\(testArgs)}}")
    }
}

extension I1FloatRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_float
                $0.i1_float
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_float,i1_float}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_floatArgs(arguments: .testDefault)
                $0.i1_floatArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_floatArgs\(testArgs),i1_floatArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_floats
                $0.i1_floats
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_floats,i1_floats}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_floatsArgs(arguments: .testDefault)
                $0.i1_floatsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_floatsArgs\(testArgs),i1_floatsArgs\(testArgs)}}")
    }
}

extension I1FloatRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_float
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_float}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_floatArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_floatArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_floats
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_floats}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_floatsArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_floatsArgs\(testArgs)}")
    }
}
