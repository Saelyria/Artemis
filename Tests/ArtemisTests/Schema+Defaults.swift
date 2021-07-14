import Foundation

let testArgs = Schema.TestArguments.expectedTestRenderedString

extension Schema.TestArguments {
    static let testDefault = Schema.TestArguments(
        input: .testDefault,
        inputs: [.testDefault],
        enum: .first,
        enums: [.first, .first],
        int: 123,
        ints: [123, 321],
        string: "123",
        strings: ["123", "321"],
        bool: true,
        bools: [true, false],
        double: 1.1,
        doubles: [1.1, 2.2],
        float: 1.1,
        floats: [1.1, 2.2]
    )

    static let expectedTestRenderedString: String = {
        return "(" +
            "input:\(Schema.TestInput.expectedTestRenderedString)," +
            "inputs:[\(Schema.TestInput.expectedTestRenderedString)]," +
            "enum:FIRST," +
            "enums:[FIRST,FIRST]," +
            "int:123," +
            "ints:[123,321]," +
            "string:\"123\"," +
            "strings:[\"123\",\"321\"]," +
            "bool:true," +
            "bools:[true,false]," +
            "double:1.1," +
            "doubles:[1.1,2.2]," +
            "float:1.1," +
            "floats:[1.1,2.2]" +
            ")"
    }()
}

extension Schema.TestInput {
    static let testDefault = Schema.TestInput(
        input: .testDefault,
        inputs: [.testDefault],
        enum: .second,
        enums: [.second, .second],
        int: 234,
        ints: [234, 432],
        string: "234",
        strings: ["234", "432"],
        bool: true,
        bools: [true, false],
        double: 1.11,
        doubles: [1.11, 2.22],
        float: 1.11,
        floats: [1.11, 2.22]
    )

    static let expectedTestRenderedString: String = {
        return "{" +
            "input:\(Schema.TestInput.TestSubInput.expectedTestRenderedString)," +
            "inputs:[\(Schema.TestInput.TestSubInput.expectedTestRenderedString)]," +
            "enum:SECOND," +
            "enums:[SECOND,SECOND]," +
            "int:234," +
            "ints:[234,432]," +
            "string:\"234\"," +
            "strings:[\"234\",\"432\"]," +
            "bool:true," +
            "bools:[true,false]," +
            "double:1.11," +
            "doubles:[1.11,2.22]," +
            "float:1.11," +
            "floats:[1.11,2.22]" +
            "}"
    }()
}

extension Schema.TestInput.TestSubInput {
    static let testDefault = Schema.TestInput.TestSubInput(
        enum: .third,
        enums: [.third, .third],
        int: 345,
        ints: [345, 543],
        string: "345",
        strings: ["345", "543"],
        bool: true,
        bools: [true, false],
        double: 1.111,
        doubles: [1.111, 2.222],
        float: 1.111,
        floats: [1.111, 2.222]
    )

    static let expectedTestRenderedString: String = {
        return "{" +
            "enum:THIRD," +
            "enums:[THIRD,THIRD]," +
            "int:345," +
            "ints:[345,543]," +
            "string:\"345\"," +
            "strings:[\"345\",\"543\"]," +
            "bool:true," +
            "bools:[true,false]," +
            "double:1.111," +
            "doubles:[1.111,2.222]," +
            "float:1.111," +
            "floats:[1.111,2.222]" +
            "}"
    }()
}
