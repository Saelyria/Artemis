import XCTest
@testable import GraphQL

final class QueryRenderingTests: XCTestCase {
    func testQueryNameRendering() {
        let queryName = "QueryName"
        let query: Operation<QuerySchema, Partial<PersonSchema>> = Operation(name: queryName) {
            Add(\.me) {
                Add(\.firstName)
            }
        }
        
        let meKey = QuerySchema().me.key
        let firstNameKey = PersonSchema().firstName.key
        XCTAssert(query.render() == "query \(queryName){\(meKey){\(firstNameKey)}}")
    }
    
    func testQueryMultipleQueryFieldSubSelectionRendering() {
        let query: Operation<QuerySchema, (Partial<PersonSchema>, [Partial<PersonSchema>])> = Operation() {
            Add(\.me) {
                Add(\.firstName)
                Add(\.lastName)
            }
            Add(\.users) {
                Add(\.pet) {
                    Add(\.name)
                }
            }
        }
        
        let meKey = QuerySchema().me.key
        let usersKey = QuerySchema().users.key
        let firstNameKey = PersonSchema().firstName.key
        let lastNameKey = PersonSchema().lastName.key
        let petKey = PersonSchema().pet.key
        let petNameKey = AnimalSchema().name.key
        XCTAssert(query.render() == "query{\(meKey){\(firstNameKey),\(lastNameKey)},\(usersKey){\(petKey){\(petNameKey)}}}")
    }
    
    func testQueryAliasRendering() {
        let firstAlias = "first"
        let secondAlias = "second"
        let nameAlias = "name"
        let query: Operation<QuerySchema, (Partial<PersonSchema>, Partial<PersonSchema>)> = Operation() {
            Add(\.me, alias: firstAlias) {
                Add(\.firstName, alias: nameAlias)
            }
            Add(\.me, alias: secondAlias) {
                Add(\.lastName)
            }
        }
        
        let meKey = QuerySchema().me.key
        let firstNameKey = PersonSchema().firstName.key
        let lastNameKey = PersonSchema().lastName.key
        XCTAssert(query.render() == "query{\(firstAlias):\(meKey){\(nameAlias):\(firstNameKey)},\(secondAlias):\(meKey){\(lastNameKey)}}")
    }
    
    func testQueryArgumentRendering() {
        
    }

    static var allTests = [
        ("testQueryNameRendering", testQueryNameRendering),
        ("testQueryMultipleQueryFieldSubSelectionRendering", testQueryMultipleQueryFieldSubSelectionRendering),
        ("testQueryAliasRendering", testQueryAliasRendering),
    ]
}
