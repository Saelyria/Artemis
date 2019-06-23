import XCTest
@testable import GraphQL

final class QueryParsingTests: XCTestCase {
    func testQueryMultipleQueryFieldSubSelectionParsing() {
        let query = GraphQL.Operation<Query, (Partial<Person>, [Partial<Person>])>(.query) {
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
        
        guard let (me, users) = try? query.createResult(from: response) else {
            XCTFail()
            return
        }
        
        XCTAssert(me.values.count == 2)
        XCTAssert(me.firstName == "Aaron")
        XCTAssert(me.lastName == "Bosnjak")
        XCTAssert(me.age == nil)
        XCTAssert(me.pets == nil)
        XCTAssert(me.spouse == nil)
        
        XCTAssert(users.count == 1)
        XCTAssert(users.first?.values.count == 2)
        XCTAssert(users.first?.firstName == "Ashley")
        XCTAssert(users.first?.lastName == nil)
        XCTAssert(users.first?.age == nil)
        XCTAssert(users.first?.spouse == nil)
        XCTAssert(users.first?.pets?.count == 1)
        XCTAssert(users.first?.pets?.first?.name == "Tiny")
        XCTAssert(users.first?.pets?.first?.age == nil)
    }
    
    func testQueryAliasParsing() {
        let query = GraphQL.Operation<Query, (Partial<Person>, Partial<Person>)>(.query) {
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
        
        guard let (first, second) = try? query.createResult(from: response) else {
            XCTFail()
            return
        }

        XCTAssert(first.values.count == 1)
        XCTAssert(first.firstName == nil)
        XCTAssert(first.lastName == nil)
        XCTAssert(first.age == nil)
        XCTAssert(first.pets == nil)
        XCTAssert(first.spouse == nil)
        XCTAssert(first.get(\.firstName, alias: "name") == "Aaron")
        
        XCTAssert(first.values.count == 1)
        XCTAssert(second.firstName == nil)
        XCTAssert(second.lastName == "Bielus")
        XCTAssert(second.age == nil)
        XCTAssert(second.pets == nil)
        XCTAssert(second.spouse == nil)
    }
    
    static var allTests = [
        ("testQueryMultipleQueryFieldSubSelectionRendering", testQueryMultipleQueryFieldSubSelectionParsing),
        ("testQueryAliasRendering", testQueryAliasParsing),
    ]
}
