//
//  ProjectModel.swift
//  ConfigurationLoader
//
//  Created by Doan Thieu on 27/07/2023.
//

import ProjectDescription

struct ProjectModel: Decodable {

    let name: String
    let targets: [TargetModel]
    let gitCodeSigning: String?
}

extension ProjectModel {

    func toProject() -> Project {
        return .init(
            name: name,
            targets: targets.map { $0.toTarget() },
            codeSigningRepo: gitCodeSigning
        )
    }
}
