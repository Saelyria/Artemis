import XCTest
@testable import GraphQL

final class QueryRenderingTests: XCTestCase {
    func testQueryNameRendering() {
        let queryName = "QueryName"
        let query: Query<QuerySchema, Partial<PersonSchema>> = Query(name: queryName) {
            Select(\.me) {
                Select(\.firstName)
            }
        }
        
        let meKey = QuerySchema().me.key
        let firstNameKey = PersonSchema().firstName.key
        XCTAssert(query.render() == "query \(queryName){\(meKey){\(firstNameKey)}}")
    }
    
    func testQueryMultipleQueryFieldSubSelectionRendering() {
        let query: Query<QuerySchema, (Partial<PersonSchema>, [Partial<PersonSchema>])> = Query() {
            Select(\.me) {
                Select(\.firstName)
                Select(\.lastName)
            }
            Select(\.users) {
                Select(\.pet) {
                    Select(\.name)
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
        let query: Query<QuerySchema, (Partial<PersonSchema>, Partial<PersonSchema>)> = Query() {
            Select(\.me, alias: firstAlias) {
                Select(\.firstName, alias: nameAlias)
            }
            Select(\.me, alias: secondAlias) {
                Select(\.lastName)
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
