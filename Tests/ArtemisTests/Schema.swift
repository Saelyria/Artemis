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
        static let implements = Interfaces(
            TestInterface1.self,
            TestInterface2.self,
            TestInterface3.self,
            TestInterface4.self,
            TestInterface5.self
        )

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

    final class TestInput: Input {
        @Field("input") var input: TestInput
        @Field("inputs") var inputs: [TestInput]

        @Field("enum") var `enum`: TestEnum
        @Field("enums") var enums: [TestEnum]

        @Field("int") var int: Int
        @Field("ints") var ints: [Int]

        @Field("string") var string: String
        @Field("strings") var strings: [String]

        @Field("bool") var bool: Bool
        @Field("bools") var bools: [Bool]

        @Field("double") var double: Double
        @Field("doubles") var doubles: [Double]

        @Field("float") var float: Float
        @Field("floats") var floats: [Float]
    }

    enum TestEnum: String, Enum {
        case first
        case second
        case third
    }

    final class TestArguments: ArgumentsList {
        @Argument("input") var input: TestInput
        @Argument("inputs") var inputs: [TestInput]

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

extension Schema {
    final class TestInterface1: Interface {
        @Field("i1_object") var i1_object: TestObject
        @Field("i1_objectArgs") var i1_objectArgs: (TestObject, TestArguments)
        @Field("i1_objects") var i1_objects: [TestObject]
        @Field("i1_objectsArgs") var i1_objectsArgs: ([TestObject], TestArguments)

        @Field("i1_enum") var i1_enum: TestEnum
        @Field("i1_enumArgs") var i1_enumArgs: (TestEnum, TestArguments)
        @Field("i1_enums") var i1_enums: [TestEnum]
        @Field("i1_enumsArgs") var i1_enumsArgs: ([TestEnum], TestArguments)

        @Field("i1_int") var i1_int: Int
        @Field("i1_intArgs") var i1_intArgs: (Int, TestArguments)
        @Field("i1_ints") var i1_ints: [Int]
        @Field("i1_intsArgs") var i1_intsArgs: ([Int], TestArguments)

        @Field("string") var i1_string: String
        @Field("stringArgs") var i1_stringArgs: (String, TestArguments)
        @Field("strings") var i1_strings: [String]
        @Field("stringsArgs") var i1_stringsArgs: ([String], TestArguments)

        @Field("i1_bool") var i1_bool: Bool
        @Field("i1_boolArgs") var i1_boolArgs: (Bool, TestArguments)
        @Field("i1_bools") var i1_bools: [Bool]
        @Field("i1_boolsArgs") var i1_boolsArgs: ([Bool], TestArguments)

        @Field("i1_double") var i1_double: Double
        @Field("i1_doubleArgs") var i1_doubleArgs: (Double, TestArguments)
        @Field("i1_doubles") var i1_doubles: [Double]
        @Field("i1_doublesArgs") var i1_doublesArgs: ([Double], TestArguments)

        @Field("i1_float") var i1_float: Float
        @Field("i1_floatArgs") var i1_floatArgs: (Float, TestArguments)
        @Field("i1_floats") var i1_floats: [Float]
        @Field("i1_floatsArgs") var i1_floatsArgs: ([Float], TestArguments)
    }

    final class TestInterface2: Interface {
        @Field("i2_object") var i2_object: TestObject
        @Field("i2_objectArgs") var i2_objectArgs: (TestObject, TestArguments)
        @Field("i2_objects") var i2_objects: [TestObject]
        @Field("i2_objectsArgs") var i2_objectsArgs: ([TestObject], TestArguments)

        @Field("i2_enum") var i2_enum: TestEnum
        @Field("i2_enumArgs") var i2_enumArgs: (TestEnum, TestArguments)
        @Field("i2_enums") var i2_enums: [TestEnum]
        @Field("i2_enumsArgs") var i2_enumsArgs: ([TestEnum], TestArguments)

        @Field("i2_int") var i2_int: Int
        @Field("i2_intArgs") var i2_intArgs: (Int, TestArguments)
        @Field("i2_ints") var i2_ints: [Int]
        @Field("i2_intsArgs") var i2_intsArgs: ([Int], TestArguments)

        @Field("i2_string") var i2_string: String
        @Field("i2_stringArgs") var i2_stringArgs: (String, TestArguments)
        @Field("i2_strings") var i2_strings: [String]
        @Field("i2_stringsArgs") var i2_stringsArgs: ([String], TestArguments)

        @Field("i2_bool") var i2_bool: Bool
        @Field("i2_boolArgs") var i2_boolArgs: (Bool, TestArguments)
        @Field("i2_bools") var i2_bools: [Bool]
        @Field("i2_boolsArgs") var i2_boolsArgs: ([Bool], TestArguments)

        @Field("i2_double") var i2_double: Double
        @Field("i2_doubleArgs") var i2_doubleArgs: (Double, TestArguments)
        @Field("i2_doubles") var i2_doubles: [Double]
        @Field("i2_doublesArgs") var i2_doublesArgs: ([Double], TestArguments)

        @Field("i2_float") var i2_float: Float
        @Field("i2_floatArgs") var i2_floatArgs: (Float, TestArguments)
        @Field("i2_floats") var i2_floats: [Float]
        @Field("i2_floatsArgs") var i2_floatsArgs: ([Float], TestArguments)
    }

    final class TestInterface3: Interface {
        @Field("i3_object") var i3_object: TestObject
        @Field("i3_objectArgs") var i3_objectArgs: (TestObject, TestArguments)
        @Field("i3_objects") var i3_objects: [TestObject]
        @Field("i3_objectsArgs") var i3_objectsArgs: ([TestObject], TestArguments)

        @Field("i3_enum") var i3_enum: TestEnum
        @Field("i3_enumArgs") var i3_enumArgs: (TestEnum, TestArguments)
        @Field("i3_enums") var i3_enums: [TestEnum]
        @Field("i3_enumsArgs") var i3_enumsArgs: ([TestEnum], TestArguments)

        @Field("i3_int") var i3_int: Int
        @Field("i3_intArgs") var i3_intArgs: (Int, TestArguments)
        @Field("i3_ints") var i3_ints: [Int]
        @Field("i3_intsArgs") var i3_intsArgs: ([Int], TestArguments)

        @Field("i3_string") var i3_string: String
        @Field("i3_stringArgs") var i3_stringArgs: (String, TestArguments)
        @Field("i3_strings") var i3_strings: [String]
        @Field("i3_stringsArgs") var i3_stringsArgs: ([String], TestArguments)

        @Field("i3_bool") var i3_bool: Bool
        @Field("i3_boolArgs") var i3_boolArgs: (Bool, TestArguments)
        @Field("i3_bools") var i3_bools: [Bool]
        @Field("i3_boolsArgs") var i3_boolsArgs: ([Bool], TestArguments)

        @Field("i3_double") var i3_double: Double
        @Field("i3_doubleArgs") var i3_doubleArgs: (Double, TestArguments)
        @Field("i3_doubles") var i3_doubles: [Double]
        @Field("i3_doublesArgs") var i3_doublesArgs: ([Double], TestArguments)

        @Field("i3_float") var i3_float: Float
        @Field("i3_floatArgs") var i3_floatArgs: (Float, TestArguments)
        @Field("i3_floats") var i3_floats: [Float]
        @Field("i3_floatsArgs") var i3_floatsArgs: ([Float], TestArguments)
    }

    final class TestInterface4: Interface {
        @Field("i4_object") var i4_object: TestObject
        @Field("i4_objectArgs") var i4_objectArgs: (TestObject, TestArguments)
        @Field("i4_objects") var i4_objects: [TestObject]
        @Field("i4_objectsArgs") var i4_objectsArgs: ([TestObject], TestArguments)

        @Field("i4_enum") var i4_enum: TestEnum
        @Field("i4_enumArgs") var i4_enumArgs: (TestEnum, TestArguments)
        @Field("i4_enums") var i4_enums: [TestEnum]
        @Field("i4_enumsArgs") var i4_enumsArgs: ([TestEnum], TestArguments)

        @Field("i4_int") var i4_int: Int
        @Field("i4_intArgs") var i4_intArgs: (Int, TestArguments)
        @Field("i4_ints") var i4_ints: [Int]
        @Field("i4_intsArgs") var i4_intsArgs: ([Int], TestArguments)

        @Field("i4_string") var i4_string: String
        @Field("i4_stringArgs") var i4_stringArgs: (String, TestArguments)
        @Field("i4_strings") var i4_strings: [String]
        @Field("i4_stringsArgs") var i4_stringsArgs: ([String], TestArguments)

        @Field("i4_bool") var i4_bool: Bool
        @Field("i4_boolArgs") var i4_boolArgs: (Bool, TestArguments)
        @Field("i4_bools") var i4_bools: [Bool]
        @Field("i4_boolsArgs") var i4_boolsArgs: ([Bool], TestArguments)

        @Field("i4_double") var i4_double: Double
        @Field("i4_doubleArgs") var i4_doubleArgs: (Double, TestArguments)
        @Field("i4_doubles") var i4_doubles: [Double]
        @Field("i4_doublesArgs") var i4_doublesArgs: ([Double], TestArguments)

        @Field("i4_float") var i4_float: Float
        @Field("i4_floatArgs") var i4_floatArgs: (Float, TestArguments)
        @Field("i4_floats") var i4_floats: [Float]
        @Field("i4_floatsArgs") var i4_floatsArgs: ([Float], TestArguments)
    }

    final class TestInterface5: Interface {
        @Field("i5_object") var i5_object: TestObject
        @Field("i5_objectArgs") var i5_objectArgs: (TestObject, TestArguments)
        @Field("i5_objects") var i5_objects: [TestObject]
        @Field("i5_objectsArgs") var i5_objectsArgs: ([TestObject], TestArguments)

        @Field("i5_enum") var i5_enum: TestEnum
        @Field("i5_enumArgs") var i5_enumArgs: (TestEnum, TestArguments)
        @Field("i5_enums") var i5_enums: [TestEnum]
        @Field("i5_enumsArgs") var i5_enumsArgs: ([TestEnum], TestArguments)

        @Field("i5_int") var i5_int: Int
        @Field("i5_intArgs") var i5_intArgs: (Int, TestArguments)
        @Field("i5_ints") var i5_ints: [Int]
        @Field("i5_intsArgs") var i5_intsArgs: ([Int], TestArguments)

        @Field("i5_string") var i5_string: String
        @Field("i5_stringArgs") var i5_stringArgs: (String, TestArguments)
        @Field("i5_strings") var i5_strings: [String]
        @Field("i5_stringsArgs") var i5_stringsArgs: ([String], TestArguments)

        @Field("i5_bool") var i5_bool: Bool
        @Field("i5_boolArgs") var i5_boolArgs: (Bool, TestArguments)
        @Field("i5_bools") var i5_bools: [Bool]
        @Field("i5_boolsArgs") var i5_boolsArgs: ([Bool], TestArguments)

        @Field("i5_double") var i5_double: Double
        @Field("i5_doubleArgs") var i5_doubleArgs: (Double, TestArguments)
        @Field("i5_doubles") var i5_doubles: [Double]
        @Field("i5_doublesArgs") var i5_doublesArgs: ([Double], TestArguments)

        @Field("i5_float") var i5_float: Float
        @Field("i5_floatArgs") var i5_floatArgs: (Float, TestArguments)
        @Field("i5_floats") var i5_floats: [Float]
        @Field("i5_floatsArgs") var i5_floatsArgs: ([Float], TestArguments)
    }
}
