import XCTest
@testable import Artemis

final class QueryRenderingDebugTests: XCTestCase {
    func testQueryNameRendering() {
        let query = Artemis.Operation<Query, Partial<Person>>(.query, name: "QueryName") {
            Add(\.me) {
                Add(\.firstName)
            }
        }
        XCTAssertEqual(query.renderDebug(), """
        query QueryName {
           me {
              firstName
           }
        }
        """)
    }
    
    func testQueryMultipleQueryFieldSelectionSetRendering() {
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
        
        XCTAssertEqual(query.renderDebug(), """
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
        
        XCTAssertEqual(query.renderDebug(), """
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
        
        XCTAssertEqual(query.renderDebug(), """
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

    func testFragmentRendering() {
        let ageFragment = Fragment("ageField", on: LivingThing.self) {
            Add(\.age, alias: "yearsOnEarth")
        }
        let namesFragment = Fragment("nameFields", on: Person.self) {
            Add(\.firstName)
            Add(\.lastName)
        }
        let petsFragment = Fragment("petField", on: Person.self) {
            Add(\.pets) {
                Add(\.age)
            }
        }

        let query = Artemis.Operation<Query, (Partial<Person>, Partial<Person>)>(.query) {
            Add(\.user) {
                Add(fieldsOn: namesFragment)
                Add(fieldsOn: ageFragment)
            }
            .id("321")
            Add(\.user, alias: "second") {
                Add(\.firstName)
                Add(fieldsOn: ageFragment)
                Add(fieldsOn: petsFragment)
            }
        }

        XCTAssertEqual(query.renderDebug(), """
        {
           user(id: "321") {
              ...nameFields
              ...ageField
           }
           second: user {
              firstName
              ...ageField
              ...petField
           }
        }
        fragment ageField on LivingThing {
           yearsOnEarth: age
        }
        fragment nameFields on Person {
           firstName
           lastName
        }
        fragment petField on Person {
           pets {
              age
           }
        }
        """)
    }
    
    static var allTests = [
        ("testQueryNameRendering", testQueryNameRendering),
        ("testQueryMultipleQueryFieldSelectionSetRendering", testQueryMultipleQueryFieldSelectionSetRendering),
        ("testQueryAliasRendering", testQueryAliasRendering),
		("testQueryArgumentRendering", testQueryArgumentRendering),
        ("testFragmentRendering", testFragmentRendering)
    ]
}
