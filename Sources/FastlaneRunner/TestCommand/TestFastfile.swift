//
//  TestFastfile.swift
//  
//
//  Created by Doan Thieu on 28/07/2023.
//

import Fastlane
import FastlaneRunnerCore

class TestFastfile: LaneFile {

    func testLane(withOptions options: [String: String]?) {
        if let scheme = options?["scheme"],
           let targets = options?["targets"]?.components(separatedBy: ",") {
            Test.buildAndTest(
                scheme: scheme,
                targets: targets,
                devices: ["iPhone 14 Pro Max"]
            )
        }
    }
}
