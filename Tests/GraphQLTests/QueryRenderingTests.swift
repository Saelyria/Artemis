import XCTest
@testable import GraphQL

final class QueryRenderingTests: XCTestCase {
    func testQueryNameRendering() {
        let query = GraphQL.Operation<Query, Partial<Person>>(.query, name: "QueryName") {
            Add(\.me) {
                Add(\.firstName)
            }
        }
        XCTAssert(query.render() == "query QueryName{me{firstName}}")
    }
    
    func testQueryMultipleQueryFieldSubSelectionRendering() {
        let query = GraphQL.Operation<Query, (Partial<Person>, [Partial<Person>])>(.query) {
            Add(\.me) {
                Add(\.firstName)
                Add(\.lastName)
            }
            Add(\.users) {
                Add(\.pets) {
                    Add(\.name)
                }
            }
        }

        XCTAssert(query.render() == "query{me{firstName,lastName},users{pets{name}}}")
    }
    
    func testQueryAliasRendering() {
        let query = GraphQL.Operation<Query, (Partial<Person>, Partial<Person>)>(.query) {
            Add(\.me, alias: "first") {
                Add(\.firstName, alias: "name")
            }
            Add(\.me, alias: "second") {
                Add(\.lastName)
            }
        }
        
        XCTAssert(query.render() == "query{first:me{name:firstName},second:me{lastName}}")
    }
    
    func testQueryArgumentRendering() {
        let query = GraphQL.Operation<Query, (Partial<Person>, Partial<Person>)>(.query) {
            Add(\.user, alias: "first") {
                Add(\.firstName, alias: "name")
            }
            .id("321")
            Add(\.user, alias: "second") {
                Add(\.lastName)
            }
//            .id("123")
        }
        
        XCTAssert(query.render() == #"query{first:user(id:\"321\"){name:firstName},second:user{lastName}}"#, query.render())
    }

    static var allTests = [
        ("testQueryNameRendering", testQueryNameRendering),
        ("testQueryMultipleQueryFieldSubSelectionRendering", testQueryMultipleQueryFieldSubSelectionRendering),
        ("testQueryAliasRendering", testQueryAliasRendering),
    ]
}
