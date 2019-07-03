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
    var documentation: String?
}

private class _Field {
    struct _Argument {
        let name: String
        let type: String
    }
    
    var name: String = ""
    var type: String = ""
    var documentation: String?
    var arguments: [_Argument] = []
}


func generateSwiftFile(from graphQLFile: String) -> String {
    // First, create an array of each line of the file
    let lines = graphQLFile.split(separator: "\n")

    let linesGroupedByEntity: [[String]] = getLinesGroupedByEntity(in: lines)
    let entities: [_Entity] = createEntities(fromGroupedLines: linesGroupedByEntity)
    
    return ""
}

func getLinesGroupedByEntity(in lines: [Substring]) -> [[String]] {
    // Now, group the lines into the 'entity' (e.g. type, enum, input, etc) that they're associated with. Each 'entity'
    // at this point is an array of associated lines.
    var linesGroupedByEntity: [[String]] = []
    var entityLinesBeingAddedTo: [String]?
    for line in lines {
        // Once we encounter an opening curly brace or a documentation comment line, create a new 'temp entity' (i.e. string array)
        if (line.contains("{") || line.contains("#")) && entityLinesBeingAddedTo == nil {
            entityLinesBeingAddedTo = [String(line)]
        }
        // When we encounter the closing curly brace for an entity, add that line, add the 'temp entity' to the full
        // 'lines grouped by entity', and clear the 'temp entity' so whitespace between entities are removed
        else if line.contains("}") {
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
        
        var fieldDocumentation: String?
        for line in lines {
            // If it's the declaration line, we can get the entity type, name, and implemented interfaces of the entity
            if line.contains("{") {
                let (type, name, interfaces) = getTypeNameAndInterfacesForEntity(line: line)
                entity.entityType = type
                entity.name = name
                entity.interfaces = interfaces
            }
            // If we hit a documentation comment line, we need to make sure to attach the comments to the either the
            // entity or one of its fields.
            else if line.contains("#") {
                let docLine = line.replacingOccurrences(of: "#", with: "")
                // Assume the comment is for the entity if its 'name' is empty (i.e. we haven't hit the declaration line yet)
                if entity.name == "" {
                    if entity.documentation == nil {
                        entity.documentation = docLine
                    } else {
                        entity.documentation?.append(docLine)
                    }
                }
                // Otherwise, store the field documentation in the temp 'field documentation' variable for use when the
                // field object is actually made
                else {
                    if fieldDocumentation == nil {
                        fieldDocumentation = docLine
                    } else {
                        fieldDocumentation?.append(docLine)
                    }
                }
            }
            // Otherwise, we're building a field.
            else if line.contains(":") {
                let field = createField(line: line)
                field.documentation = fieldDocumentation
                fieldDocumentation = nil
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
    nameComponent = nameComponent.replacingOccurrences(of: " ", with: "")
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

        var argsString = String(line[argsRange])
        argsString = argsString.replacingOccurrences(of: " ", with: "")
        argsString = argsString.replacingOccurrences(of: "(", with: "")
        argsString = argsString.replacingOccurrences(of: ")", with: "")
        let args: [String] = argsString.split(separator: ",").map { String($0) }
        for arg in args {
            let nameAndType = arg.split(separator: ":").map { String($0) }
            field.arguments.append(_Field._Argument(name: nameAndType[0], type: nameAndType[1]))
        }
    }
    
    // Once we have the line with the arguments portion removed, we can simply perform the same 'remove whitespace/split
    // by colon' algorithm to get the name and type of the field.
    let nameAndType = lineWithArgsRemoved.replacingOccurrences(of: " ", with: "").split(separator: ":").map { String($0) }
    field.name = nameAndType[0]
    field.type = nameAndType[1]

    return field
}
