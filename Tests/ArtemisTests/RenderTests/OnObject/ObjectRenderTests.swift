import XCTest
@testable import Artemis

/**
 Test for selecting objects on a query, ensuring they render the expected query object.
 */
final class ObjectRenderTests: XCTestCase {
    func testSingleRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object { $0.int }
        }
        XCTAssertEqual(query.render(), "{object{int}}")
    }

    func testSingleArgsRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.objectArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{objectArgs\(testArgs){int}}")
    }

    func testArrayRender() {
        let query: _Operation<Schema.Query, [Partial<Schema.TestObject>]> = .query {
            $0.objects { $0.int }
        }
        XCTAssertEqual(query.render(), "{objects{int}}")
    }

    func testArrayArgsRender() {
        let query: _Operation<Schema.Query, [Partial<Schema.TestObject>]> = .query {
            $0.objectsArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{objectsArgs\(testArgs){int}}")
    }
}

extension ObjectRenderTests {
    func testSingleAliasRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object(alias: "alias") { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:object{int}}")
    }

    func testSingleArgsAliasRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.objectArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:objectArgs\(testArgs){int}}")
    }

    func testArrayAliasRender() {
        let query: _Operation<Schema.Query, [Partial<Schema.TestObject>]> = .query {
            $0.objects(alias: "alias") { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:objects{int}}")
    }

    func testArrayArgsAliasRender() {
        let query: _Operation<Schema.Query, [Partial<Schema.TestObject>]> = .query {
            $0.objectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{alias:objectsArgs\(testArgs){int}}")
    }
}

extension ObjectRenderTests {
    func testMultipleSingleRender() {
        let query: _Operation<Schema.Query, (Partial<Schema.TestObject>, Partial<Schema.TestObject>)> = .query {
            $0.object { $0.int }
            $0.object { $0.int }
        }
        XCTAssertEqual(query.render(), "{object{int},object{int}}")
    }

    func testMultipleSingleArgsRender() {
        let query: _Operation<Schema.Query, (Partial<Schema.TestObject>, Partial<Schema.TestObject>)> = .query {
            $0.objectArgs(arguments: .testDefault) { $0.int }
            $0.objectArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{objectArgs\(testArgs){int},objectArgs\(testArgs){int}}")
    }

    func testMultipleArrayRender() {
        let query: _Operation<Schema.Query, ([Partial<Schema.TestObject>], [Partial<Schema.TestObject>])> = .query {
            $0.objects { $0.int }
            $0.objects { $0.int }
        }
        XCTAssertEqual(query.render(), "{objects{int},objects{int}}")
    }

    func testMultipleArrayArgsRender() {
        let query: _Operation<Schema.Query, ([Partial<Schema.TestObject>], [Partial<Schema.TestObject>])> = .query {
            $0.objectsArgs(arguments: .testDefault) { $0.int }
            $0.objectsArgs(arguments: .testDefault) { $0.int }
        }
        XCTAssertEqual(query.render(), "{objectsArgs\(testArgs){int},objectsArgs\(testArgs){int}}")
    }
}

// MARK: -

extension ObjectRenderTests {
    func testSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.object { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{object{int}}}")
    }

    func testSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.objectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{objectsArgs\(testArgs){int}}}")
    }

    func testArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.objects { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{objects{int}}}")
    }

    func testArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.objectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{objectsArgs\(testArgs){int}}}")
    }
}

extension ObjectRenderTests {
    func testSingleAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.object(alias: "alias") { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:object{int}}}")
    }

    func testSingleArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.objectArgs(alias: "alias", arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:objectArgs\(testArgs){int}}}")
    }

    func testArrayAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.objects(alias: "alias") { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:objects{int}}}")
    }

    func testArrayArgsAliasOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.objectsArgs(alias: "alias", arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{alias:objectsArgs\(testArgs){int}}}")
    }
}

extension ObjectRenderTests {
    func testMultipleSingleOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.object { $0.int }
                $0.object { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{object{int},object{int}}}")
    }

    func testMultipleSingleArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.objectArgs(arguments: .testDefault) { $0.int }
                $0.objectArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{objectArgs\(testArgs){int},objectArgs\(testArgs){int}}}")
    }

    func testMultipleArrayOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.objects { $0.int }
                $0.objects { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{objects{int},objects{int}}}")
    }

    func testMultipleArrayArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.objectsArgs(arguments: .testDefault) { $0.int }
                $0.objectsArgs(arguments: .testDefault) { $0.int }
            }
        }
        XCTAssertEqual(query.render(), "{object{objectsArgs\(testArgs){int},objectsArgs\(testArgs){int}}}")
    }
}

extension ObjectRenderTests {
    func testSingleOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.object { $0.int }
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{object{int}}")
    }

    func testSingleArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.objectArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{objectArgs\(testArgs){int}}")
    }

    func testArrayOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.objects { $0.int }
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{objects{int}}")
    }

    func testArrayArgsOnFragmentRender() {
        let fragment = Fragment("fragName", on: Schema.Query.self) {
            $0.objectsArgs(arguments: .testDefault) { $0.int }
        }
        let query: _Operation<Schema.Query, _SelectionSet<Never>.Result> = .query {
            fragment
        }
        XCTAssertEqual(query.render(), "{...fragName},fragment fragName on Query{objectsArgs\(testArgs){int}}")
    }
}
