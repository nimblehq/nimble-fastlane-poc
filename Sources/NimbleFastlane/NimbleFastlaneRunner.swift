import Fastlane

public struct NimbleFastlaneRunner {

    public static func start() {
        Main().run(with: Fastfile())
    }
}