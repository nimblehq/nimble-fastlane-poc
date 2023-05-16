//
//  File.swift
//
//
//  Created by Su Ho on 16/05/2023.
//

public struct Configuration {

    internal let target: String
    internal let xcodeprojPath: String

    private init(target: String, xcodeprojPath: String) {
        self.target = target
        self.xcodeprojPath = xcodeprojPath
    }

    internal static var shared: Configuration!

    public static func setUp(target: String, xcodeprojPath: String) {
        shared = Configuration(target: target, xcodeprojPath: xcodeprojPath)
    }
}
