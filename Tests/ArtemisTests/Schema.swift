@testable import Artemis

final class Query: Object {
    static let implements = Interfaces(
        TestInterface1.self,
        TestInterface2.self,
        TestInterface3.self,
        TestInterface4.self,
        TestInterface5.self
    )

    @Field("testObject") var testObject: TestObject
    @Field("testObjectArgs") var testObjectArgs: (TestObject, TestArguments.Type)
    @Field("testObjects") var testObjects: [TestObject]
    @Field("testObjectsArgs") var testObjectsArgs: ([TestObject], TestArguments.Type)

    @Field("testEnum") var testEnum: TestEnum
    @Field("testEnumArgs") var testEnumArgs: (TestEnum, TestArguments.Type)
    @Field("testEnums") var testEnums: [TestEnum]
    @Field("testEnumsArgs") var testEnumsArgs: ([TestEnum], TestArguments.Type)

    @Field("int") var int: Int
    @Field("intArgs") var intArgs: (Int, TestArguments.Type)
    @Field("ints") var ints: [Int]
    @Field("intsArgs") var intsArgs: ([Int], TestArguments.Type)

    @Field("string") var string: String
    @Field("stringArgs") var stringArgs: (String, TestArguments.Type)
    @Field("strings") var strings: [String]
    @Field("stringsArgs") var stringsArgs: ([String], TestArguments.Type)

    @Field("bool") var bool: Bool
    @Field("boolArgs") var boolArgs: (Bool, TestArguments.Type)
    @Field("bools") var bools: [Bool]
    @Field("boolsArgs") var boolsArgs: ([Bool], TestArguments.Type)

    @Field("double") var double: Double
    @Field("doubleArgs") var doubleArgs: (Double, TestArguments.Type)
    @Field("doubles") var doubles: [Double]
    @Field("doublesArgs") var doublesArgs: ([Double], TestArguments.Type)

    @Field("float") var float: Float
    @Field("floatArgs") var floatArgs: (Float, TestArguments.Type)
    @Field("floats") var floats: [Float]
    @Field("floatsArgs") var floatsArgs: ([Float], TestArguments.Type)
}

final class TestObject: Object {
    static let implements = Interfaces(
        TestInterface1.self,
        TestInterface2.self,
        TestInterface3.self,
        TestInterface4.self,
        TestInterface5.self
    )

    @Field("testObject") var testObject: TestObject
    @Field("testObjectArgs") var testObjectArgs: (TestObject, TestArguments.Type)
    @Field("testObjects") var testObjects: [TestObject]
    @Field("testObjectsArgs") var testObjectsArgs: ([TestObject], TestArguments.Type)

    @Field("testEnum") var testEnum: TestEnum
    @Field("testEnumArgs") var testEnumArgs: (TestEnum, TestArguments.Type)
    @Field("testEnums") var testEnums: [TestEnum]
    @Field("testEnumsArgs") var testEnumsArgs: ([TestEnum], TestArguments.Type)

    @Field("int") var int: Int
    @Field("intArgs") var intArgs: (Int, TestArguments.Type)
    @Field("ints") var ints: [Int]
    @Field("intsArgs") var intsArgs: ([Int], TestArguments.Type)

    @Field("string") var string: String
    @Field("stringArgs") var stringArgs: (String, TestArguments.Type)
    @Field("strings") var strings: [String]
    @Field("stringsArgs") var stringsArgs: ([String], TestArguments.Type)

    @Field("bool") var bool: Bool
    @Field("boolArgs") var boolArgs: (Bool, TestArguments.Type)
    @Field("bools") var bools: [Bool]
    @Field("boolsArgs") var boolsArgs: ([Bool], TestArguments.Type)

    @Field("double") var double: Double
    @Field("doubleArgs") var doubleArgs: (Double, TestArguments.Type)
    @Field("doubles") var doubles: [Double]
    @Field("doublesArgs") var doublesArgs: ([Double], TestArguments.Type)

    @Field("float") var float: Float
    @Field("floatArgs") var floatArgs: (Float, TestArguments.Type)
    @Field("floats") var floats: [Float]
    @Field("floatsArgs") var floatsArgs: ([Float], TestArguments.Type)
}

