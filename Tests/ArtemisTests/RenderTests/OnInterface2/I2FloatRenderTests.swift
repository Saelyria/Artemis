import XCTest
@testable import Artemis

/**
 Test for selecting floats on a query where the field is declared on the second interface, ensuring they render the
 expected query string.
 */
final class I2FloatRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Query, Float> = .query {
            $0.i2_float
        }
        XCTAssertEqual(query.render(), "{i2_float}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Float> = .query {
            $0.i2_floatArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_floatArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.i2_floats
        }
        XCTAssertEqual(query.render(), "{i2_floats}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.i2_floatsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_floatsArgs\(testArgs)}")
    }
}

extension I2FloatRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Float> = .query {
            $0.i2_float(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_float}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Float> = .query {
            $0.i2_floatArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_floatArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.i2_floats(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_floats}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.i2_floatsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_floatsArgs\(testArgs)}")
    }
}

extension I2FloatRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Float, Float)> = .query {
            $0.i2_float
            $0.i2_float
        }
        XCTAssertEqual(query.render(), "{i2_float,i2_float}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Float, Float)> = .query {
            $0.i2_floatArgs(arguments: .testDefault)
            $0.i2_floatArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_floatArgs\(testArgs),i2_floatArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Float], [Float])> = .query {
            $0.i2_floats
            $0.i2_floats
        }
        XCTAssertEqual(query.render(), "{i2_floats,i2_floats}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Float], [Float])> = .query {
            $0.i2_floatsArgs(arguments: .testDefault)
            $0.i2_floatsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_floatsArgs\(testArgs),i2_floatsArgs\(testArgs)}")
    }
}

// MARK: -

extension I2FloatRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_float
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_float}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_floatsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_floatsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_floats
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_floats}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_floatsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_floatsArgs\(testArgs)}}")
    }
}

extension I2FloatRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_float(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_float}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_floatArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_floatArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_floats(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_floats}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_floatsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_floatsArgs\(testArgs)}}")
    }
}

extension I2FloatRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_float
                $0.i2_float
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_float,i2_float}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_floatArgs(arguments: .testDefault)
                $0.i2_floatArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_floatArgs\(testArgs),i2_floatArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_floats
                $0.i2_floats
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_floats,i2_floats}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_floatsArgs(arguments: .testDefault)
                $0.i2_floatsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_floatsArgs\(testArgs),i2_floatsArgs\(testArgs)}}")
    }
}

extension I2FloatRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_float
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_float}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_floatArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_floatArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_floats
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_floats}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_floatsArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_floatsArgs\(testArgs)}")
    }
}
