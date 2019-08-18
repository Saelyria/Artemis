import Foundation
import Artemis

guard let inputFileIndex = CommandLine.arguments.firstIndex(where: { $0.hasPrefix("-i") || $0.hasPrefix("--input") }) else {
    fatalError("No path to the schema file was specified")
}
let inputFile = CommandLine.arguments[inputFileIndex+1].trimmingCharacters(in: .whitespacesAndNewlines)

var schema: String!
if #available(macOS 10.12, *) {
    guard let data = FileManager.default.contents(atPath: inputFile) else { fatalError("The path '\(inputFile)' was invalid") }
    schema = String(data: data, encoding: .utf8)
} else {
    fatalError("The current environment is not macOS 10.12 or newer.")
}

print(CommandLine.arguments)
var outputFile: String?
if let outputFileIndex = CommandLine.arguments.firstIndex(where: { $0.hasPrefix("-o") || $0.hasPrefix("--output") }) {
    outputFile = CommandLine.arguments[outputFileIndex+1]
}

var output: [(filename: String, content: String)] = []
do {
	output = try generateSwiftFiles(from: schema)
} catch {
	fatalError("\(error)")
}

if let outputFile = outputFile {
	let outputBaseUrl = URL(fileURLWithPath: outputFile)
    do {
		try FileManager.default.createDirectory(atPath: outputBaseUrl.path, withIntermediateDirectories: true)
		for (filename, content) in output {
			let url = outputBaseUrl.appendingPathComponent("\(filename).swift")
			FileManager.default.createFile(atPath: url.path, contents: content.data(using: .utf8), attributes: nil)
		}
    } catch {
        fatalError("Failed to write to the specified output - '\(error)'")
    }
} else {
    fatalError()
}
