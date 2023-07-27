//
//  Project.swift
//  
//
//  Created by Doan Thieu on 24/07/2023.
//

public struct Project {

    public let name: String
    public let targets: [Target]
    public let codeSigningRepo: String?

    public init(name: String, targets: [Target], codeSigningRepo: String? = nil) {
        self.name = name
        self.targets = targets
        self.codeSigningRepo = codeSigningRepo
    }
}
