//
//  ConfigurationLoader.swift
//  ConfigurationLoader
//
//  Created by Doan Thieu on 27/07/2023.
//

import ProjectDescription
import Yams

public class ConfigurationLoader {

    private static var yamlDecoder: YAMLDecoder = {
        let decoder = YAMLDecoder()
        return decoder
    }()

    public init() {}

    public func loadProjectConfiguration() throws -> Project {
        /*
        let project = Project(
            name: "MyApp",
            targets: [
                .target(
                    name: "MyApp",
                    builds: [
                        .development(bundleId: "com.mycompany.myapp.dev"),
                        .staging(
                            bundleId: "com.mycompany.myapp.staging",
                            distribution: .init(
                                method: .adHoc,
                                destination: .firebase(appId: "123-abc-staging"),
                                testerGroups: ["Beta Testers"]
                            )
                        ),
                        .production(
                            bundleId: "com.mycompany.myapp",
                            distribution: .init(
                                method: .appStore,
                                destination: .appStore
                            )
                        )
                    ]
                ),
                .testTarget(name: "MyAppTests"),
                .testTarget(name: "MyAppKIFTests")
            ],
            codeSigningRepo: "git@github.com:mycompany/ios-match-certificates.git"
        )
        */

        // TODO: This is an example of a valid configuration matches with above `Project` instance.
        let config = """
        name: MyApp
        targets:
        - name: MyApp
          builds:
          - config: development
            bundleId: com.mycompany.myapp.dev
          - config: staging
            bundleId: com.mycompany.myapp.staging
            distribution:
              method: adhoc
              firebase: 123-abc-staging
              testers: [Beta Testers]
          - config: production
            bundleId: com.mycompany.myapp
            distribution:
              method: appstore
              appstore: True
        - name: MyAppTests
          test: True
        - name: MyAppKIFTests
          test: True
        gitCodeSigning: git@github.com:mycompany/ios-match-certificates.git
        """

        return try Self.yamlDecoder.decode(ProjectModel.self, from: config).toProject()
    }
}
