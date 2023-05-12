//
//  Version.swift
//  FastlaneRunner
//
//  Created by Khanh on 26/09/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

import Fastlane

enum Version {

    // MARK: - Getting

    static var versionNumber: String {
        get {
            getVersionNumber(
                xcodeproj: .userDefined(constant.projectPath),
                target: .userDefined(constant.projectName)
            )
        }

        set {
            incrementVersionNumber(
                versionNumber: .userDefined(newValue),
                xcodeproj: .userDefined(constant.projectPath)
            )
        }
    }

    static var buildNumber: String {
        get {
            getBuildNumber(xcodeproj: .userDefined(constant.projectPath))
        }

        set {
            incrementBuildNumber(
                buildNumber: .userDefined(newValue),
                xcodeproj: .userDefined(constant.projectPath)
            )
        }
    }

    static func getVersionAndBuildNumber() -> String {
        "\(versionNumber) (Build: \(buildNumber)"
    }

    static var releaseTag: String {
        "release/\(versionNumber)"
    }
}
