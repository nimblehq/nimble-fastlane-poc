//
//  Distribution.swift
//  
//
//  Created by Doan Thieu on 27/07/2023.
//

public struct Distribution: Equatable {

    public enum Method: String, Equatable {

        case development
        case adHoc = "adhoc"
        case appStore = "appstore"
        case enterprise

        public var value: String {
            switch self {
            case .development: return "Development"
            case .adHoc: return "AdHoc"
            case .appStore: return "AppStore"
            case .enterprise: return "InHouse"
            }
        }

        public var signing: String {
            switch self {
            case .development: return "development"
            case .adHoc: return "ad-hoc"
            case .appStore: return "app-store"
            case .enterprise: return "enterprise"
            }
        }
    }

    public enum Destination: Equatable {

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
