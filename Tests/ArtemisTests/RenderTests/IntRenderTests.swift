import XCTest
@testable import Artemis

/**
 Test for selecting integers on a query, ensuring they render the expected query string.
 */
final class IntRenderTests: XCTestCase {
    func testIntRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.int
        }
        XCTAssertEqual(query.render(), "{int}")
    }

    func testIntArgsRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.intArgs
        }
        XCTAssertEqual(query.render(), "{intArgs}")
    }

    func testIntsRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.ints
        }
        XCTAssertEqual(query.render(), "{ints}")
    }

    func testIntsArgsRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.intsArgs
        }
        XCTAssertEqual(query.render(), "{intsArgs}")
    }
}

extension IntRenderTests {
    func testIntOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.int
            }
        }
        XCTAssertEqual(query.render(), "{object{int}}")
    }

    func testIntArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.intArgs
            }
        }
        XCTAssertEqual(query.render(), "{object{intArgs}}")
    }

    func testIntsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.ints
            }
        }
        XCTAssertEqual(query.render(), "{object{ints}}")
    }

    func testIntsArgsOnObjectRender() {
        let query: _Operation<Schema.Query, Partial<Schema.TestObject>> = .query {
            $0.object {
                $0.intsArgs
            }
        }
        XCTAssertEqual(query.render(), "{object{intsArgs}}")
    }
}

extension IntRenderTests {
    func testIntArgsWithArgsRender() {
        let query: _Operation<Schema.Query, Int> = .query {
            $0.intArgs
                .input {
                    $0.input {
                        $0.int(1)
                    }
                    $0.enum(.first)
                    $0.enums([.first, .second])
                    $0.int(1)
                    $0.ints([1, 2])
                    $0.string("test")
                    $0.strings(["test", "test"])
                    $0.bool(true)
                    $0.bools([true, false])
                    $0.double(1.1)
                    $0.doubles([1.1, 2.2])
                    $0.float(1.1)
                    $0.floats([1.1, 2.2])
                }
                .inputs([
                    {
                        $0.input {
                            $0.int(1)
                        }
                        $0.enum(.first)
                        $0.enums([.first, .second])
                        $0.int(1)
                        $0.ints([1, 2])
                        $0.string("test")
                        $0.strings(["test", "test"])
                        $0.bool(true)
                        $0.bools([true, false])
                        $0.double(1.1)
                        $0.doubles([1.1, 2.2])
                        $0.float(1.1)
                        $0.floats([1.1, 2.2])
                    }
                ])
                .enum(.first)
                .enums([.first, .second])
                .int(1)
                .ints([1, 2])
                .string("test")
                .strings(["test", "test"])
                .bool(true)
                .bools([true, false])
                .double(1.1)
                .doubles([1.1, 2.2])
                .float(1.1)
                .floats([1.1, 2.2])
        }
        XCTAssertEqual(query.render(), #"{intArgs(input:{input:{int:1},inputs:{int:1},enum:first,enums:[first,second],int:1,ints:[1,2],string:"test",strings:["test","test"],bool:true,bools:[true,false],double:1.1,doubles:[1.1,2.2],float:1.1,floats:[1.1,2.2]},inputs:{input:{int:1},inputs:{int:1},enum:first,enums:[first,second],int:1,ints:[1,2],string:"test",strings:["test","test"],bool:true,bools:[true,false],double:1.1,doubles:[1.1,2.2],float:1.1,floats:[1.1,2.2]},enum:first,enums:[first,second],int:1,ints:[1,2],string:"test",strings:["test","test"],bool:true,bools:[true,false],double:1.1,doubles:[1.1,2.2],float:1.1,floats:[1.1,2.2])}"#)
    }

    func testIntsArgsWithArgsRender() {
        let query: _Operation<Schema.Query, [Int]> = .query {
            $0.intsArgs
        }
        XCTAssertEqual(query.render(), "{intsArgs}")
    }
}
