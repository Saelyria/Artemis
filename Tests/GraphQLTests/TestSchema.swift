@testable import GraphQL

struct QuerySchema: Schema {
    var person = Field("person", type: PersonSchema.self, arguments: PersonArguments.self)
    var people = Field("people", type: [PersonSchema].self)
    var number = Field("number", type: Int.self)
    var numbers = Field("numbers", type: [Int].self)
    
    struct PersonArguments {
        let id: String
        let number: Int = 1
    }
}

struct PersonSchema: Schema {
    var firstName = Field("firstName", type: Person.self)
}
