//
//  Constant.swift
//  FastlaneRunner
//
//  Created by Su Ho on 22/09/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

import Foundation

public var constant = Constant()

public class Constant {

    // MARK: - App Store

    public var testFlightTesterGroups = ["<#group1#>", "<#group2#>"]

    // MARK: - Firebase

    public var stagingFirebaseAppId = "<#stagingFirebaseAppId#>"
    public var productionFirebaseAppId = "<#productionFirebaseAppId#>"
    public var firebaseTesterGroups = "<#group1#>, <#group2#>"

    // MARK: - Match

    public var userName = "<#userName#>"
    public var teamId = "<#teamId#>"
    public var keychainName = "github_action_keychain"
    public var matchURL = "git@github.com:{organization}/{repo}.git"

    // MARK: - Path

    public var outputPath = "./Output"
    public var testOutputDirectoryPath = "./fastlane/test_output"
    var buildPath: String { "\(outputPath)/Build" }
    var derivedDataPath: String { "\(outputPath)/DerivedData" }
    var projectPath: String { "./\(projectName).xcodeproj" }
    var infoPlistPath: String { "\(projectName)/Configurations/Plists/Info.plist" }

    // MARK: Platform

    var platform: PlatformType {
        if EnvironmentParser.bool(key: "CM_BRANCH") {
            return .codeMagic
        } else if EnvironmentParser.bool(key: "BITRISE_IO") {
            return .bitrise
        } else if EnvironmentParser.bool(key: "GITHUB_ACTIONS") {
            return .gitHubActions
        }
        return .unknown
    }

    // MARK: - Project

    var stagingBundleId = "{BUNDLE_ID_STAGING}"
    var productionBundleId = "{BUNDLE_ID_PRODUCTION}"
    var projectName = "{PROJECT_NAME}"

    // MARK: - Symbol

    var uploadSymbolsBinaryPath: String = "./Pods/FirebaseCrashlytics/upload-symbols"
    var dSYMSuffix: String = ".dSYM.zip"

    // MARK: - Build and Version

    public var manualVersion: String = ""

    // MARK: - Device

    public var devices = ["iPhone 12 Pro Max"]

    // MARK: - Test

    var testTarget: String { "\(projectName)Tests" }
    var kifUITestTarget: String { "\(projectName)KIFUITests" }
}

extension Constant {

    enum Environment: String {

        case staging = "Staging"
        case production = ""

        var productName: String { "\(constant.projectName) \(rawValue)".trimmed }

        var scheme: String { "\(constant.projectName) \(rawValue)".trimmed }

        var bundleId: String {
            switch self {
            case .staging: return constant.stagingBundleId
            case .production: return constant.productionBundleId
            }
        }

        var firebaseAppId: String {
            switch self {
            case .staging: return constant.stagingFirebaseAppId
            case .production: return constant.productionFirebaseAppId
            }
        }

        var gspPath: String {
            let infoName = "GoogleService-Info.plist"
            let googleServiceFolder = "./\(constant.projectName)/Configurations/Plists/GoogleService"
            switch self {
            case .staging: return "\(googleServiceFolder)/Staging/\(infoName)"
            case .production: return "\(googleServiceFolder)/Production/\(infoName)"
            }
        }

        var dsymPath: String {
            let outputDirectoryURL = URL(fileURLWithPath: constant.outputPath)
            return outputDirectoryURL.appendingPathComponent(productName + ".app" + constant.dSYMSuffix).relativePath
        }
    }

    enum BuildType: String {

        case adHoc = "ad-hoc"
        case appStore = "app-store"

        var value: String { return rawValue }

        var method: String {
            switch self {
            case .adHoc: return "AdHoc"
            case .appStore: return "AppStore"
            }
        }
    }

    enum PlatformType {

        case gitHubActions, bitrise, codeMagic, unknown
    }
}

extension String {

    fileprivate var trimmed: String { trimmingCharacters(in: .whitespacesAndNewlines) }
}
