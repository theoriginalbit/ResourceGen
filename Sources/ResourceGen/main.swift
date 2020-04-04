import ArgumentParser
import Foundation

struct ResourceGen: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "resourcegen",
        abstract: "An asset generator for Swift.",
        subcommands: [GenerateCommand.self])

    @Flag(name: .shortAndLong, help: "Output all logging.")
    var verbose: Bool
}

ResourceGen.main()
