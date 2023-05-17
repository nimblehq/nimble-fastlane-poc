import Fastlane

// MARK: - NewSharedFastfile

public protocol NewSharedFastfile {

    var firebase: Firebase! { get set }

    func getIsCILane()

    func getVersionNumberLane()

    func uploadBuildLane()
}

// MARK: - SharedFastfile

public extension NewSharedFastfile {

    func getIsCILane() {
        puts(message: .userDefined("getIsCILane"))
        puts(message: .userDefined(EnvironmentParser.string(key: "IS_CI")))
    }

    func getVersionNumberLane() {
        puts(message: .userDefined("getVersionNumberLane"))
        puts(message: .userDefined(Version.versionNumber))
    }

    func uploadBuildLane() {
        firebase.firebaseAppDistribution(
            ipaPath: "",
            app: "",
            groups: "",
            releaseNotes: "",
            firebaseCliToken: "",
            debug: true
        )
    }
}

// MARK: - Firebase

public protocol Firebase {

    func firebaseAppDistribution(
        ipaPath: String,
        app: String,
        groups: String,
        releaseNotes: String,
        firebaseCliToken: String,
        debug: Bool
    )
}
