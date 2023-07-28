//
//  TestCommand.swift
//  FastlaneRunner
//
//  Created by Doan Thieu on 28/07/2023.
//

import ArgumentParser
import ConfigurationLoader
import Fastlane
import FastlaneRunnerCore
import ProjectDescription

enum TestError: Error {

    case targetNotFound
}

struct TestCommand: ParsableCommand {

    static var configuration: CommandConfiguration {
        .init(
            commandName: "test",
            abstract: "Build and test project."
        )
    }

    init() {}

    func run() throws {
        logger.info("\(Self.configuration.abstract)")
        let project = try ConfigurationLoader().loadProjectConfiguration()
        logger.debug("Loaded project configuration: \(project)")

        guard let target = project.targets
            .first(where: { $0.builds.map(\.config).contains(.staging) })
                ?? project.targets.first else {
            throw TestError.targetNotFound
        }

        guard let build = target.builds.first(where: { $0.config == .staging })
                ?? target.builds.first else {
            throw TestError.targetNotFound
        }

        let scheme = target.scheme(for: build)!
        let testTargets = project.targets.filter { $0.isTest }
        guard !testTargets.isEmpty else {
            throw TestError.targetNotFound
        }

        Main().run(
            with: TestFastfile(),
            lane: "test",
            parameters: [
                "scheme": scheme,
                "targets": testTargets.map(\.name).joined(separator: ",")
            ]
        )
    }
}
