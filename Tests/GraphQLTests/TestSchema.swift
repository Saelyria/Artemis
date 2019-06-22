@testable import GraphQL

struct QuerySchema: Object {
    var me = Field<PersonSchema, Void>("me")
    var user = Field<PersonSchema, PersonArguments>("user", PersonArguments.self)
    var users = Field<[PersonSchema], Void>("users")
    var number = Field<Int, Void>("number")
    var numbers = Field<[Int], Void>("numbers")
    
    struct PersonArguments {
        let id: String
        let number: Int = 1
    }
}

struct PersonSchema: Object {
    var firstName = Field<String, Void>("firstName")
    var lastName = Field<String, Void>("lastName")
    var age = Field<Int, Void>("age")
    var pet = Field<AnimalSchema, Void>("pet")
}

struct AnimalSchema: Object {
    var name = Field<String, Void>("name")
    var age = Field<Int, Void>("age")
}
