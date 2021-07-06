import XCTest
@testable import Artemis

final class QueryRenderingDebugTests: XCTestCase {
    func testQueryNameRendering() {
        let query: Artemis.Operation<Query, Partial<Person>> = .query(name: "QueryName") {
            $0.me {
                $0.firstName
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
        let query: Artemis.Operation<Query, (Partial<Person>, [Partial<Person>])> = .query {
            $0.me {
                $0.firstName
                $0.lastName
            }
            $0.users {
                $0.pets {
                    $0.name
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
        let query: Artemis.Operation<Query, (Partial<Person>, Partial<Person>)> = .query {
            $0.me(alias: "first") {
                $0.firstName(alias: "name")
            }
            $0.me(alias: "second") {
                $0.lastName
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
        let query: Artemis.Operation<Query, (Partial<Person>, Partial<Person>)> = .query {
            $0.user(alias: "first") {
                $0.firstName(alias: "name")
            }
            .id("321")
            .number(15)
            $0.user(alias: "second") {
                $0.lastName
            }
        }
        
        XCTAssertEqual(query.renderDebug(), """
        {
           first: user(id: "321", number: 15) {
              name: firstName
           }
           second: user {
              lastName
           }
        }
        """)
    }

    func testQueryEnumRendering() {
        let query: Artemis.Operation<Query, Partial<Person>> = .query {
            $0.user {
                $0.pets {
                    $0.type
                    $0.friendlyWithTypes
                }
                .type(.cat)
                .types([.dog])
            }
        }

        XCTAssertEqual(query.renderDebug(), """
        {
           user {
              pets(type: CAT, types: [DOG]) {
                 type
                 friendlyWithTypes
              }
           }
        }
        """)
    }

    func testInputArgumentRendering() {
        let query: Artemis.Operation<Query, Partial<Person>> = .query {
            $0.user {
                $0.firstName
            }
            .number(15)
            .input {
                $0.prop(1)
                $0.nested {
                    $0.prop2("s")
                }
            }
        }

        XCTAssertEqual(query.renderDebug(), """
        {
           user(number: 15, input:  {
              prop: 1
              nested:  {
                 prop2: "s"
              }
           }) {
              firstName
           }
        }
        """)
    }

    func testFragmentRendering() {
        let ageFragment = Fragment("ageField", on: LivingThing.self) {
            $0.age(alias: "yearsOnEarth")
        }
        let namesFragment = Fragment("nameFields", on: Person.self) {
            $0.firstName
            $0.lastName
        }
        let petsFragment = Fragment("petField", on: Person.self) {
            $0.pets {
                $0.age
            }
        }

        let query: Artemis.Operation<Query, (Partial<Person>, Partial<Person>)> = .query {
            $0.user {
                namesFragment
                ageFragment
            }
            .id("321")
            $0.user(alias: "second") {
                $0.firstName
                ageFragment
                petsFragment
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
