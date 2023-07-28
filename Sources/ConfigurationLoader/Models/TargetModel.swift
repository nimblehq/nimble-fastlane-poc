//
//  TargetModel.swift
//  ConfigurationLoader
//
//  Created by Doan Thieu on 28/07/2023.
//

import ProjectDescription

struct TargetModel: Decodable {

    let name: String
    let test: Bool
    let builds: [BuildModel]

    enum CodingKeys: CodingKey {

        case name
        case isTest
        case builds
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.test = (try? container.decode(Bool.self, forKey: .isTest)) ?? false
        self.builds = (try? container.decode([BuildModel].self, forKey: .builds)) ?? []
    }
}

extension TargetModel {

    func toTarget() -> Target {
        if test {
            return .testTarget(name: name)
        }
        return .target(name: name, builds: builds.compactMap { $0.toBuild() })
    }
}
