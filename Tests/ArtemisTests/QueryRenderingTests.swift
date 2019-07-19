import XCTest
@testable import Artemis

final class QueryRenderingTests: XCTestCase {
    func testQueryNameRendering() {
        let query = Artemis.Operation<Query, Partial<Person>>(.query, name: "QueryName") {
            Add(\.me) {
                Add(\.firstName)
            }
        }
        XCTAssert(query.render() == "query QueryName{me{firstName}}")
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

        XCTAssert(query.render() == "{me{firstName,lastName},users{pets{name}}}")
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
        
        XCTAssert(query.render() == "{first:me{name:firstName},second:me{lastName}}")
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
        
        XCTAssert(query.render() == #"{first:user(id:"321",number:15){name:firstName},second:user{lastName}}"#, query.render())
    }
	
	func testInputArgumentRendering() {
        let query = Artemis.Operation<Query, Partial<Person>>(.query) {
            Add(\.user) {
                Add(\.firstName)
            }
            .number(15)
			.input {
				$0.prop(1)
				$0.nested {
					$0.prop2("s")
				}
			}
        }
        
        XCTAssert(query.render() == #"{user(number:15,input:{prop:1,nested:{prop2:"s"}}){firstName}}"#, query.render())
	}
    
    func testFragmentRendering() {
        let query = Artemis.Operation<Query, (Partial<Person>, Partial<Person>)>(.query, { ageFragment, namesFragment in
            Add(\.user) {
                Add(fieldsOn: namesFragment)
                Add(fieldsOn: ageFragment)
            }
            .id("321")
            Add(\.user, alias: "second") {
                Add(fieldsOn: ageFragment)
            }
        }, fragments: {
            Fragment("ageField", on: LivingThing.self) {
                Add(\.age)
            }
            Fragment("nameFields", on: Person.self) {
                Add(\.firstName)
                Add(\.lastName)
            }
        })
        
        var expectedString = #"{user(id:"321"){...nameFields,...ageField},second:user{...ageField}},"#
        expectedString.append(#"fragment ageField on LivingThing{age},fragment nameFields on Person{firstName,lastName}"#)
        XCTAssert(query.render() == expectedString, query.render())
    }

    static var allTests = [
        ("testQueryNameRendering", testQueryNameRendering),
        ("testQueryMultipleQueryFieldSubSelectionRendering", testQueryMultipleQueryFieldSubSelectionRendering),
        ("testQueryAliasRendering", testQueryAliasRendering),
    ]
}
