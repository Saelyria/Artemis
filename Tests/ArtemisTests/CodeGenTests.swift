import XCTest
@testable import Artemis

final class CodeGenTests: XCTestCase {
    func testGroupsLinesByEntity() {
        let schema = """
        type SomeType implements SomeInterface {
            field1: Int!
            field2(arg1: Int!): String
        }


        # comment that should be ignored
        \"\"\" documentation comment that should NOT be ignored \"\"\"
        input SomeSecondType {
            \"\"\"
            some comment
            \"\"\"
            field: Int
        }
        """
        
        let groupedLines = getLinesGroupedByEntity(in: schema.split(separator: "\n"))
        XCTAssert(groupedLines.count == 2)
        XCTAssert(groupedLines[0].count == 4)
        XCTAssert(groupedLines[1].count == 7)
    }
    
    func testExtractsTypeNameAndTypeAndInterfaces() {
        var line = "type SomeType implements SomeInterface, SomeSecondInterface {"
        var (type, name, interfaces) = try! getTypeNameAndInterfacesForEntity(line: line)
        XCTAssert(type == .object)
        XCTAssert(name == "SomeType")
        XCTAssert(interfaces.count == 2)
        XCTAssert(interfaces[0] == "SomeInterface")
        XCTAssert(interfaces[1] == "SomeSecondInterface")
        
        line = "input SomeInput {"
        (type, name, interfaces) = try! getTypeNameAndInterfacesForEntity(line: line)
        XCTAssert(type == .input)
        XCTAssert(name == "SomeInput")
        XCTAssert(interfaces.isEmpty)
        
        line = "enum SomeEnum {"
        (type, name, interfaces) = try! getTypeNameAndInterfacesForEntity(line: line)
        XCTAssert(type == .enum)
        XCTAssert(name == "SomeEnum")
        XCTAssert(interfaces.isEmpty)
        
        line = "scalar SomeScalar"
        (type, name, interfaces) = try! getTypeNameAndInterfacesForEntity(line: line)
        XCTAssert(type == .scalar)
        XCTAssert(name == "SomeScalar")
        XCTAssert(interfaces.isEmpty)
        
        line = "interface SomeInterface"
        (type, name, interfaces) = try! getTypeNameAndInterfacesForEntity(line: line)
        XCTAssert(type == .interface)
        XCTAssert(name == "SomeInterface")
        XCTAssert(interfaces.isEmpty)
    }
    
    func testCreatesEntityFromGroupedLines() {
        let lines1 = [
            "type SomeType implements SomeInterface {",
                "\"\"\" a field \"\"\"",
                "field1: Int!",
                "field2(",
                    "arg1: Int",
                    "arg2: String!",
                "): String",
            "}"
        ]
        
        let lines2 = [
            "\"\"\" documentation comment that should NOT be ignored \"\"\"",
            "input SomeSecondType {",
                "field1: Int!",
            "}"
        ]
        
        let entities = try! createEntities(fromGroupedLines: [lines1, lines2])
        XCTAssert(entities.count == 2)
        
        XCTAssert(entities[0].entityType == .object)
        XCTAssert(entities[0].documentation.isEmpty)
        XCTAssert(entities[0].fields.count == 2)
        XCTAssert(entities[0].fields[0].name == "field1")
        XCTAssert(entities[0].fields[0].type == "Int")
        XCTAssert(entities[0].fields[0].documentation.count == 1)
        XCTAssert(entities[0].fields[0].documentation[0] == "a field")
        XCTAssert(entities[0].fields[1].name == "field2")
        XCTAssert(entities[0].fields[1].type == "String?")
        XCTAssert(entities[0].fields[1].documentation.isEmpty)
    }
    
    func testSwiftFileGeneration() {
        let schema = """
        type SomeType implements SomeInterface {
            field1: Int!
            field2(arg1: Int!, arg2: Int): String
        }


        # comment that should be ignored
        \"\"\" documentation comment that should NOT be ignored \"\"\"
        input SomeInput {
            field: Int
        }

        interface SomeInterface {
            field1: Int!
        }

        enum SomeEnum {
            \"\"\"
            some comment
            \"\"\"
            case1
            case2
        }
        """
        
        let swiftFile = try! generateSwiftFile(from: schema)
        XCTAssert(swiftFile == """
        final class SomeType: Object, ObjectSchema {
           static let implements = Interfaces(SomeInterface.self)

           var field1 = Field<Int, NoArguments>("field1")

           var field2 = Field<String?, Field2Arguments>("field2", Field2Arguments.self)
           final class Field2Arguments: ArgumentsList {
              var arg1 = Argument<Int>("arg1")
              var arg2 = Argument<Int?>("arg2")
           }
        }

        /**
         documentation comment that should NOT be ignored
        */
        final class SomeInput: Input, ObjectSchema {
           var field: Int?
        }

        final class SomeInterface: Interface {

           var field1 = Field<Int, NoArguments>("field1")
        }

        enum SomeEnum: String, Enum {
           /**
            some comment
           */
           case case1 = "case1"
           case case2 = "case2"
        }

        
        """, "Generated swift file was '\(swiftFile)'")
    }

    static var allTests = [
        ("testGroupsLinesByEntity", testGroupsLinesByEntity),
        ("testExtractsTypeNameAndTypeAndInterfaces", testExtractsTypeNameAndTypeAndInterfaces),
		("testCreatesEntityFromGroupedLines", testCreatesEntityFromGroupedLines),
		("testSwiftFileGeneration", testSwiftFileGeneration)
    ]
}
