@testable import Artemis

class Schema {
    final class Query: Object {
        @Field("object") var object: TestObject
        @Field("objectArgs") var objectArgs: (TestObject, TestArguments)
        @Field("objects") var objects: [TestObject]
        @Field("objectsArgs") var objectsArgs: ([TestObject], TestArguments)

        @Field("enum") var `enum`: TestEnum
        @Field("enumArgs") var enumArgs: (TestEnum, TestArguments)
        @Field("enums") var enums: [TestEnum]
        @Field("enumsArgs") var enumsArgs: ([TestEnum], TestArguments)

        @Field("int") var int: Int
        @Field("intArgs") var intArgs: (Int, TestArguments)
        @Field("ints") var ints: [Int]
        @Field("intsArgs") var intsArgs: ([Int], TestArguments)

        @Field("string") var string: String
        @Field("stringArgs") var stringArgs: (String, TestArguments)
        @Field("strings") var strings: [String]
        @Field("stringsArgs") var stringsArgs: ([String], TestArguments)

        @Field("bool") var bool: Bool
        @Field("boolArgs") var boolArgs: (Bool, TestArguments)
        @Field("bools") var bools: [Bool]
        @Field("boolsArgs") var boolsArgs: ([Bool], TestArguments)

        @Field("double") var double: Double
        @Field("doubleArgs") var doubleArgs: (Double, TestArguments)
        @Field("doubles") var doubles: [Double]
        @Field("doublesArgs") var doublesArgs: ([Double], TestArguments)

        @Field("float") var float: Float
        @Field("floatArgs") var floatArgs: (Float, TestArguments)
        @Field("floats") var floats: [Float]
        @Field("floatsArgs") var floatsArgs: ([Float], TestArguments)
    }

    final class TestObject: Object {
        @Field("object") var object: TestObject2
        @Field("objectArgs") var objectArgs: (TestObject2, TestArguments)
        @Field("objects") var objects: [TestObject2]
        @Field("objectsArgs") var objectsArgs: ([TestObject2], TestArguments)

        @Field("enum") var `enum`: TestEnum
        @Field("enumArgs") var enumArgs: (TestEnum, TestArguments)
        @Field("enums") var enums: [TestEnum]
        @Field("enumsArgs") var enumsArgs: ([TestEnum], TestArguments)

        @Field("int") var int: Int
        @Field("intArgs") var intArgs: (Int, TestArguments)
        @Field("ints") var ints: [Int]
        @Field("intsArgs") var intsArgs: ([Int], TestArguments)

        @Field("string") var string: String
        @Field("stringArgs") var stringArgs: (String, TestArguments)
        @Field("strings") var strings: [String]
        @Field("stringsArgs") var stringsArgs: ([String], TestArguments)

        @Field("bool") var bool: Bool
        @Field("boolArgs") var boolArgs: (Bool, TestArguments)
        @Field("bools") var bools: [Bool]
        @Field("boolsArgs") var boolsArgs: ([Bool], TestArguments)

        @Field("double") var double: Double
        @Field("doubleArgs") var doubleArgs: (Double, TestArguments)
        @Field("doubles") var doubles: [Double]
        @Field("doublesArgs") var doublesArgs: ([Double], TestArguments)

        @Field("float") var float: Float
        @Field("floatArgs") var floatArgs: (Float, TestArguments)
        @Field("floats") var floats: [Float]
        @Field("floatsArgs") var floatsArgs: ([Float], TestArguments)
    }

    final class TestObject2: Object {
        @Field("int2") var int2: Int
        @Field("intArgs2") var intArgs2: (Int, TestArguments)
    }

    final class TestInput: Input {
        @Field("object") var object: TestObject
        @Field("objectArgs") var objectArgs: (TestObject, TestArguments)
        @Field("objects") var objects: [TestObject]
        @Field("objectsArgs") var objectsArgs: ([TestObject], TestArguments)

        @Field("enum") var `enum`: TestEnum
        @Field("enumArgs") var enumArgs: (TestEnum, TestArguments)
        @Field("enums") var enums: [TestEnum]
        @Field("enumsArgs") var enumsArgs: ([TestEnum], TestArguments)

        @Field("int") var int: Int
        @Field("intArgs") var intArgs: (Int, TestArguments)
        @Field("ints") var ints: [Int]
        @Field("intsArgs") var intsArgs: ([Int], TestArguments)

        @Field("string") var string: String
        @Field("stringArgs") var stringArgs: (String, TestArguments)
        @Field("strings") var strings: [String]
        @Field("stringsArgs") var stringsArgs: ([String], TestArguments)

        @Field("bool") var bool: Bool
        @Field("boolArgs") var boolArgs: (Bool, TestArguments)
        @Field("bools") var bools: [Bool]
        @Field("boolsArgs") var boolsArgs: ([Bool], TestArguments)

        @Field("double") var double: Double
        @Field("doubleArgs") var doubleArgs: (Double, TestArguments)
        @Field("doubles") var doubles: [Double]
        @Field("doublesArgs") var doublesArgs: ([Double], TestArguments)

        @Field("float") var float: Float
        @Field("floatArgs") var floatArgs: (Float, TestArguments)
        @Field("floats") var floats: [Float]
        @Field("floatsArgs") var floatsArgs: ([Float], TestArguments)
    }

    enum TestEnum: String, Enum {
        case first
        case second
        case third
    }

    final class TestArguments: ArgumentsList {
        @Argument("enum") var `enum`: TestEnum
        @Argument("enums") var enums: [TestEnum]

        @Argument("int") var int: Int
        @Argument("ints") var ints: [Int]

        @Argument("string") var string: String
        @Argument("strings") var strings: [String]

        @Argument("bool") var bool: Bool
        @Argument("bools") var bools: [Bool]

        @Argument("double") var double: Double
        @Argument("doubles") var doubles: [Double]

        @Argument("float") var float: Float
        @Argument("floats") var floats: [Float]
    }
}
