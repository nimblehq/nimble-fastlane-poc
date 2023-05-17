// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Algorithms
import Foundation
import NimbleFastlane

// MARK: - Fastfile

class Fastfile: LaneFile, NewSharedFastfile {

    var firebase: NimbleFastlane.Firebase! = FirebaseImplementation()

    override init() {
        super.init()
        Configuration.setUp(target: "Example", xcodeprojPath: "./Example.xcodeproj")
    }

    func customLane() {
        desc("Description of what the lane does")
        getVersionNumberLane()
    }
}

// MARK: - FirebaseImplementation

class FirebaseImplementation: Firebase {

    func firebaseAppDistribution(
        ipaPath: String,
        app: String,
        groups: String,
        releaseNotes: String,
        firebaseCliToken: String,
        debug: Bool
    ) {
        FastlaneRunner.firebaseAppDistribution(
            ipaPath: .userDefined(ipaPath),
            app: .userDefined(app),
            groups: .userDefined(groups),
            releaseNotes: .userDefined(releaseNotes),
            firebaseCliToken: .userDefined(firebaseCliToken),
            debug: .userDefined(debug)
        )
    }
}
