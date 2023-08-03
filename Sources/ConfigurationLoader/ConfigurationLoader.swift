//
//  ConfigurationLoader.swift
//  ConfigurationLoader
//
//  Created by Doan Thieu on 27/07/2023.
//

import Foundation
import ProjectDescription
import Yams

public enum ConfigurationError: Error {

    case configNotFound
}

public class ConfigurationLoader {

    private var fileManager = FileManager()
    private var yamlDecoder = YAMLDecoder()
    private let configPath = "project.yml"

    public init() {}

    public func loadProjectConfiguration() throws -> Project {
        guard fileManager.fileExists(atPath: configPath) else {
            throw ConfigurationError.configNotFound
        }

        let configFile = try Data(contentsOf: URL(fileURLWithPath: configPath, relativeTo: nil))
        return try yamlDecoder.decode(ProjectModel.self, from: configFile).toProject()
    }
}
