// The Swift Programming Language
// https://docs.swift.org/swift-book

import Fastlane
import NimbleFastlane

Configuration.setUp(target: "Example", xcodeprojPath: "Example.xcodeproj")
Main().run(with: SharedFastfile())
