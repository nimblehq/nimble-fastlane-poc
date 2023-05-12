import Fastlane

@main
public struct NimbleFastlane {

    public private(set) var text = "Hello, World!"

    public static func main() {
        Main().run(with: Fastfile())
    }
}
