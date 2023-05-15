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
        .package(url: "https://github.com/blyscuit/fastlane-swift-group", branch: "firebase-distribution-plugin"),
    ],
    targets: [
        .target(
            name: "NimbleFastlane",
            dependencies: [
                .product(name: "Fastlane", package: "fastlane-swift-group")
            ]
        ),
        .testTarget(
            name: "NimbleFastlaneTests",
            dependencies: ["NimbleFastlane"]
        )
    ]
)
