//
//  BuildModel.swift
//  ConfigurationLoader
//
//  Created by Doan Thieu on 28/07/2023.
//

import ProjectDescription

struct BuildModel: Decodable {

    let config: String
    let bundleId: String
    let distribution: DistributionModel?

    enum CodingKeys: CodingKey {

        case config
        case bundleId
        case distribution
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.config = try container.decode(String.self, forKey: .config)
        self.bundleId = try container.decode(String.self, forKey: .bundleId)
        self.distribution = try container.decodeIfPresent(DistributionModel.self, forKey: .distribution)
    }
}

extension BuildModel {

    func toBuild() -> Build? {
        let config = Build.Config(rawValue: config.lowercased())

        switch config {
        case .development:
            return .development(bundleId: bundleId, distribution: distribution?.toDistribution())
        case .staging:
            return .staging(bundleId: bundleId, distribution: distribution?.toDistribution())
        case .production:
            return .production(bundleId: bundleId, distribution: distribution?.toDistribution())
        case .none:
            return nil
        }
    }
}
