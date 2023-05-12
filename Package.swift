// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "NimbleFastlane",
    dependencies: [
        .package(url: "https://github.com/blyscuit/fastlane-swift-group", branch: "custom-plugin"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "NimbleFastlane",
            dependencies: [
                .product(name: "Fastlane", package: "fastlane-swift-group")
            ]),
        .testTarget(
            name: "NimbleFastlaneTests",
            dependencies: ["NimbleFastlane"]),
    ]
)