struct TestInput: Input {
    struct TestSubInput: Input {
        var `enum`: TestEnum
        var enums: [TestEnum]

        var int: Int
        var ints: [Int]

        var string: String
        var strings: [String]

        var bool: Bool
        var bools: [Bool]

        var double: Double
        var doubles: [Double]

        var float: Float
        var floats: [Float]
    }

    var input: TestSubInput
    var inputs: [TestSubInput]

    var `enum`: TestEnum
    var enums: [TestEnum]

    var int: Int
    var ints: [Int]

    var string: String
    var strings: [String]

    var bool: Bool
    var bools: [Bool]

    var double: Double
    var doubles: [Double]

    var float: Float
    var floats: [Float]
}

enum TestEnum: String, Enum {
    case first = "FIRST"
    case second = "SECOND"
    case third = "THIRD"
}

struct TestArguments: ArgumentsList {
    var input: TestInput
    var inputs: [TestInput]

    var `enum`: TestEnum
    var enums: [TestEnum]

    var int: Int
    var ints: [Int]

    var string: String
    var strings: [String]

    var bool: Bool
    var bools: [Bool]

    var double: Double
    var doubles: [Double]

    var float: Float
    var floats: [Float]
}

final class TestInterface1: Interface {
    @Field("i1_testObject") var i1_testObject: TestObject
    @Field("i1_testObjectArgs") var i1_testObjectArgs: (TestObject, TestArguments.Type)
    @Field("i1_testObjects") var i1_testObjects: [TestObject]
    @Field("i1_testObjectsArgs") var i1_testObjectsArgs: ([TestObject], TestArguments.Type)

    @Field("i1_testEnum") var i1_testEnum: TestEnum
    @Field("i1_testEnumArgs") var i1_testEnumArgs: (TestEnum, TestArguments.Type)
    @Field("i1_testEnums") var i1_testEnums: [TestEnum]
    @Field("i1_testEnumsArgs") var i1_testEnumsArgs: ([TestEnum], TestArguments.Type)

    @Field("i1_int") var i1_int: Int
    @Field("i1_intArgs") var i1_intArgs: (Int, TestArguments.Type)
    @Field("i1_ints") var i1_ints: [Int]
    @Field("i1_intsArgs") var i1_intsArgs: ([Int], TestArguments.Type)

    @Field("i1_string") var i1_string: String
    @Field("i1_stringArgs") var i1_stringArgs: (String, TestArguments.Type)
    @Field("i1_strings") var i1_strings: [String]
    @Field("i1_stringsArgs") var i1_stringsArgs: ([String], TestArguments.Type)

    @Field("i1_bool") var i1_bool: Bool
    @Field("i1_boolArgs") var i1_boolArgs: (Bool, TestArguments.Type)
    @Field("i1_bools") var i1_bools: [Bool]
    @Field("i1_boolsArgs") var i1_boolsArgs: ([Bool], TestArguments.Type)

    @Field("i1_double") var i1_double: Double
    @Field("i1_doubleArgs") var i1_doubleArgs: (Double, TestArguments.Type)
    @Field("i1_doubles") var i1_doubles: [Double]
    @Field("i1_doublesArgs") var i1_doublesArgs: ([Double], TestArguments.Type)

    @Field("i1_float") var i1_float: Float
    @Field("i1_floatArgs") var i1_floatArgs: (Float, TestArguments.Type)
    @Field("i1_floats") var i1_floats: [Float]
    @Field("i1_floatsArgs") var i1_floatsArgs: ([Float], TestArguments.Type)
}

final class TestInterface2: Interface {
    @Field("i2_testObject") var i2_testObject: TestObject
    @Field("i2_testObjectArgs") var i2_testObjectArgs: (TestObject, TestArguments.Type)
    @Field("i2_testObjects") var i2_testObjects: [TestObject]
    @Field("i2_testObjectsArgs") var i2_testObjectsArgs: ([TestObject], TestArguments.Type)

    @Field("i2_testEnum") var i2_testEnum: TestEnum
    @Field("i2_testEnumArgs") var i2_testEnumArgs: (TestEnum, TestArguments.Type)
    @Field("i2_testEnums") var i2_testEnums: [TestEnum]
    @Field("i2_testEnumsArgs") var i2_testEnumsArgs: ([TestEnum], TestArguments.Type)

