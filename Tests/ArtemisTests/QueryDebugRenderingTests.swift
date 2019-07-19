import XCTest
@testable import Artemis

final class QueryDebugRenderingTests: XCTestCase {
    func testQueryNameRendering() {
        let query = Artemis.Operation<Query, Partial<Person>>(.query, name: "QueryName") {
            Add(\.me) {
                Add(\.firstName)
            }
        }
        XCTAssert(query.renderDebug() == """
        query QueryName {
           me {
              firstName
           }
        }
        """)
    }
    
    func testQueryMultipleQueryFieldSubSelectionRendering() {
        let query = Artemis.Operation<Query, (Partial<Person>, [Partial<Person>])>(.query) {
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
        
        XCTAssert(query.renderDebug() == """
        {
           me {
              firstName
              lastName
           }
           users {
              pets {
                 name
              }
           }
        }
        """)
    }
    
    func testQueryAliasRendering() {
        let query = Artemis.Operation<Query, (Partial<Person>, Partial<Person>)>(.query) {
            Add(\.me, alias: "first") {
                Add(\.firstName, alias: "name")
            }
            Add(\.me, alias: "second") {
                Add(\.lastName)
            }
        }
        
        XCTAssert(query.renderDebug() == """
        {
           first: me {
              name: firstName
           }
           second: me {
              lastName
           }
        }
        """)
    }
    
    func testQueryArgumentRendering() {
        let query = Artemis.Operation<Query, (Partial<Person>, Partial<Person>)>(.query) {
            Add(\.user, alias: "first") {
                Add(\.firstName, alias: "name")
            }
            .id("321")
			.number(15)
            Add(\.user, alias: "second") {
                Add(\.lastName)
            }
        }
        
        XCTAssert(query.renderDebug() == """
        {
           first: user(id: \"321\", number: 15) {
              name: firstName
           }
           second: user {
              lastName
           }
        }
        """)
    }
    
    static var allTests = [
        ("testQueryNameRendering", testQueryNameRendering),
        ("testQueryMultipleQueryFieldSubSelectionRendering", testQueryMultipleQueryFieldSubSelectionRendering),
        ("testQueryAliasRendering", testQueryAliasRendering),
    ]
}
