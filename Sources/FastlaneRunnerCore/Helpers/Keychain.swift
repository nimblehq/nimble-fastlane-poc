//
//  Keychain.swift
//  FastlaneRunnerCore
//
//  Created by Su Ho on 22/09/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

import Fastlane

enum Keychain {

    static func create() {
        createKeychain(
            name: .userDefined(Constant.keychainName),
            password: Secret.keychainPassword,
            defaultKeychain: .userDefined(true),
            unlock: .userDefined(true),
            timeout: 3600
        )
    }
}
