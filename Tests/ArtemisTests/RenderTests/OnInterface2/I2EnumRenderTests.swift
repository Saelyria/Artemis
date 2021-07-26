import XCTest
@testable import Artemis

/**
 Test for selecting enums on a query where the field is declared on the second interface, ensuring they render the
 expected query string.
 */
final class I2EnumRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.i2_enum
        }
        XCTAssertEqual(query.render(), "{i2_enum}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.i2_enumArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_enumArgs\(testArgs)}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.i2_enums
        }
        XCTAssertEqual(query.render(), "{i2_enums}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.i2_enumsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_enumsArgs\(testArgs)}")
    }
}

extension I2EnumRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.i2_enum(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_enum}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, TestEnum.Result> = .query {
            $0.i2_enumArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_enumArgs\(testArgs)}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.i2_enums(alias: "alias")
        }
        XCTAssertEqual(query.render(), "{alias:i2_enums}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [TestEnum.Result]> = .query {
            $0.i2_enumsArgs(alias: "alias", arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{alias:i2_enumsArgs\(testArgs)}")
    }
}

extension I2EnumRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (TestEnum.Result, TestEnum.Result)> = .query {
            $0.i2_enum
            $0.i2_enum
        }
        XCTAssertEqual(query.render(), "{i2_enum,i2_enum}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (TestEnum.Result, TestEnum.Result)> = .query {
            $0.i2_enumArgs(arguments: .testDefault)
            $0.i2_enumArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_enumArgs\(testArgs),i2_enumArgs\(testArgs)}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([TestEnum.Result], [TestEnum.Result])> = .query {
            $0.i2_enums
            $0.i2_enums
        }
        XCTAssertEqual(query.render(), "{i2_enums,i2_enums}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([TestEnum.Result], [TestEnum.Result])> = .query {
            $0.i2_enumsArgs(arguments: .testDefault)
            $0.i2_enumsArgs(arguments: .testDefault)
        }
        XCTAssertEqual(query.render(), "{i2_enumsArgs\(testArgs),i2_enumsArgs\(testArgs)}")
    }
}

// MARK: -

extension I2EnumRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enum
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_enum}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enumsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_enumsArgs\(testArgs)}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enums
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_enums}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enumsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_enumsArgs\(testArgs)}}")
    }
}

extension I2EnumRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enum(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_enum}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enumArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_enumArgs\(testArgs)}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enums(alias: "alias")
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_enums}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enumsArgs(alias: "alias", arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_enumsArgs\(testArgs)}}")
    }
}

extension I2EnumRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enum
                $0.i2_enum
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_enum,i2_enum}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enumArgs(arguments: .testDefault)
                $0.i2_enumArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_enumArgs\(testArgs),i2_enumArgs\(testArgs)}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enums
                $0.i2_enums
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_enums,i2_enums}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_enumsArgs(arguments: .testDefault)
                $0.i2_enumsArgs(arguments: .testDefault)
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_enumsArgs\(testArgs),i2_enumsArgs\(testArgs)}}")
    }
}

extension I2EnumRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_enum
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_enum}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_enumArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_enumArgs\(testArgs)}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_enums
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_enums}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_enumsArgs(arguments: .testDefault)
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_enumsArgs\(testArgs)}")
    }
}
