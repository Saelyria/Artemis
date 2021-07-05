@testable import Artemis

final class Query: Object, ObjectSchema {
	typealias Schema = Query
	
	var me = Field<Person, NoArguments>("me")
	var user = Field<Person, UserArguments>("user")
	struct UserArguments: ArgumentsList {
		var id = Argument<String>("id")
		var number = Argument<Int>("number", default: 10)
		var input = Argument<UserInput>("input")
	}
	var users = Field<[Person], NoArguments>("users")
	var number = Field<Int, NoArguments>("number")
	var numbers = Field<[Int], NoArguments>("numbers")
}

struct Person {
	let id: String
	let name: String
	let age: Int
}

final class UserInput: Input, ObjectSchema {
	var prop = Field<Int, NoArguments>("prop")
	var prop2 = Field<String, NoArguments>("prop2")
	var nested = Field<UserInput, NoArguments>("nested")
}

extension Person: Object {
	final class Schema: ObjectSchema {
		static let implements = Interfaces(LivingThing.self)
		
		var firstName = Field<String, NoArguments>("firstName")
		var lastName = Field<String, NoArguments>("lastName")
		var age = Field<Int, NoArguments>("age")
		var pets = Field<[Animal], PetsArguments>("pets")
        struct PetsArguments: ArgumentsList {
            var number = Argument<Int>("number", default: 10)
        }
		var spouse = Field<Person, NoArguments>("spouse")
	}
}

final class Animal: Object, ObjectSchema {
    static let implements = Interfaces(LivingThing.self)

	var name = Field<String, NoArguments>("name")
	var age = Field<Int, NoArguments>("age")
}

final class LivingThing: Interface {
	var age = Field<Int, NoArguments>("age")
}