    @Field("i2_int") var i2_int: Int
    @Field("i2_intArgs") var i2_intArgs: (Int, TestArguments.Type)
    @Field("i2_ints") var i2_ints: [Int]
    @Field("i2_intsArgs") var i2_intsArgs: ([Int], TestArguments.Type)

    @Field("i2_string") var i2_string: String
    @Field("i2_stringArgs") var i2_stringArgs: (String, TestArguments.Type)
    @Field("i2_strings") var i2_strings: [String]
    @Field("i2_stringsArgs") var i2_stringsArgs: ([String], TestArguments.Type)

    @Field("i2_bool") var i2_bool: Bool
    @Field("i2_boolArgs") var i2_boolArgs: (Bool, TestArguments.Type)
    @Field("i2_bools") var i2_bools: [Bool]
    @Field("i2_boolsArgs") var i2_boolsArgs: ([Bool], TestArguments.Type)

    @Field("i2_double") var i2_double: Double
    @Field("i2_doubleArgs") var i2_doubleArgs: (Double, TestArguments.Type)
    @Field("i2_doubles") var i2_doubles: [Double]
    @Field("i2_doublesArgs") var i2_doublesArgs: ([Double], TestArguments.Type)

    @Field("i2_float") var i2_float: Float
    @Field("i2_floatArgs") var i2_floatArgs: (Float, TestArguments.Type)
    @Field("i2_floats") var i2_floats: [Float]
    @Field("i2_floatsArgs") var i2_floatsArgs: ([Float], TestArguments.Type)
}

final class TestInterface3: Interface {
    @Field("i3_testObject") var i3_testObject: TestObject
    @Field("i3_testObjectArgs") var i3_testObjectArgs: (TestObject, TestArguments.Type)
    @Field("i3_testObjects") var i3_testObjects: [TestObject]
    @Field("i3_testObjectsArgs") var i3_testObjectsArgs: ([TestObject], TestArguments.Type)

    @Field("i3_testEnum") var i3_testEnum: TestEnum
    @Field("i3_testEnumArgs") var i3_testEnumArgs: (TestEnum, TestArguments.Type)
    @Field("i3_testEnums") var i3_testEnums: [TestEnum]
    @Field("i3_testEnumsArgs") var i3_testEnumsArgs: ([TestEnum], TestArguments.Type)

    @Field("i3_int") var i3_int: Int
    @Field("i3_intArgs") var i3_intArgs: (Int, TestArguments.Type)
    @Field("i3_ints") var i3_ints: [Int]
    @Field("i3_intsArgs") var i3_intsArgs: ([Int], TestArguments.Type)

    @Field("i3_string") var i3_string: String
    @Field("i3_stringArgs") var i3_stringArgs: (String, TestArguments.Type)
    @Field("i3_strings") var i3_strings: [String]
    @Field("i3_stringsArgs") var i3_stringsArgs: ([String], TestArguments.Type)

    @Field("i3_bool") var i3_bool: Bool
    @Field("i3_boolArgs") var i3_boolArgs: (Bool, TestArguments.Type)
    @Field("i3_bools") var i3_bools: [Bool]
    @Field("i3_boolsArgs") var i3_boolsArgs: ([Bool], TestArguments.Type)

    @Field("i3_double") var i3_double: Double
    @Field("i3_doubleArgs") var i3_doubleArgs: (Double, TestArguments.Type)
    @Field("i3_doubles") var i3_doubles: [Double]
    @Field("i3_doublesArgs") var i3_doublesArgs: ([Double], TestArguments.Type)

    @Field("i3_float") var i3_float: Float
    @Field("i3_floatArgs") var i3_floatArgs: (Float, TestArguments.Type)
    @Field("i3_floats") var i3_floats: [Float]
    @Field("i3_floatsArgs") var i3_floatsArgs: ([Float], TestArguments.Type)
}

final class TestInterface4: Interface {
    @Field("i4_testObject") var i4_testObject: TestObject
    @Field("i4_testObjectArgs") var i4_testObjectArgs: (TestObject, TestArguments.Type)
    @Field("i4_testObjects") var i4_testObjects: [TestObject]
    @Field("i4_testObjectsArgs") var i4_testObjectsArgs: ([TestObject], TestArguments.Type)

