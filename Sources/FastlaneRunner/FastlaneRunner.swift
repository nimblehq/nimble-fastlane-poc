import ArgumentParser
import ConfigurationLoader

@main
public struct FastlaneRunner: ParsableCommand {

    public init() {}

    public static var configuration: CommandConfiguration {
        .init(
            commandName: "fastlaneRunner",
            subcommands: [TestCommand.self]
        )
    }
}
