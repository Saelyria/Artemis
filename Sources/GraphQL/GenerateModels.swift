import Foundation

private class _Entity {
    enum _EntityType: String {
        case object = "type"
        case input = "input"
        case `enum` = "enum"
        case scalar = "scalar"
        case schema = "schema"
    }
    var name: String = ""
    var fields: [_Field] = []
    var interfaces: [String] = []
    var entityType: _EntityType = .object
    var documentation: [String] = []
}

private class _Field {
    struct _Argument {
        let name: String
        let type: String
    }
    
    var name: String = ""
    var type: String = ""
    var documentation: [String] = []
    var arguments: [_Argument] = []
}


public func generateSwiftFile(from graphQLFile: String) -> String {
    // First, create an array of each line of the file
    let lines = graphQLFile.split(separator: "\n")

    let linesGroupedByEntity: [[String]] = getLinesGroupedByEntity(in: lines)
    let entities: [_Entity] = createEntities(fromGroupedLines: linesGroupedByEntity)
    
    var swiftFileLines: [String] = []
    for entity in entities {
        swiftFileLines.append(contentsOf: createSwiftTypeLines(from: entity))
        swiftFileLines.append("\n")
    }
    
    return swiftFileLines.reduce(into: "") { (result, line) in
        result.append(line)
        if line != "\n" {
            result.append("\n")
        }
    }
}

// MARK: - Intermediate entity generation from GraphQL schema

func getLinesGroupedByEntity(in lines: [Substring]) -> [[String]] {
    // Now, group the lines into the 'entity' (e.g. type, enum, input, etc) that they're associated with. Each 'entity'
    // at this point is an array of associated lines.
    var linesGroupedByEntity: [[String]] = []
    var entityLinesBeingAddedTo: [String]?
    var isBuildingDocumentation = false
    for line in lines {
        // if the line contains """ and it's not a single-line comment (e.g. """Documentation"""), flag that we're building
        // documentation.
        if line.contains("\"\"\"") && !(line.trimmingCharacters(in: .whitespacesAndNewlines).hasSuffix("\"\"\"") && line.count > 3) {
            isBuildingDocumentation.toggle()
        }
        
        // Once we encounter an opening curly brace, create a new 'temp entity' (i.e. string array)
        if ((line.contains("{") && !isBuildingDocumentation) || line.hasPrefix("\"\"\"")) && entityLinesBeingAddedTo == nil {
            entityLinesBeingAddedTo = [String(line)]
        }
        // When we encounter the closing curly brace for an entity, add that line, add the 'temp entity' to the full
        // 'lines grouped by entity', and clear the 'temp entity' so whitespace between entities are removed
        else if line.trimmingCharacters(in: .whitespacesAndNewlines) == "}" && !isBuildingDocumentation {
            entityLinesBeingAddedTo?.append(String(line))
            linesGroupedByEntity.append(entityLinesBeingAddedTo!)
            entityLinesBeingAddedTo = nil
        }
        // Otherwise, add lines to the 'temp entity', if it exists.
        else {
            entityLinesBeingAddedTo?.append(String(line))
        }
    }
    
    return linesGroupedByEntity
}

private func createEntities(fromGroupedLines groupedLines: [[String]]) -> [_Entity] {
    var entities: [_Entity] = []
    
    // Each array of strings is a group of lines associated with an entity - map them into full 'entity' objects.
    entities = groupedLines.map { lines in
        let entity = _Entity()
        
        var fieldDocumentation: [String] = []
        var isBuildingDocumentation = false
        for line in lines {
            if line.trimmingCharacters(in: .whitespacesAndNewlines).hasPrefix("\"\"\"") {
                isBuildingDocumentation.toggle()
            }
            if isBuildingDocumentation {
                let docLine = line.replacingOccurrences(of: "\"\"\"", with: "").trimmingCharacters(in: .whitespaces)
                // Assume the comment is for the entity if its 'name' is empty (i.e. we haven't hit the declaration line yet)
                if entity.name == "" && !docLine.isEmpty {
                    entity.documentation.append(docLine)
                }
                // Otherwise, store the field documentation in the temp 'field documentation' variable for use when the
                // field object is actually made
                else if !docLine.isEmpty {
                    fieldDocumentation.append(docLine)
                }
                // reset the 'is building docs' flag if the """ is at the end of a doc line.
                if line.trimmingCharacters(in: .whitespacesAndNewlines).count > 3 &&
                line.trimmingCharacters(in: .whitespacesAndNewlines).hasSuffix("\"\"\"") {
                    isBuildingDocumentation = false
                }
            }
            // If it's the declaration line, we can get the entity type, name, and implemented interfaces of the entity
            else if line.contains("{") {
                let (type, name, interfaces) = getTypeNameAndInterfacesForEntity(line: line)
                entity.entityType = type
                entity.name = name
                entity.interfaces = interfaces
            }
            // Otherwise, we're building a field.
            else if !line.contains("}") && !line.replacingOccurrences(of: "\"\"\"", with: "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                let field = createField(line: line)
                field.documentation = fieldDocumentation
                fieldDocumentation = []
                entity.fields.append(field)
            }
        }
        
        return entity
    }
    
    return entities
}