    @Field("i4_testEnum") var i4_testEnum: TestEnum
    @Field("i4_testEnumArgs") var i4_testEnumArgs: (TestEnum, TestArguments.Type)
    @Field("i4_testEnums") var i4_testEnums: [TestEnum]
    @Field("i4_testEnumsArgs") var i4_testEnumsArgs: ([TestEnum], TestArguments.Type)

    @Field("i4_int") var i4_int: Int
    @Field("i4_intArgs") var i4_intArgs: (Int, TestArguments.Type)
    @Field("i4_ints") var i4_ints: [Int]
    @Field("i4_intsArgs") var i4_intsArgs: ([Int], TestArguments.Type)

    @Field("i4_string") var i4_string: String
    @Field("i4_stringArgs") var i4_stringArgs: (String, TestArguments.Type)
    @Field("i4_strings") var i4_strings: [String]
    @Field("i4_stringsArgs") var i4_stringsArgs: ([String], TestArguments.Type)

    @Field("i4_bool") var i4_bool: Bool
    @Field("i4_boolArgs") var i4_boolArgs: (Bool, TestArguments.Type)
    @Field("i4_bools") var i4_bools: [Bool]
    @Field("i4_boolsArgs") var i4_boolsArgs: ([Bool], TestArguments.Type)

    @Field("i4_double") var i4_double: Double
    @Field("i4_doubleArgs") var i4_doubleArgs: (Double, TestArguments.Type)
    @Field("i4_doubles") var i4_doubles: [Double]
    @Field("i4_doublesArgs") var i4_doublesArgs: ([Double], TestArguments.Type)

    @Field("i4_float") var i4_float: Float
    @Field("i4_floatArgs") var i4_floatArgs: (Float, TestArguments.Type)
    @Field("i4_floats") var i4_floats: [Float]
    @Field("i4_floatsArgs") var i4_floatsArgs: ([Float], TestArguments.Type)
}

final class TestInterface5: Interface {
    @Field("i5_testObject") var i5_testObject: TestObject
    @Field("i5_testObjectArgs") var i5_testObjectArgs: (TestObject, TestArguments.Type)
    @Field("i5_testObjects") var i5_testObjects: [TestObject]
    @Field("i5_testObjectsArgs") var i5_testObjectsArgs: ([TestObject], TestArguments.Type)

    @Field("i5_testEnum") var i5_testEnum: TestEnum
    @Field("i5_testEnumArgs") var i5_testEnumArgs: (TestEnum, TestArguments.Type)
    @Field("i5_testEnums") var i5_testEnums: [TestEnum]
    @Field("i5_testEnumsArgs") var i5_testEnumsArgs: ([TestEnum], TestArguments.Type)

    @Field("i5_int") var i5_int: Int
    @Field("i5_intArgs") var i5_intArgs: (Int, TestArguments.Type)
    @Field("i5_ints") var i5_ints: [Int]
    @Field("i5_intsArgs") var i5_intsArgs: ([Int], TestArguments.Type)

    @Field("i5_string") var i5_string: String
    @Field("i5_stringArgs") var i5_stringArgs: (String, TestArguments.Type)
    @Field("i5_strings") var i5_strings: [String]
    @Field("i5_stringsArgs") var i5_stringsArgs: ([String], TestArguments.Type)

    @Field("i5_bool") var i5_bool: Bool
    @Field("i5_boolArgs") var i5_boolArgs: (Bool, TestArguments.Type)
    @Field("i5_bools") var i5_bools: [Bool]
    @Field("i5_boolsArgs") var i5_boolsArgs: ([Bool], TestArguments.Type)

    @Field("i5_double") var i5_double: Double
    @Field("i5_doubleArgs") var i5_doubleArgs: (Double, TestArguments.Type)
    @Field("i5_doubles") var i5_doubles: [Double]
    @Field("i5_doublesArgs") var i5_doublesArgs: ([Double], TestArguments.Type)

    @Field("i5_float") var i5_float: Float
    @Field("i5_floatArgs") var i5_floatArgs: (Float, TestArguments.Type)
    @Field("i5_floats") var i5_floats: [Float]
    @Field("i5_floatsArgs") var i5_floatsArgs: ([Float], TestArguments.Type)
}