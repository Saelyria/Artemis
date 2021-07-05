import XCTest
@testable import Artemis

final class QueryRenderingTests: XCTestCase {
	func testQueryNameRendering() {
		let query = Artemis.Operation<Query, Partial<Person>>(.query, name: "QueryName") {
			Add(\.me) {
				Add(\.firstName)
			}
		}
        XCTAssertEqual(query.render(), "query QueryName{me{firstName}}")
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
		
        XCTAssertEqual(query.render(), "{me{firstName,lastName},users{pets{name}}}")
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
		
        XCTAssertEqual(query.render(), "{first:me{name:firstName},second:me{lastName}}")
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
		
        XCTAssertEqual(query.render(), #"{first:user(id:"321",number:15){name:firstName},second:user{lastName}}"#)
	}
	
	func testInputArgumentRendering() {
		let query = Artemis.Operation<Query, Partial<Person>>(.query) {
			Add(\.user) {
				Add(\.firstName)
			}
			.number(15)
			.input { input in
				input.prop(1)
                input.nested { nestedInput in
                    nestedInput.prop2("s")
                }
			}
		}
		
        XCTAssertEqual(query.render(), #"{user(number:15,input:{prop:1,nested:{prop2:"s"}}){firstName}}"#)
	}
	
	func testFragmentRendering() {
		let ageFragment = Fragment("ageField", on: LivingThing.self) {
			Add(\.age)
		}
		let namesFragment = Fragment("nameFields", on: Person.self) {
			Add(\.firstName)
			Add(\.lastName)
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
			}
		}

		var expectedString = #"{user(id:"321"){...nameFields,...ageField},second:user{firstName,...ageField}},"#
		expectedString.append(#"fragment ageField on LivingThing{age},fragment nameFields on Person{firstName,lastName}"#)
        XCTAssertEqual(query.render(), expectedString)
	}
	
	static var allTests = [
		("testQueryNameRendering", testQueryNameRendering),
		("testQueryMultipleQueryFieldSelectionSetRendering", testQueryMultipleQueryFieldSelectionSetRendering),
		("testQueryAliasRendering", testQueryAliasRendering),
		("testQueryArgumentRendering", testQueryArgumentRendering),
		("testInputArgumentRendering", testInputArgumentRendering),
		("testFragmentRendering", testFragmentRendering)
	]
}
