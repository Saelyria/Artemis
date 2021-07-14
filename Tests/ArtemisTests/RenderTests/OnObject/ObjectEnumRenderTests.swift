import XCTest
@testable import Artemis

/**
 Test for selecting enums on a query, ensuring they render the expected query string.
 */
final class ObjectEnumRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Schema.Query, Schema.TestEnum.Result> = .query {
            $0.enum
        }
        XCTAssertEqual(query.render(), "{enum}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Schema.Query, Schema.TestEnum.Result> = .query {
            $0.enumArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{enumArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Schema.Query, [Schema.TestEnum.Result]> = .query {
            $0.enums
        }
        XCTAssertEqual(query.render(), "{enums}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Schema.Query, [Schema.TestEnum.Result]> = .query {
            $0.enumsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{enumsArgs\(testArgs)}")
    }
}

extension ObjectEnumRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Schema.Query, Schema.TestEnum.Result> = .query {
            $0.enum(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:enum}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Schema.Query, Schema.TestEnum.Result> = .query {
            $0.enumArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:enumArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Schema.Query, [Schema.TestEnum.Result]> = .query {
            $0.enums(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:enums}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Schema.Query, [Schema.TestEnum.Result]> = .query {
            $0.enumsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:enumsArgs\(testArgs)}")
    }
}

extension ObjectEnumRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Schema.Query, (Schema.TestEnum.Result, Schema.TestEnum.Result)> = .query {
            $0.enum
            $0.enum
        }
        XCTAssertEqual(query.render(), "{enum,enum}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Schema.Query, (Schema.TestEnum.Result, Schema.TestEnum.Result)> = .query {
            $0.enumArgs(arguments: .testDefault)
            $0.enumArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{enumArgs\(testArgs),enumArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Schema.Query, ([Schema.TestEnum.Result], [Schema.TestEnum.Result])> = .query {
            $0.enums
            $0.enums
        }
        XCTAssertEqual(query.render(), "{enums,enums}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Schema.Query, ([Schema.TestEnum.Result], [Schema.TestEnum.Result])> = .query {
            $0.enumsArgs(arguments: .testDefault)
            $0.enumsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{enumsArgs\(testArgs),enumsArgs\(testArgs)}")
    }
}

// MARK: -

extension ObjectEnumRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enum
            }
        }
        XCTAssertEqual(query.render(), "{object{enum}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enumsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{enumsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enums
            }
        }
        XCTAssertEqual(query.render(), "{object{enums}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enumsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{enumsArgs\(testArgs)}}")
    }
}

extension ObjectEnumRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enum(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:enum}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enumArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:enumArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enums(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:enums}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enumsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:enumsArgs\(testArgs)}}")
    }
}

extension ObjectEnumRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enum
                $0.enum
            }
        }
        XCTAssertEqual(query.render(), "{object{enum,enum}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enumArgs(arguments: .testDefault)
                $0.enumArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{enumArgs\(testArgs),enumArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enums
                $0.enums
            }
        }
        XCTAssertEqual(query.render(), "{object{enums,enums}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.enumsArgs(arguments: .testDefault)
                $0.enumsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{enumsArgs\(testArgs),enumsArgs\(testArgs)}}")
    }
}

extension ObjectEnumRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.enum
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{enum}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.enumArgs(arguments: .testDefault)
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{enumArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.enums
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{enums}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.enumsArgs(arguments: .testDefault)
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{enumsArgs\(testArgs)}")
    }
}
