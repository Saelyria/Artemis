import XCTest
@testable import Artemis

/**
 Test for selecting enums on a query where the field is declared on the first interface, ensuring they render the
 expected query string.
 */
final class I1EnumRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Schema.Query, Schema.TestEnum.Result> = .query {
            $0.i1_enum
        }
        XCTAssertEqual(query.render(), "{i1_enum}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Schema.Query, Schema.TestEnum.Result> = .query {
            $0.i1_enumArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_enumArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Schema.Query, [Schema.TestEnum.Result]> = .query {
            $0.i1_enums
        }
        XCTAssertEqual(query.render(), "{i1_enums}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Schema.Query, [Schema.TestEnum.Result]> = .query {
            $0.i1_enumsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_enumsArgs\(testArgs)}")
    }
}

extension I1EnumRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Schema.Query, Schema.TestEnum.Result> = .query {
            $0.i1_enum(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_enum}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Schema.Query, Schema.TestEnum.Result> = .query {
            $0.i1_enumArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_enumArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Schema.Query, [Schema.TestEnum.Result]> = .query {
            $0.i1_enums(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i1_enums}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Schema.Query, [Schema.TestEnum.Result]> = .query {
            $0.i1_enumsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i1_enumsArgs\(testArgs)}")
    }
}

extension I1EnumRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Schema.Query, (Schema.TestEnum.Result, Schema.TestEnum.Result)> = .query {
            $0.i1_enum
            $0.i1_enum
        }
        XCTAssertEqual(query.render(), "{i1_enum,i1_enum}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Schema.Query, (Schema.TestEnum.Result, Schema.TestEnum.Result)> = .query {
            $0.i1_enumArgs(arguments: .testDefault)
            $0.i1_enumArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_enumArgs\(testArgs),i1_enumArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Schema.Query, ([Schema.TestEnum.Result], [Schema.TestEnum.Result])> = .query {
            $0.i1_enums
            $0.i1_enums
        }
        XCTAssertEqual(query.render(), "{i1_enums,i1_enums}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Schema.Query, ([Schema.TestEnum.Result], [Schema.TestEnum.Result])> = .query {
            $0.i1_enumsArgs(arguments: .testDefault)
            $0.i1_enumsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i1_enumsArgs\(testArgs),i1_enumsArgs\(testArgs)}")
    }
}

// MARK: -

extension I1EnumRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enum
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_enum}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enumsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_enumsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enums
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_enums}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enumsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_enumsArgs\(testArgs)}}")
    }
}

extension I1EnumRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enum(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_enum}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enumArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_enumArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enums(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_enums}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enumsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_enumsArgs\(testArgs)}}")
    }
}

extension I1EnumRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enum
                $0.i1_enum
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_enum,i1_enum}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enumArgs(arguments: .testDefault)
                $0.i1_enumArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_enumArgs\(testArgs),i1_enumArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enums
                $0.i1_enums
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_enums,i1_enums}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.i1_enumsArgs(arguments: .testDefault)
                $0.i1_enumsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_enumsArgs\(testArgs),i1_enumsArgs\(testArgs)}}")
    }
}
