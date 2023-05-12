//
//  EnvironmentParser.swift
//  FastlaneRunner
//
//  Created by Su T. on 09/11/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

import Fastlane

enum EnvironmentParser {

    static func bool(key: String) -> Bool {
        true//string(key: key) == "true"
    }

    static func string(key: String) -> String {
        ""//environmentVariable(get: .userDefined(key))
    }
}
