import Fastlane

public class SharedFastfile: LaneFile {

    public func getIsCILane() {
        puts(message: .userDefined("getIsCILane"))
        puts(message: .userDefined(EnvironmentParser.string(key: "IS_CI")))
    }

    public func getVersionNumberLane() {
        puts(message: .userDefined("getVersionNumberLane"))
        puts(message: .userDefined(Version.versionNumber))
    }
}
