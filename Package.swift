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
        .package(url: "https://github.com/apple/swift-log", branch: "main"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.6")
    ],
    targets: [
        .executableTarget(
            name: "FastlaneRunner",
            dependencies: [
                "ProjectDescription",
                "ConfigurationLoader"
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
            name: "ConfigurationLoader",
            dependencies: [
                "ProjectDescription",
                .product(name: "Yams", package: "Yams")
            ]
        ),
        .target(name: "ProjectDescription"),
        .testTarget(
            name: "FastlaneRunnerTests",
            dependencies: [
                .target(name: "FastlaneRunner")
            ]
        )
    ]
)
