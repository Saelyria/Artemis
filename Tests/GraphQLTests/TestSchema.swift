@testable import GraphQL

final class Query: Object {
    var me = Field<Person, Void>("me")
    var user = Field<Person, PersonArguments>("user", PersonArguments.self)
    var users = Field<[Person], Void>("users")
    var number = Field<Int, Void>("number")
    var numbers = Field<[Int], Void>("numbers")
    
    struct PersonArguments {
        let id: String
        let number: Int = 1
    }
}

final class Person: Object {
    var firstName = Field<String, Void>("firstName")
    var lastName = Field<String, Void>("lastName")
    var age = Field<Int, Void>("age")
    var pets = Field<[Animal], Void>("pets")
    var spouse = Field<Person, Void>("spouse")
}

final class Animal: Object {
    var name = Field<String, Void>("name")
    var age = Field<Int, Void>("age")
}
