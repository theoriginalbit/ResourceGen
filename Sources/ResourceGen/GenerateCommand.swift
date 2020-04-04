import ArgumentParser
import Foundation

struct GenerateCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "generate",
        abstract: "Generates files.")

    enum ResourceType: String, CaseIterable, ExpressibleByArgument {
        case images, fonts, files, colors, strings
    }

    @Option(name: .shortAndLong, help: "The output file.")
    var output: String

    @Option(default: ResourceType.allCases, help: "Generators to execute.")
    var include: [ResourceType]
    
    func run() {
        OptionSet
        print("===")
        print(output)
        print(include)
        print("===")
    }
}

extension GenerateCommand.ResourceType {
    static func closestMatch(to otherRawValue: String) -> Self? {
        return Self.allCases.map { type in (type, type.rawValue.levenshteinDistance(to: otherRawValue)) }
            .min { a, b in a.1 < b.1 }
            .map { $0.0 }
    }
}

private let arrayDelimeter = ","

extension Array where Element == GenerateCommand.ResourceType {
    init?(argument: String) {
        self = argument.components(separatedBy: arrayDelimeter).map { value in
            guard let type = Element(rawValue: value) else {
                let error = ValidationError("Unknown \(String(describing: Element.self)) value '\(value)'. less than the number of elements.")
                ResourceGen.exit(withError: error)
            }
            return type
        }
    }
}
