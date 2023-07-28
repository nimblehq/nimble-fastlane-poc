//
//  Build.swift
//  
//
//  Created by Doan Thieu on 26/07/2023.
//

public struct Build {

    public enum Config: String {

        case development
        case staging
        case production
    }

    public let bundleId: String
    public let config: Config
    public let distribution: Distribution?

    private init(bundleId: String, config: Config, distribution: Distribution?) {
        self.bundleId = bundleId
        self.config = config
        self.distribution = distribution
    }

    public static func development(bundleId: String, distribution: Distribution? = nil) -> Build {
        return .init(bundleId: bundleId, config: .development, distribution: distribution)
    }

    public static func staging(bundleId: String, distribution: Distribution? = nil) -> Build {
        return .init(bundleId: bundleId, config: .staging, distribution: distribution)
    }

    public static func production(bundleId: String, distribution: Distribution? = nil) -> Build {
        return .init(bundleId: bundleId, config: .production, distribution: distribution)
    }
}
