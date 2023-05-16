import Fastlane
import Foundation

public enum Version {

    // MARK: - Getting

    public static var versionNumber: String {
        get {
            getVersionNumber(
                xcodeproj: .userDefined(Configuration.shared.xcodeprojPath),
                target: .userDefined(Configuration.shared.target)
            )
        }

        set {
            incrementVersionNumber(
                versionNumber: .userDefined(newValue),
                xcodeproj: .userDefined(Configuration.shared.xcodeprojPath)
            )
        }
    }

    public static var buildNumber: String {
        get {
            getBuildNumber(xcodeproj: .userDefined(Configuration.shared.xcodeprojPath))
        }

        set {
            incrementBuildNumber(
                buildNumber: .userDefined(newValue),
                xcodeproj: .userDefined(Configuration.shared.xcodeprojPath)
            )
        }
    }

    public static func getVersionAndBuildNumber() -> String {
        "\(versionNumber) (Build: \(buildNumber)"
    }

    public static var releaseTag: String {
        "release/\(versionNumber)"
    }
}
