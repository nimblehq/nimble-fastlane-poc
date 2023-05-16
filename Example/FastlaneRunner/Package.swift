// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FastlaneRunner",
    products: [
        .executable(
            name: "fastlaneRunner",
            targets: ["FastlaneRunner"]
        )
    ],
    dependencies: [
        .package(path: "../../")
    ],
    targets: [
        .executableTarget(
            name: "FastlaneRunner",
            dependencies: [
                .product(name: "NimbleFastlane", package: "nimble-fastlane")
            ],
            path: "Sources"
        )
    ]
)
