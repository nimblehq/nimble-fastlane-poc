//
//  Target.swift
//  
//
//  Created by Doan Thieu on 24/07/2023.
//

public struct Target {

    public enum TargetType {

        case regular
        case test
    }

    public let name: String
    public let type: TargetType
    public let builds: [Build]

    public var isTest: Bool { type == .test }

    private init(name: String, type: TargetType, builds: [Build]) {
        self.name = name
        self.type = type
        self.builds = builds
    }

    public static func target(name: String, builds: [Build] = []) -> Target {
        .init(name: name, type: .regular, builds: builds)
    }

    public static func testTarget(name: String) -> Target {
        .init(name: name, type: .test, builds: [])
    }
}

extension Target {

    public func scheme(for build: Build) -> String? {
        guard let _ = builds.first(where: { $0 == build }) else {
            return nil
        }

        switch build.config {
        case .development:
            return "\(name) Development"
        case .staging:
            return "\(name) Staging"
        case .production:
            return name
        }
    }
}
