import Fastlane
import Foundation

public enum EnvironmentParser {

    public static func bool(key: String) -> Bool {
        string(key: key) == "true"
    }

    public static func string(key: String) -> String {
        environmentVariable(get: .userDefined(key))
    }
}
