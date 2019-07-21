import Foundation
import Artemis

guard let inputFileIndex = CommandLine.arguments.firstIndex(where: { $0.hasPrefix("-i") || $0.hasPrefix("--input") }) else {
    fatalError("No path to the schema file was specified")
}
let inputFile = CommandLine.arguments[inputFileIndex+1].trimmingCharacters(in: .whitespacesAndNewlines)

var schema: String!
let fileManager = FileManager.default
if #available(macOS 10.12, *) {
    guard let data = fileManager.contents(atPath: inputFile) else { fatalError("The path '\(inputFile)' was invalid") }
    schema = String(data: data, encoding: .utf8)
} else {
    fatalError("The current environment is not macOS 10.12 or newer.")
}

var outputFile: String?
if let outputFileIndex = CommandLine.arguments.firstIndex(where: { $0.hasPrefix("-o") || $0.hasPrefix("--output") }) {
    outputFile = CommandLine.arguments[outputFileIndex+1]
}

var output: String = ""
do {
	output = try generateSwiftFile(from: schema)
} catch {
	fatalError(error.localizedDescription)
}

if let outputFile = outputFile {
    guard let outputUrl = URL(string: outputFile) else {
        fatalError("The Swift output file path '\(outputFile)' was invalid")
    }
    do {
        try output.write(to: outputUrl, atomically: true, encoding: String.Encoding.utf8)
    } catch {
        fatalError("Failed to write to the specified output '\(outputFile)'")
    }
} else {
    print(output)
}
