//
//  Symbol.swift
//  FastlaneRunnerCore
//
//  Created by Su Ho on 27/09/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

import Fastlane
import Foundation

enum Symbol {

    static func uploadToCrashlytics(environment: Constant.Environment) {
        guard FileManager.default.fileExists(atPath: environment.dsymPath) else {
            return logger.info("Can't find the dSYM file")
        }
        uploadSymbolsToCrashlytics(
            dsymPath: environment.dsymPath,
            gspPath: .userDefined(environment.gspPath),
            appId: .userDefined(environment.firebaseAppId),
            binaryPath: .userDefined(Constant.uploadSymbolsBinaryPath),
            debug: true // We sometimes has issues with dSYM files, so I enabled this flag.
        )
    }
}
