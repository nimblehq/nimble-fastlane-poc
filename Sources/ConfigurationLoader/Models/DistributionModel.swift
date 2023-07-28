//
//  DistributionModel.swift
//  ConfigurationLoader
//
//  Created by Doan Thieu on 28/07/2023.
//

import ProjectDescription

struct DistributionModel: Decodable {

    let method: String
    let firebase: String?
    let testFlight: Bool
    let appStore: Bool
    let testerGroups: [String]

    enum CodingKeys: String, CodingKey {

        case method
        case firebase
        case testFlight = "testflight"
        case appStore = "appstore"
        case testerGroups = "testers"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.method = try container.decode(String.self, forKey: .method)
        self.firebase = try container.decodeIfPresent(String.self, forKey: .firebase)
        self.testFlight = (try? container.decode(Bool.self, forKey: .testFlight)) ?? false
        self.appStore = (try? container.decode(Bool.self, forKey: .appStore)) ?? false
        self.testerGroups = (try? container.decode([String].self, forKey: .testerGroups)) ?? []
    }
}

extension DistributionModel {

    func toDistribution() -> Distribution? {
        let method = Distribution.Method(rawValue: method.lowercased())

        let destination: Distribution.Destination? = {
            if appStore { return .appStore }
            if testFlight { return .testFlight }
            return firebase.map { .firebase(appId: $0) }
        }()

        return method
            .map {
                Distribution(
                    method: $0,
                    destination: destination,
                    testerGroups: testerGroups
                )
            }
    }
}
