//
//  Fastfile.swift
//  
//
//  Created by Bliss on 12/5/23.
//

import Fastlane

class Fastfile: LaneFile {

    // MARK: - Code signing

    public func syncDevelopmentCodeSigningLane() {
        // desc("Sync the Development match signing for the Staging build")
        Match.syncCodeSigning(
            type: .development,
            appIdentifier: [Constant.stagingBundleId]
        )
    }

    public func syncAdHocStagingCodeSigningLane() {
        // desc("Sync the Ad Hoc match signing for the Staging build")
        Match.syncCodeSigning(
            type: .adHoc,
            appIdentifier: [Constant.stagingBundleId]
        )
    }

    public func syncAdHocProductionCodeSigningLane() {
        // desc("Sync the Ad Hoc match signing for the Production build")
        Match.syncCodeSigning(
            type: .adHoc,
            appIdentifier: [Constant.productionBundleId]
        )
    }

    public func syncAppStoreCodeSigningLane() {
        // desc("Sync the App Store match signing for the Production build")
        Match.syncCodeSigning(
            type: .appStore,
            appIdentifier: [Constant.productionBundleId]
        )
    }

    // MARK: - Build

    public func buildAdHocStagingLane() {
        // desc("Build ad-hoc staging")
        Build.adHoc(environment: .staging)
    }

    public func buildAdHocProductionLane() {
        // desc("Build ad-hoc production")
        Build.adHoc(environment: .production)
    }

    public func buildAppStoreLane() {
        // desc("Build app store")
        Build.appStore()
    }

    // MARK: - Upload builds to Firebase and AppStore

    public func buildStagingAndUploadToFirebaseLane() {
        // desc("Build Staging app and upload to Firebase")

        setAppVersion()
        bumpBuild()

        buildAdHocStagingLane()

        // TODO: - Make release notes
        Distribution.uploadToFirebase(environment: .staging, releaseNotes: "")

        Symbol.uploadToCrashlytics(environment: .staging)

        Build.saveBuildContextToCI()
    }

    public func buildProductionAndUploadToFirebaseLane() {
        // desc("Build Staging app and upload to Firebase")

        setAppVersion()
        bumpBuild()

        buildAdHocProductionLane()

        // TODO: - Make release notes
        Distribution.uploadToFirebase(
            environment: .production,
            releaseNotes: ""
        )

        Symbol.uploadToCrashlytics(environment: .production)

        Build.saveBuildContextToCI()
    }

    public func buildAndUploadToAppStoreLane() {
        // desc("Build Production app and upload to App Store")

        setAppVersion()
        AppStoreAuthentication.connectAPIKey()
        if Secret.bumpAppStoreBuildNumber {
            bumpAppstoreBuild()
        } else {
            bumpBuild()
        }

        buildAppStoreLane()

        Distribution.uploadToAppStore()

        Symbol.uploadToCrashlytics(environment: .production)

        Build.saveBuildContextToCI()
    }

    public func buildAndUploadToTestFlightLane() {
        // desc("Build Production app and upload to TestFlight")

        setAppVersion()
        bumpBuild()

        buildAppStoreLane()

        AppStoreAuthentication.connectAPIKey()
        Distribution.uploadToTestFlight()

        Symbol.uploadToCrashlytics(environment: .production)

        Build.saveBuildContextToCI()
    }

    // MARK: - Test

    public func buildAndTestLane() {
        // desc("Build and Test project")
        Test.buildAndTest(
            environment: .staging,
            targets: [
                Constant.testTarget,
                Constant.kifUITestTarget
            ],
            devices: Constant.devices
        )
    }

    public func updateProvisionSettingsLane() {
        // desc("Update Provision Profile")
        syncAppStoreCodeSigningLane()
        updateCodeSigningSettings(
            path: Constant.projectPath,
            useAutomaticSigning: .userDefined(false),
            teamId: .userDefined(EnvironmentParser.string(key: "sigh_\(Constant.productionBundleId)_appstore_team-id")),
            codeSignIdentity: .userDefined("iPhone Distribution"),
            profileName: .userDefined(EnvironmentParser.string(
                key: "sigh_\(Constant.productionBundleId)_appstore_profile-name"
            ))
        )
    }

    public func setUpTestProjectLane() {
        // desc("Disable Exempt Encryption")
        Test.disableExemptEncryption()
    }

    // MARK: - Register device

    public func registerNewDeviceLane() {
        let deviceName = prompt(text: "Enter the device name:")
        let deviceUDID = prompt(text: "Enter the device UDID:")

        registerDevice(
            name: deviceName,
            udid: deviceUDID,
            teamId: .userDefined(Constant.teamId)
        )

        Match.syncCodeSigning(type: .development, appIdentifier: [], isForce: true)
        Match.syncCodeSigning(type: .adHoc, appIdentifier: [], isForce: true)
    }

    // MARK: - Utilities

    public func cleanUpOutputLane() {
        // desc("Clean up Output")
        clearDerivedData(derivedDataPath: Constant.outputPath)
    }

    // MARK: - Private Helper

    private func setAppVersion() {
        // desc("Check if any specific version number in build environment")
        guard !Constant.manualVersion.isEmpty else { return }
        incrementVersionNumber(
            versionNumber: .userDefined(Constant.manualVersion)
        )
    }

    private func bumpBuild(buildNumber: Int = numberOfCommits()) {
        // desc("Set build number with number of commits")
        incrementBuildNumber(
            buildNumber: .userDefined(String(buildNumber)),
            xcodeproj: .userDefined(Constant.projectPath)
        )
    }

    private func bumpAppstoreBuild() {
        // desc("Set build number with App Store latest build")
        let theLatestBuildNumber = latestTestflightBuildNumber(
            appIdentifier: Constant.productionBundleId
        ) + 1
        incrementBuildNumber(
            buildNumber: .userDefined("\(theLatestBuildNumber)")
        )
    }
}
