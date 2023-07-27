/*
import ProjectDescription

let project = Project(
    name: "MyApp",
    targets: [
        .target(
            name: "MyApp",
            builds: [
                .development(bundleId: "com.mycompany.myapp.dev"),
                .staging(
                    bundleId: "com.mycompany.myapp.staging",
                    distribution: .init(
                        method: .adHoc,
                        destination: .firebase(appId: "123staging"),
                        testerGroups: ["Beta Testers"]
                    )
                ),
                .production(
                    bundleId: "com.mycompany.myapp",
                    distribution: .init(
                        method: .appStore,
                        destination: .appStore
                    )
                )
            ]
        ),
        .testTarget(name: "MyAppTests"),
        .testTarget(name: "MyAppKIFTests")
    ],
    codeSigningRepo: "git@github.com:mycompany/ios-match-certificates.git"
)
*/

@main
public struct FastlaneRunner {

    public init() {}

    public static func main() {
        print("Hello, World!")
    }
}