private func getTypeNameAndInterfacesForEntity(line: String) -> (type: _Entity._EntityType, name: String, interfaces: [String]) {
    var type: _Entity._EntityType = .object
    var name: String = ""
    var interfaces: [String] = []

    // Split the given line by the 'implements' keyword (will remove the keyword)
    let lineSplitByImplements = line.components(separatedBy: "implements")
    var nameComponent = lineSplitByImplements[0]
    
    // Check the prefix of the 'name component' of the line to determine the type of the entity. When the type is
    // determined, remove the entity type from the 'name component'.
    if line.hasPrefix(_Entity._EntityType.object.rawValue) {
        nameComponent = nameComponent.replacingOccurrences(of: _Entity._EntityType.object.rawValue, with: "")
        type = .object
    } else if line.hasPrefix(_Entity._EntityType.input.rawValue) {
        nameComponent = nameComponent.replacingOccurrences(of: _Entity._EntityType.input.rawValue, with: "")
        type = .input
    } else if line.hasPrefix(_Entity._EntityType.enum.rawValue) {
        nameComponent = nameComponent.replacingOccurrences(of: _Entity._EntityType.enum.rawValue, with: "")
        type = .enum
    } else if line.hasPrefix(_Entity._EntityType.scalar.rawValue) {
        nameComponent = nameComponent.replacingOccurrences(of: _Entity._EntityType.scalar.rawValue, with: "")
        type = .scalar
    } else if line.hasPrefix(_Entity._EntityType.schema.rawValue) {
        nameComponent = nameComponent.replacingOccurrences(of: _Entity._EntityType.schema.rawValue, with: "")
        type = .schema
    }
    
    // Then, remove any whitespace in the 'name component' to get the name of the entity.
    nameComponent = nameComponent
        .replacingOccurrences(of: " ", with: "")
        .replacingOccurrences(of: "{", with: "")
    name = nameComponent
    
    // Next, get the implemented interfaces. We can do this by just removing whitespace/the opening curly brace on the
    // second item in the split line and splitting them by commas.
    if lineSplitByImplements.count == 2 {
        var interfacesComponent = lineSplitByImplements[1]
        interfacesComponent = interfacesComponent.replacingOccurrences(of: " ", with: "")
        interfacesComponent = interfacesComponent.replacingOccurrences(of: "{", with: "")
        interfaces = interfacesComponent.split(separator: ",").map { String($0) }
    }
    
    return (type, name, interfaces)
}

private func createField(line: String) -> _Field {
    let field = _Field()
    var lineWithArgsRemoved: String = line
    
    // Build the array of arguments. We do so by getting the regex for an opening and closing paranthesis, then removing
    // whitespace and the parantheses. Then we split that string by commas to get the key-value 'arg' pairs, which can
    // be split by their colon to get the name and type of the argument.
    if let argsRange = line.range(of: #"\((.*?)\)"#, options: .regularExpression) {
        lineWithArgsRemoved.removeSubrange(argsRange)

        let args = String(line[argsRange])
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .split(separator: ",").map { String($0) }
        for arg in args {
            let nameAndType = arg.split(separator: ":").map { String($0) }
            field.arguments.append(_Field._Argument(name: nameAndType[0], type: nameAndType[1]))
        }
    }
    
    // Once we have the line with the arguments portion removed, we can simply perform the same 'remove whitespace/split
    // by colon' algorithm to get the name and type of the field.
    let nameAndType = lineWithArgsRemoved
        .replacingOccurrences(of: " ", with: "")
        .split(separator: ":").map { String($0) }
    field.name = nameAndType[0]
    if nameAndType.count > 1 {
        field.type = nameAndType[1]
    }

    return field
}

// MARK: - Swift types generation from intermediate entities

private func createSwiftTypeLines(from entity: _Entity) -> [String] {
    switch entity.entityType {
    case .object:
        return createSwiftLines(forObject: entity)
    case .enum:
        return createSwiftLines(forEnum: entity)
    case .input: fallthrough
    case .scalar: fallthrough
    case .schema:
        return []
    }
}

/// Creates the lines of Swift code for a class representing the given intermediate entity.
private func createSwiftLines(forObject object: _Entity) -> [String] {
    var lines: [String] = []
    if !object.documentation.isEmpty {
        lines.append("/**")
        lines.append(contentsOf: object.documentation.map { " \($0)" })
        lines.append("*/")
    }
    lines.append("final class \(object.name): Object, ObjectSchema {")
    if !object.interfaces.isEmpty {
        let interfaces = object.interfaces.map { "\($0).self" }.joined(separator: ", ")
        lines.append("   static let implements = Interfaces(\(interfaces))")
    }
    for field in object.fields {
        lines.append("\n")
        if !field.documentation.isEmpty {
            lines.append("   /**")
            lines.append(contentsOf: field.documentation.map { "    \($0)" })
            lines.append("   */")
        }
        if field.arguments.isEmpty {
            lines.append("   var \(field.name) = Field<\(field.type), NoArguments>(\"\(field.name)\")")
        } else {
            var argumentsNameChars = Array(field.name.appending("Arguments"))
            argumentsNameChars[0] = Character(argumentsNameChars[0].uppercased())
            let argumentsStructName = String(argumentsNameChars)
            lines.append("   var \(field.name) = Field<\(field.type), \(argumentsStructName)>(\"\(field.name)\")")
            lines.append(contentsOf: createArgumentsStruct(forField: field, name: argumentsStructName))
        }
    }
    lines.append("}")
    return lines
}
private func createArgumentsStruct(forField field: _Field, name: String) -> [String] {
    var lines: [String] = []
    lines.append("   struct \(name): ArgumentsList {")
    for argument in field.arguments {
        lines.append("      var \(argument.name) = Argument<\(argument.type)>(\"\(argument.name)\")")
    }
    lines.append("   }")
    return lines
}

private func createSwiftLines(forEnum enumEntity: _Entity) -> [String] {
    var lines: [String] = []
    lines.append("enum \(enumEntity.name): String, Enum {")
    for field in enumEntity.fields {
        lines.append("   \(field.name) = \"\(field.name)\"")
    }
    lines.append("}")
    return lines
}
