@testable import Artemis

final class Query: Object, ObjectSchema {
    typealias Schema = Query
    
    var me = Field<Person, NoArguments>("me")
    var user = Field<Person, PersonArguments>("user", PersonArguments.self)
    var users = Field<[Person], NoArguments>("users")
    var number = Field<Int, NoArguments>("number")
    var numbers = Field<[Int], NoArguments>("numbers")
    
    struct PersonArguments: ArgumentsList {
        var id = Argument<String>("id")
        let number = Argument<Int>("number", default: 10)
    }
}

struct Person {
    let id: String
    let name: String
    let age: Int
}

extension Person: Object {
    final class Schema: ObjectSchema {
        static let implements = Interfaces(LivingThing.self)
        
        var firstName = Field<String, NoArguments>("firstName")
        var lastName = Field<String, NoArguments>("lastName")
        var age = Field<Int, NoArguments>("age")
        var pets = Field<[Animal], NoArguments>("pets")
        var spouse = Field<Person, NoArguments>("spouse")
    }
}

final class Animal: Object, ObjectSchema {
    var name = Field<String, NoArguments>("name")
    var age = Field<Int, NoArguments>("age")
}

final class LivingThing: Interface {
    var age = Field<Int, NoArguments>("age")
}
