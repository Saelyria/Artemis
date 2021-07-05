import XCTest
@testable import Artemis

final class QueryParsingTests: XCTestCase {
    func testQueryMultipleQueryFieldSelectionSetParsing() throws {
        let query = Artemis.Operation<Query, (Partial<Person>, [Partial<Person>])>(.query) {
            Add(\.me) {
                Add(\.firstName)
                Add(\.lastName)
            }
            Add(\.users) {
                Add(\.firstName)
                Add(\.pets) {
                    Add(\.name)
                }
            }
        }
        
        let response = Data("""
        {
            "data": {
                "me": {
                    "firstName": "Aaron",
                    "lastName": "Bosnjak"
                },
                "users": [
                    {
                        "firstName": "Ashley",
                        "pets": [
                            {
                                "name": "Tiny"
                            }
                        ]
                    }
                ]
            }
        }
        """.utf8)
        
        let (me, users) = try query.createResult(from: response)
        
        XCTAssertEqual(me.values.count, 2)
        XCTAssertEqual(me.firstName, "Aaron")
        XCTAssertEqual(me.lastName, "Bosnjak")
        XCTAssertNil(me.age)
        XCTAssertNil(me.pets)
        XCTAssertNil(me.spouse)
        
        XCTAssertEqual(users.count, 1)
        XCTAssertEqual(users.first?.values.count, 2)
        XCTAssertEqual(users.first?.firstName, "Ashley")
        XCTAssertNil(users.first?.lastName)
        XCTAssertNil(users.first?.age)
        XCTAssertNil(users.first?.spouse)
        XCTAssertEqual(users.first?.pets?.count, 1)
        XCTAssertEqual(users.first?.pets?.first?.name, "Tiny")
        XCTAssertNil(users.first?.pets?.first?.age)
    }
    
    func testQueryAliasParsing() throws {
        let query = Artemis.Operation<Query, (Partial<Person>, Partial<Person>)>(.query) {
            Add(\.me, alias: "first") {
                Add(\.firstName, alias: "name")
            }
            Add(\.me, alias: "second") {
                Add(\.lastName)
            }
        }
        
        let response = Data("""
        {
            "data": {
                "first": {
                    "name": "Aaron",
                },
                "second": {
                    "lastName": "Bielus"
                }
            }
        }
        """.utf8)
        
        let (first, second) = try query.createResult(from: response)

        XCTAssertEqual(first.values.count, 1)
        XCTAssertNil(first.firstName)
        XCTAssertNil(first.lastName)
        XCTAssertNil(first.age)
        XCTAssertNil(first.pets)
        XCTAssertNil(first.spouse)
        XCTAssertEqual(first.get(\.firstName, alias: "name"), "Aaron")
        
        XCTAssertEqual(first.values.count, 1)
        XCTAssertNil(second.firstName)
        XCTAssertEqual(second.lastName, "Bielus")
        XCTAssertNil(second.age)
        XCTAssertNil(second.pets)
        XCTAssertNil(second.spouse)
    }
    
    static var allTests = [
        ("testQueryMultipleQueryFieldSelectionSetRendering", testQueryMultipleQueryFieldSelectionSetParsing),
        ("testQueryAliasRendering", testQueryAliasParsing),
    ]
}
