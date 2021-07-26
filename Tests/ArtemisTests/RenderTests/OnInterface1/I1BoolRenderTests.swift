import XCTest
@testable import Artemis

/**
 Test for selecting bools on a query where the field is declared on the second interface, ensuring they render the
 expected query string.
 */
final class I1BoolRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Query, Bool> = .query {
            $0.i1_bool
        }
        XCTAssertEqual(query.render(), "{i1_bool}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Bool> = .query {
            $0.i1_boolArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_boolArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Bool]> = .query {
            $0.i1_bools
        }
        XCTAssertEqual(query.render(), "{i1_bools}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Bool]> = .query {
            $0.i1_boolsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_boolsArgs\(testArgs)}")
    }
}

extension I1BoolRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Bool> = .query {
            $0.i1_bool(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_bool}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Bool> = .query {
            $0.i1_boolArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_boolArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Bool]> = .query {
            $0.i1_bools(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_bools}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Bool]> = .query {
            $0.i1_boolsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_boolsArgs\(testArgs)}")
    }
}

extension I1BoolRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Bool, Bool)> = .query {
            $0.i1_bool
            $0.i1_bool
        }
        XCTAssertEqual(query.render(), "{i1_bool,i1_bool}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Bool, Bool)> = .query {
            $0.i1_boolArgs(arguments: .testDefault)
            $0.i1_boolArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_boolArgs\(testArgs),i1_boolArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Bool], [Bool])> = .query {
            $0.i1_bools
            $0.i1_bools
        }
        XCTAssertEqual(query.render(), "{i1_bools,i1_bools}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Bool], [Bool])> = .query {
            $0.i1_boolsArgs(arguments: .testDefault)
            $0.i1_boolsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_boolsArgs\(testArgs),i1_boolsArgs\(testArgs)}")
    }
}

// MARK: -

extension I1BoolRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_bool
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_bool}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_boolsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_boolsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_bools
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_bools}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_boolsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_boolsArgs\(testArgs)}}")
    }
}

extension I1BoolRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_bool(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_bool}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_boolArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_boolArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_bools(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_bools}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_boolsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_boolsArgs\(testArgs)}}")
    }
}

extension I1BoolRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_bool
                $0.i1_bool
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_bool,i1_bool}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_boolArgs(arguments: .testDefault)
                $0.i1_boolArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_boolArgs\(testArgs),i1_boolArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_bools
                $0.i1_bools
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_bools,i1_bools}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_boolsArgs(arguments: .testDefault)
                $0.i1_boolsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_boolsArgs\(testArgs),i1_boolsArgs\(testArgs)}}")
    }
}

extension I1BoolRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_bool
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_bool}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_boolArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_boolArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_bools
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_bools}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_boolsArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_boolsArgs\(testArgs)}")
    }
}
