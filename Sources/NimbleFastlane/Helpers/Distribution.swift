//
//  Distribution.swift
//  FastlaneRunner
//
//  Created by Su T. on 25/09/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

import Fastlane

enum Distribution {

    static func uploadToFirebase(
        environment: Constant.Environment,
        groups: String = constant.firebaseTesterGroups,
        releaseNotes: String
    ) {
        let ipaPath = makeIPAPath(environment: environment)
        firebaseAppDistribution(
            ipaPath: .userDefined(ipaPath),
            app: .userDefined(environment.firebaseAppId),
            groups: .userDefined(groups),
            releaseNotes: .userDefined(releaseNotes),
            firebaseCliToken: .userDefined(Secret.firebaseCLIToken),
            debug: .userDefined(true)
        )
    }

    static func uploadToAppStore(environment: Constant.Environment = .production) {
        let ipaPath = makeIPAPath(environment: environment)
        appstore(
            appIdentifier: .userDefined(environment.bundleId),
            ipa: .userDefined(ipaPath),
            skipScreenshots: .userDefined(true),
            skipMetadata: .userDefined(true),
            force: .userDefined(true),
            runPrecheckBeforeSubmit: .userDefined(false)
        )
    }

    static func uploadToTestFlight(
        environment: Constant.Environment = .production,
        changeLog: String = "",
        betaAppReviewInfo: [String: Any] = [:],
        groups: [String] = constant.testFlightTesterGroups
    ) {
        let ipaPath = makeIPAPath(environment: environment)
        testflight(
            appIdentifier: .userDefined(environment.bundleId),
            ipa: .userDefined(ipaPath),
            demoAccountRequired: .userDefined(betaAppReviewInfo.isEmpty),
            betaAppReviewInfo: .userDefined(betaAppReviewInfo),
            changelog: .userDefined(changeLog),
            skipWaitingForBuildProcessing: .userDefined(true),
            groups: .userDefined(groups)
        )
    }

    private static func makeIPAPath(environment: Constant.Environment) -> String {
        "\(constant.outputPath)/\(environment.productName).ipa"
    }
}
