import XCTest
@testable import Artemis

/**
 Test for selecting floats on a query, ensuring they render the expected query string.
 */
final class ObjectFloatRenderTests: XCTestCase { }

// MARK: - Tests to ensure single selections of Float and [Float] render as expected

extension ObjectFloatRenderTests {
    func testSingleRender() {
        let query: _Operation<Query, Float> = .query {
            $0.float
        }
        XCTAssertEqual(query.render(), "{float}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Float> = .query {
            $0.floatArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{floatArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.floats
        }
        XCTAssertEqual(query.render(), "{floats}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.floatsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Float and [Float] with aliases render as expected

extension ObjectFloatRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Float> = .query {
            $0.float(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:float}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Float> = .query {
            $0.floatArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:floatArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.floats(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:floats}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Float]> = .query {
            $0.floatsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Float and [Float] render as expected

extension ObjectFloatRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Float, Float)> = .query {
            $0.float
            $0.float
        }
        XCTAssertEqual(query.render(), "{float,float}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Float, Float)> = .query {
            $0.floatArgs(arguments: .testDefault)
            $0.floatArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{floatArgs\(testArgs),floatArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Float], [Float])> = .query {
            $0.floats
            $0.floats
        }
        XCTAssertEqual(query.render(), "{floats,floats}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Float], [Float])> = .query {
            $0.floatsArgs(arguments: .testDefault)
            $0.floatsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{floatsArgs\(testArgs),floatsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Float and [Float]

extension ObjectFloatRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.float
            }
        }
        XCTAssertEqual(query.render(), "{object{float}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.floatsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{floatsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.floats
            }
        }
        XCTAssertEqual(query.render(), "{object{floats}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.floatsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{floatsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure aliases render as expected on sub-selections of Float and [Float]

extension ObjectFloatRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.float(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:float}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.floatArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:floatArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.floats(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:floats}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.floatsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:floatsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Float and [Float] can be selected on a sub-selection of Object

extension ObjectFloatRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.float
                $0.float
            }
        }
        XCTAssertEqual(query.render(), "{object{float,float}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.floatArgs(arguments: .testDefault)
                $0.floatArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{floatArgs\(testArgs),floatArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.floats
                $0.floats
            }
        }
        XCTAssertEqual(query.render(), "{object{floats,floats}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.floatsArgs(arguments: .testDefault)
                $0.floatsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{floatsArgs\(testArgs),floatsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Float and [Float] can be used at the top level of an operation

extension ObjectFloatRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.float
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{float}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floatArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{floatArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floats
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{floats}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.floatsArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{floatsArgs\(testArgs)}")
    }
}
