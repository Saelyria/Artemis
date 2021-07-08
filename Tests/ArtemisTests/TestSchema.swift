@testable import Artemis

final class Query: Object {
    @Field("me") var me: Person
    @Field("user") var user: (Person, UserArguments)
    @Field("users") var users: [Person]
    @Field("number") var number: Int
    @Field("numbers") var numbers: [Int]

    final class UserArguments: ArgumentsList {
        @Argument("id") var id: String
        @Argument("number") var number: Int
        @Argument("input") var input: UserInput
    }
}

final class UserInput: Input {
    @Field("prop") var prop: Int
    @Field("prop2") var prop2: String
    @Field("nested") var nested: UserInput
}

final class Person: Object {
    static let implements = Interfaces(LivingThing.self)

    @Field("firstName") var firstName: String
    @Field("lastName") var lastName: String
    @Field("age") var age: Int
    @Field("pets") var pets: ([Animal], PetsArguments)
    @Field("spouse") var spouse: Person

    final class PetsArguments: ArgumentsList {
        @Argument("number") var number: Int
        @Argument("types") var types: [AnimalType]
        @Argument("type") var type: AnimalType
    }
}

final class Animal: Object {
    static let implements = Interfaces(LivingThing.self)

    @Field("name") var name: String
    @Field("age") var age: Int
    @Field("type") var type: AnimalType
    @Field("friendlyWithTypes") var friendlyWithTypes: [AnimalType]
}

enum AnimalType: String, Enum {
    static var `default`: AnimalType = .cat

    case cat = "CAT"
    case dog = "DOG"
}

final class LivingThing: Interface {
    @Field("age") var age: Int
}
