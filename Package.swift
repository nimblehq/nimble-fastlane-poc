// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "NimbleFastlane",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "swift-fastlaneRunner",
            targets: ["FastlaneRunner"]
        ),
        .library(
            name: "ProjectDescription",
            type: .dynamic,
            targets: ["ProjectDescription"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/fastlane/fastlane", from: "2.214.0")
    ],
    targets: [
        .target(
            name: "ProjectDescription"
        ),
        .executableTarget(
            name: "FastlaneRunner",
            dependencies: [
                "ProjectDescription"
            ]
        ),
        .testTarget(
            name: "FastlaneRunnerTests",
            dependencies: [
                .target(name: "FastlaneRunner")
            ]
        )
    ]
)
