import XCTest
@testable import Artemis

/**
 Test for selecting bools on a query, ensuring they render the expected query string.
 */
final class ObjectBoolRenderTests: XCTestCase { }

// MARK: - Tests to ensure single selections of Bool and [Bool] render as expected

extension ObjectBoolRenderTests {
    func testSingleRender() {
        let query: _Operation<Query, Bool> = .query {
            $0.bool
        }
        XCTAssertEqual(query.render(), "{bool}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Bool> = .query {
            $0.boolArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{boolArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Bool]> = .query {
            $0.bools
        }
        XCTAssertEqual(query.render(), "{bools}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Bool]> = .query {
            $0.boolsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{boolsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure single selections of Bool and [Bool] with aliases render as expected

extension ObjectBoolRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Bool> = .query {
            $0.bool(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:bool}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Bool> = .query {
            $0.boolArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:boolArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Bool]> = .query {
            $0.bools(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:bools}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Bool]> = .query {
            $0.boolsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:boolsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure multiple sibling selections of Bool and [Bool] render as expected

extension ObjectBoolRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Bool, Bool)> = .query {
            $0.bool
            $0.bool
        }
        XCTAssertEqual(query.render(), "{bool,bool}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Bool, Bool)> = .query {
            $0.boolArgs(arguments: .testDefault)
            $0.boolArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{boolArgs\(testArgs),boolArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Bool], [Bool])> = .query {
            $0.bools
            $0.bools
        }
        XCTAssertEqual(query.render(), "{bools,bools}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Bool], [Bool])> = .query {
            $0.boolsArgs(arguments: .testDefault)
            $0.boolsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{boolsArgs\(testArgs),boolsArgs\(testArgs)}")
    }
}

// MARK: - Tests to ensure selections render as expected on selections of Bool and [Bool]

extension ObjectBoolRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.bool
            }
        }
        XCTAssertEqual(query.render(), "{object{bool}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.boolsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{boolsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.bools
            }
        }
        XCTAssertEqual(query.render(), "{object{bools}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.boolsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{boolsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure aliases render as expected on sub-selections of Bool and [Bool]

extension ObjectBoolRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.bool(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:bool}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.boolArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:boolArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.bools(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:bools}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.boolsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:boolsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure Bool and [Bool] can be selected on a sub-selection of Object

extension ObjectBoolRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.bool
                $0.bool
            }
        }
        XCTAssertEqual(query.render(), "{object{bool,bool}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.boolArgs(arguments: .testDefault)
                $0.boolArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{boolArgs\(testArgs),boolArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.bools
                $0.bools
            }
        }
        XCTAssertEqual(query.render(), "{object{bools,bools}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.boolsArgs(arguments: .testDefault)
                $0.boolsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{boolsArgs\(testArgs),boolsArgs\(testArgs)}}")
    }
}

// MARK: - Tests to ensure fragments on Query selecting Bool and [Bool] can be used at the top level of an operation

extension ObjectBoolRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.bool
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{bool}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.boolArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{boolArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.bools
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{bools}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.boolsArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{boolsArgs\(testArgs)}")
    }
}
