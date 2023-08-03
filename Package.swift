// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "NimbleFastlane",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "fastlaneRunner",
            targets: ["FastlaneRunner"]
        ),
        .library(
            name: "ProjectDescription",
            type: .dynamic,
            targets: ["ProjectDescription"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/thieurom/fastlane", branch: "spm-executable"),
        .package(url: "https://github.com/apple/swift-log", branch: "main"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.6"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0")
    ],
    targets: [
        .executableTarget(
            name: "FastlaneRunner",
            dependencies: [
                "ProjectDescription",
                "ConfigurationLoader",
                "FastlaneRunnerCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Logging", package: "swift-log")
            ]
        ),
        .target(
            name: "FastlaneRunnerCore",
            dependencies: [
                .product(name: "Fastlane", package: "fastlane"),
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
