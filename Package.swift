// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "NimbleFastlane",
    products: [
        .library(
            name: "NimbleFastlane",
            targets: ["NimbleFastlane"]),
    ],
    dependencies: [
        .package(url: "https://github.com/fastlane/fastlane", .branch("master"))
    ],
    targets: [
        .target(
            name: "NimbleFastlane",
            dependencies: [
                .product(name: "Fastlane", package: "fastlane")
            ],
            path: "Sources"
            ),
        .testTarget(
            name: "NimbleFastlaneTests",
            dependencies: ["NimbleFastlane"],
            path: "Tests"
            ),
    ]
)
