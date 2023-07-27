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
        .package(url: "https://github.com/blyscuit/fastlane-swift-group", branch: "firebase-distribution-plugin"),
        .package(url: "https://github.com/apple/swift-log", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "FastlaneRunner",
            dependencies: [
                "ProjectDescription"
            ]
        ),
        .target(
            name: "FastlaneRunnerCore",
            dependencies: [
                .product(name: "Fastlane", package: "fastlane-swift-group"),
                .product(name: "Logging", package: "swift-log")
            ]
        ),
        .target(
            name: "ProjectDescription"
        ),
        .testTarget(
            name: "FastlaneRunnerTests",
            dependencies: [
                .target(name: "FastlaneRunner")
            ]
        )
    ]
)
