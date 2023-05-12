//
//  Distribution.swift
//  FastlaneRunner
//
//  Created by Su T. on 25/09/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

import Fastlane

open class FirebaseDistributor {

    public init() {}

    open func firebaseAppDistribution(
        ipaPath: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        googleserviceInfoPlistPath: String = "GoogleService-Info.plist",
        apkPath: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        androidArtifactPath: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        androidArtifactType: String = "APK",
        app: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        firebaseCliPath: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        groups: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        groupsFile: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        testers: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        testersFile: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        releaseNotes: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        releaseNotesFile: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        firebaseCliToken: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        debug: OptionalConfigValue<Bool> = .fastlaneDefault(false),
        serviceCredentialsFile: OptionalConfigValue<String?> = .fastlaneDefault(nil),
        uploadTimeout: Int = 300
    ) {}
}

enum Distribution {

    static func uploadToFirebase(
        environment: Constant.Environment,
        groups: String = Constant.firebaseTesterGroups,
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
        groups: [String] = Constant.testFlightTesterGroups
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
        "\(Constant.outputPath)/\(environment.productName).ipa"
    }
}
