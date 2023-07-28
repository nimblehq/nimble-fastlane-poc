# FastlaneRunner Configuration File
Create a `project.yml` configuration file at the root directory.
An example of configuration file:
```yml
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
      appstore: true
- name: MyAppTests
  test: true
- name: MyAppKIFTests
  test: true
gitCodeSigning: git@github.com:mycompany/ios-match-certificates.git
```
