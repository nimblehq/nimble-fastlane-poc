//
//  Distribution.swift
//  
//
//  Created by Doan Thieu on 27/07/2023.
//

public struct Distribution {

    public enum Method: String {

        case development = "Development"
        case adHoc = "AdHoc"
        case appStore = "AppStore"
        case enterprise = "InHouse"

        public var value: String { rawValue }

        public var signing: String {
            switch self {
            case .development: return "development"
            case .adHoc: return "ad-hoc"
            case .appStore: return "app-store"
            case .enterprise: return "enterprise"
            }
        }
    }

    public enum Destination {

        case testFlight
        case firebase(appId: String)
        case appStore
    }

    public let method: Method
    public let destination: Destination?
    public let testerGroups: [String]

    public init(method: Method, destination: Destination?, testerGroups: [String] = []) {
        self.method = method
        self.destination = destination
        self.testerGroups = testerGroups
    }
}
