import XCTest
@testable import Artemis

/**
 Test for selecting objects on a query where the field is declared on the second interface, ensuring they render the
 expected query object.
 */
final class I2ObjectRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.i2_object { $0.int }
        }
        XCTAssertEqual(query.render(), "{i2_object{int}}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.i2_objectArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i2_objectArgs\(testArgs){int}}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Partial<TestObject>]> = .query {
            $0.i2_objects { $0.int }
        }
        XCTAssertEqual(query.render(), "{i2_objects{int}}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Partial<TestObject>]> = .query {
            $0.i2_objectsArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i2_objectsArgs\(testArgs){int}}")
    }
}

extension I2ObjectRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.i2_object(alias: "alias") { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i2_object{int}}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.i2_objectArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i2_objectArgs\(testArgs){int}}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Partial<TestObject>]> = .query {
            $0.i2_objects(alias: "alias") { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i2_objects{int}}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Partial<TestObject>]> = .query {
            $0.i2_objectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i2_objectsArgs\(testArgs){int}}")
    }
}

extension I2ObjectRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Partial<TestObject>, Partial<TestObject>)> = .query {
            $0.i2_object { $0.int }
            $0.i2_object { $0.int }
        }
        XCTAssertEqual(query.render(), "{i2_object{int},i2_object{int}}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Partial<TestObject>, Partial<TestObject>)> = .query {
            $0.i2_objectArgs(arguments: .testDefault) { $0.int }
            $0.i2_objectArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i2_objectArgs\(testArgs){int},i2_objectArgs\(testArgs){int}}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Partial<TestObject>], [Partial<TestObject>])> = .query {
            $0.i2_objects { $0.int }
            $0.i2_objects { $0.int }
        }
        XCTAssertEqual(query.render(), "{i2_objects{int},i2_objects{int}}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Partial<TestObject>], [Partial<TestObject>])> = .query {
            $0.i2_objectsArgs(arguments: .testDefault) { $0.int }
            $0.i2_objectsArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i2_objectsArgs\(testArgs){int},i2_objectsArgs\(testArgs){int}}")
    }
}

// MARK: -

extension I2ObjectRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_object { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_object{int}}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_objectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_objectsArgs\(testArgs){int}}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_objects { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_objects{int}}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_objectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_objectsArgs\(testArgs){int}}}")
    }
}

extension I2ObjectRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_object(alias: "alias") { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_object{int}}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_objectArgs(alias: "alias", arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_objectArgs\(testArgs){int}}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_objects(alias: "alias") { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_objects{int}}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_objectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i2_objectsArgs\(testArgs){int}}}")
    }
}

extension I2ObjectRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_object { $0.int }
                $0.i2_object { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_object{int},i2_object{int}}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_objectArgs(arguments: .testDefault) { $0.int }
                $0.i2_objectArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_objectArgs\(testArgs){int},i2_objectArgs\(testArgs){int}}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_objects { $0.int }
                $0.i2_objects { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_objects{int},i2_objects{int}}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i2_objectsArgs(arguments: .testDefault) { $0.int }
                $0.i2_objectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i2_objectsArgs\(testArgs){int},i2_objectsArgs\(testArgs){int}}}")
    }
}

extension I2ObjectRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_object { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_object{int}}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_objectArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_objectArgs\(testArgs){int}}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_objects { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_objects{int}}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i2_objectsArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i2_objectsArgs\(testArgs){int}}")
    }
}
