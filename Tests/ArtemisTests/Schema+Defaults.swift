import Foundation

let testArgs = TestArguments.expectedTestRenderedString

extension TestArguments {
    static let testDefault = TestArguments(
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
            "input:\(TestInput.expectedTestRenderedString)," +
            "inputs:[\(TestInput.expectedTestRenderedString)]," +
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

extension TestInput {
    static let testDefault = TestInput(
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
            "input:\(TestInput.TestSubInput.expectedTestRenderedString)," +
            "inputs:[\(TestInput.TestSubInput.expectedTestRenderedString)]," +
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

extension TestInput.TestSubInput {
    static let testDefault = TestInput.TestSubInput(
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
