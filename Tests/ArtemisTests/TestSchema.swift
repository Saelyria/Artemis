@testable import Artemis

final class Query: Object {
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

final class UserInput: Input {
	var prop = Field<Int, NoArguments>("prop")
	var prop2 = Field<String, NoArguments>("prop2")
	var nested = Field<UserInput, NoArguments>("nested")
}

final class Person: Object {
    static let implements = Interfaces(LivingThing.self)

    var firstName = Field<String, NoArguments>("firstName")
    var lastName = Field<String, NoArguments>("lastName")
    var age = Field<Int, NoArguments>("age")
    var pets = Field<[Animal], PetsArguments>("pets")
    struct PetsArguments: ArgumentsList {
        var number = Argument<Int>("number", default: 10)
        var types = Argument<[AnimalType]>("types")
        var type = Argument<AnimalType>("type")
    }
    var spouse = Field<Person, NoArguments>("spouse")
}

final class Animal: Object {
    static let implements = Interfaces(LivingThing.self)

	var name = Field<String, NoArguments>("name")
	var age = Field<Int, NoArguments>("age")
    var type = Field<AnimalType, NoArguments>("type")
    var friendlyWithTypes = Field<[AnimalType], NoArguments>("friendlyWithTypes")
}

enum AnimalType: String, Enum {
    case cat = "CAT"
    case dog = "DOG"
}

final class LivingThing: Interface {
	var age = Field<Int, NoArguments>("age")
}
