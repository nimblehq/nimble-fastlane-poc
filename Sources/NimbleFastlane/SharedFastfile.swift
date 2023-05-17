import Fastlane

// MARK: - SharedFastfile

public protocol SharedFastfile: AnyObject {

    var firebaseProtocol: FirebaseAppDistributionProtocol! { get set }

    func getIsCILane()
    func getVersionNumberLane()
    func uploadToFirebaseLane()
}

public extension SharedFastfile {

    func getIsCILane() {
        puts(message: .userDefined("getIsCILane"))
        puts(message: .userDefined(EnvironmentParser.string(key: "IS_CI")))
    }

    func getVersionNumberLane() {
        puts(message: .userDefined("getVersionNumberLane"))
        puts(message: .userDefined(Version.versionNumber))
    }

    func uploadToFirebaseLane() {
        firebaseProtocol.firebaseAppDistribution(
            ipaPath: "",
            app: "",
            groups: "",
            releaseNotes: "",
            firebaseCliToken: "",
            debug: true
        )
    }
}

// MARK: - FirebaseAppDistributionProtocol

public protocol FirebaseAppDistributionProtocol {

    func firebaseAppDistribution(
        ipaPath: String,
        app: String,
        groups: String,
        releaseNotes: String,
        firebaseCliToken: String,
        debug: Bool
    )
}
