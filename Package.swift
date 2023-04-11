// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "NimbleFastlane",
    products: [
        .library(
            name: "NimbleFastlane",
            targets: ["NimbleFastlane"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/fastlane/fastlane", from: "2.212.0")
    ],
    targets: [
        .target(
            name: "NimbleFastlane",
            dependencies: [
                .product(name: "Fastlane", package: "fastlane")
            ]
        ),
        .testTarget(
            name: "NimbleFastlaneTests",
            dependencies: ["NimbleFastlane"]
        )
    ]
)
