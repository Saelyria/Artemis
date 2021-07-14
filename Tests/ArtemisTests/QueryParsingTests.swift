import XCTest
@testable import Artemis

/*
final class QueryParsingTests: XCTestCase {
    func testQueryNameParsing() throws {
        let query: _Operation<Query, Partial<Person>> = .query(name: "QueryName") {
            $0.me {
                $0.firstName
            }
        }

        let response = Data("""
        {
            "data": {
                "me": {
                    "firstName": "Aaron",
                }
            }
        }
        """.utf8)

        let me = try query.createResult(from: response)

        XCTAssertEqual(me.values.count, 1)
        XCTAssertEqual(me.firstName, "Aaron")
        XCTAssertNil(me.lastName)
        XCTAssertNil(me.age)
        XCTAssertNil(me.pets)
        XCTAssertNil(me.spouse)
    }

    func testQueryMultipleQueryField_SelectionSetParsing() throws {
        let query: _Operation<Query, (Partial<Person>, [Partial<Person>])> = .query {
            $0.me {
                $0.firstName
                $0.lastName
            }
            $0.users {
                $0.pets {
                    $0.name
                }
            }
        }

        let response = Data("""
        {
            "data": {
                "me": {
                    "firstName": "Aaron",
                    "lastName": "Bosnjak"
                },
                "users": [
                    {
                        "pets": [
                            {
                                "name": "Tiny"
                            }
                        ]
                    }
                ]
            }
        }
        """.utf8)

        let (me, users) = try query.createResult(from: response)

        XCTAssertEqual(me.values.count, 2)
        XCTAssertEqual(me.firstName, "Aaron")
        XCTAssertEqual(me.lastName, "Bosnjak")
        XCTAssertNil(me.age)
        XCTAssertNil(me.pets)
        XCTAssertNil(me.spouse)

        XCTAssertEqual(users.count, 1)
        XCTAssertEqual(users.first?.values.count, 1)
        XCTAssertNil(users.first?.firstName)
        XCTAssertNil(users.first?.lastName)
        XCTAssertNil(users.first?.age)
        XCTAssertNil(users.first?.spouse)
        XCTAssertEqual(users.first?.pets?.count, 1)
        XCTAssertEqual(users.first?.pets?.first?.name, "Tiny")
        XCTAssertNil(users.first?.pets?.first?.age)
    }

    func testQueryAliasParsing() throws {
        let query: _Operation<Query, (Partial<Person>, Partial<Person>)> = .query {
            $0.me(alias: "first") {
                $0.firstName
            }
            $0.me(alias: "second") {
                $0.lastName
            }
        }

        let response = Data("""
        {
            "data": {
                "first": {
                    "name": "Aaron",
                },
                "second": {
                    "lastName": "Bosnjak"
                },
            }
        }
        """.utf8)

        let (first, second) = try query.createResult(from: response)

        XCTAssertEqual(first.values.count, 1)
        XCTAssertNil(first.firstName)
        XCTAssertEqual(first.get(\.firstName, alias: "name"), "Aaron")
        XCTAssertNil(first.lastName)
        XCTAssertNil(first.age)
        XCTAssertNil(first.pets)
        XCTAssertNil(first.spouse)

        XCTAssertEqual(second.values.count, 1)
        XCTAssertNil(second.firstName)
        XCTAssertEqual(second.lastName, "Bosnjak")
        XCTAssertNil(second.age)
        XCTAssertNil(second.pets)
        XCTAssertNil(second.spouse)
    }

    func testQueryArgumentParsing() throws {
        let query: _Operation<Query, (Partial<Person>, Partial<Person>)> = .query {
            $0.user(alias: "first") {
                $0.firstName(alias: "name")
            }
            .id("321")
            .number(15)
            $0.user(alias: "second") {
                $0.lastName
            }
        }

        let response = Data("""
        {
            "data": {
                "first": {
                    "name": "Aaron",
                },
                "second": {
                    "lastName": "Bosnjak"
                },
            }
        }
        """.utf8)

        let (first, second) = try query.createResult(from: response)

        XCTAssertEqual(first.values.count, 1)
        XCTAssertNil(first.firstName)
        XCTAssertEqual(first.get(\.firstName, alias: "name"), "Aaron")
        XCTAssertNil(first.lastName)
        XCTAssertNil(first.age)
        XCTAssertNil(first.pets)
        XCTAssertNil(first.spouse)

        XCTAssertEqual(second.values.count, 1)
        XCTAssertNil(second.firstName)
        XCTAssertEqual(second.lastName, "Bosnjak")
        XCTAssertNil(second.age)
        XCTAssertNil(second.pets)
        XCTAssertNil(second.spouse)
    }

    func testQueryEnumParsing() throws {
        let query: _Operation<Query, Partial<Person>> = .query {
            $0.user {
                $0.pets {
                    $0.type
                    $0.friendlyWithTypes
                }
            }
        }

        let response = Data("""
        {
            "data": {
                "user": {
                    "pets": [
                        {
                            "type": "CAT",
                            "friendlyWithTypes": ["CAT", "DOG"]
                        }
                    ]
                },
            }
        }
        """.utf8)

        let user = try query.createResult(from: response)

        XCTAssertEqual(user.values.count, 1)
        XCTAssertNil(user.firstName)
        XCTAssertNil(user.lastName)
        XCTAssertNil(user.age)
        XCTAssertEqual(user.pets?.count, 1)
        XCTAssertEqual(user.pets?.first?.values.count, 2)
        XCTAssertEqual(user.pets?.first?.type, .cat)
        XCTAssertEqual(user.pets?.first?.friendlyWithTypes, [.cat, .dog])
        XCTAssertNil(user.spouse)
    }

    func testInputArgumentParsing() throws {
        let query: _Operation<Query, Partial<Person>> = .query {
            $0.user {
                $0.firstName
            }
            .number(15)
            .input {
                $0.prop(1)
                $0.nested {
                    $0.prop2("s")
                }
            }
        }

        let response = Data("""
        {
            "data": {
                "user": {
                    "firstName": "Aaron",
                }
            }
        }
        """.utf8)

        let user = try query.createResult(from: response)

        XCTAssertEqual(user.values.count, 1)
        XCTAssertEqual(user.firstName, "Aaron")
        XCTAssertNil(user.lastName)
        XCTAssertNil(user.age)
        XCTAssertNil(user.pets)
        XCTAssertNil(user.spouse)
    }

    func testFragmentParsing() throws {
        let ageFragment = Fragment("ageField", on: LivingThing.self) {
            $0.age(alias: "yearsOnEarth")
        }
        let namesFragment = Fragment("nameFields", on: Person.self) {
            $0.firstName
            $0.lastName
        }
        let petsFragment = Fragment("petField", on: Person.self) {
            $0.pets {
                $0.name
            }
        }

        let query: _Operation<Query, (Partial<Person>, Partial<Person>)> = .query {
            $0.user {
                namesFragment
                ageFragment
            }
            .id("321")
            $0.user(alias: "second") {
                $0.firstName
                ageFragment
                petsFragment
            }
        }

        let response = Data("""
        {
            "data": {
                "user": {
                    "firstName": "Aaron",
                    "lastName": "Bosnjak",
                    "yearsOnEarth": 26
                },
                "second": {
                    "firstName": "Ashley",
                    "yearsOnEarth": 26,
                    "pets": [
                        {
                            "name": "Tiny"
                        }
                    ]
                },
            }
        }
        """.utf8)

        let (user, second) = try query.createResult(from: response)

        XCTAssertEqual(user.values.count, 3)
        XCTAssertEqual(user.firstName, "Aaron")
        XCTAssertEqual(user.lastName, "Bosnjak")
        XCTAssertNil(user.age)
        XCTAssertEqual(user.get(\.age, alias: "yearsOnEarth"), 26)
        XCTAssertNil(user.pets)
        XCTAssertNil(user.spouse)

        XCTAssertEqual(second.values.count, 3)
        XCTAssertEqual(second.firstName, "Ashley")
        XCTAssertNil(second.lastName)
        XCTAssertNil(user.age)
        XCTAssertEqual(user.get(\.age, alias: "yearsOnEarth"), 26)
        XCTAssertEqual(second.pets?.count, 1)
        XCTAssertEqual(second.pets?.first?.name, "Tiny")
        XCTAssertNil(second.pets?.first?.age)
        XCTAssertNil(second.spouse)
    }

    static var allTests = [
        ("testQueryNameParsing", testQueryNameParsing),
        ("testQueryMultipleQueryField_SelectionSetParsing", testQueryMultipleQueryField_SelectionSetParsing),
        ("testQueryAliasParsing", testQueryAliasParsing),
        ("testQueryArgumentParsing", testQueryArgumentParsing),
        ("testInputArgumentParsing", testInputArgumentParsing),
        ("testFragmentParsing", testFragmentParsing)
    ]
}
*/
