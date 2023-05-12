//
//  Test.swift
//  FastlaneRunner
//
//  Created by Khanh on 27/09/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

import Fastlane

enum Test {

    static func buildAndTest(
        environment: Constant.Environment,
        targets: [String],
        devices: [String]
    ) {
        scan(
            scheme: .userDefined(environment.scheme),
            devices: .userDefined(devices),
            onlyTesting: targets,
            codeCoverage: .userDefined(true),
            outputDirectory: constant.testOutputDirectoryPath,
            xcodebuildFormatter: "xcpretty",
            resultBundle: .userDefined(true),
            failBuild: .userDefined(false)
        )
    }

    static func disableExemptEncryption() {
        setInfoPlistValue(
            key: "ITSAppUsesNonExemptEncryption",
            value: "false",
            path: "\(constant.projectName)/Configurations/Plists/Info.plist"
        )
    }
}
