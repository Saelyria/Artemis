import XCTest
@testable import Artemis

/**
 Test for selecting objects on a query where the field is declared on the second interface, ensuring they render the
 expected query object.
 */
final class I1ObjectRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.i1_object { $0.int }
        }
        XCTAssertEqual(query.render(), "{i1_object{int}}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.i1_objectArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i1_objectArgs\(testArgs){int}}")
    }

    func testArrayRender() {
        let query: _Operation<Query, [Partial<TestObject>]> = .query {
            $0.i1_objects { $0.int }
        }
        XCTAssertEqual(query.render(), "{i1_objects{int}}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Query, [Partial<TestObject>]> = .query {
            $0.i1_objectsArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i1_objectsArgs\(testArgs){int}}")
    }
}

extension I1ObjectRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.i1_object(alias: "alias") { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i1_object{int}}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.i1_objectArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i1_objectArgs\(testArgs){int}}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Query, [Partial<TestObject>]> = .query {
            $0.i1_objects(alias: "alias") { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i1_objects{int}}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Query, [Partial<TestObject>]> = .query {
            $0.i1_objectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:i1_objectsArgs\(testArgs){int}}")
    }
}

extension I1ObjectRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Query, (Partial<TestObject>, Partial<TestObject>)> = .query {
            $0.i1_object { $0.int }
            $0.i1_object { $0.int }
        }
        XCTAssertEqual(query.render(), "{i1_object{int},i1_object{int}}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Query, (Partial<TestObject>, Partial<TestObject>)> = .query {
            $0.i1_objectArgs(arguments: .testDefault) { $0.int }
            $0.i1_objectArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i1_objectArgs\(testArgs){int},i1_objectArgs\(testArgs){int}}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Query, ([Partial<TestObject>], [Partial<TestObject>])> = .query {
            $0.i1_objects { $0.int }
            $0.i1_objects { $0.int }
        }
        XCTAssertEqual(query.render(), "{i1_objects{int},i1_objects{int}}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Query, ([Partial<TestObject>], [Partial<TestObject>])> = .query {
            $0.i1_objectsArgs(arguments: .testDefault) { $0.int }
            $0.i1_objectsArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{i1_objectsArgs\(testArgs){int},i1_objectsArgs\(testArgs){int}}")
    }
}

// MARK: -

extension I1ObjectRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_object { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_object{int}}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_objectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_objectsArgs\(testArgs){int}}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_objects { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_objects{int}}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_objectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_objectsArgs\(testArgs){int}}}")
    }
}

extension I1ObjectRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_object(alias: "alias") { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_object{int}}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_objectArgs(alias: "alias", arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_objectArgs\(testArgs){int}}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_objects(alias: "alias") { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_objects{int}}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_objectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:i1_objectsArgs\(testArgs){int}}}")
    }
}

extension I1ObjectRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_object { $0.int }
                $0.i1_object { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_object{int},i1_object{int}}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_objectArgs(arguments: .testDefault) { $0.int }
                $0.i1_objectArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_objectArgs\(testArgs){int},i1_objectArgs\(testArgs){int}}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_objects { $0.int }
                $0.i1_objects { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_objects{int},i1_objects{int}}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Query, Partial<TestObject>> = .query {
            $0.object {
                $0.i1_objectsArgs(arguments: .testDefault) { $0.int }
                $0.i1_objectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{i1_objectsArgs\(testArgs){int},i1_objectsArgs\(testArgs){int}}}")
    }
}

extension I1ObjectRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_object { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_object{int}}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_objectArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_objectArgs\(testArgs){int}}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_objects { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_objects{int}}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Query.self) {
            $0.i1_objectsArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Query, Never> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{i1_objectsArgs\(testArgs){int}}")
    }
}
