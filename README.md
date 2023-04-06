# Nimble Fastlane

This library allows developers to easily integrate all shared lanes (e.g., building, deploying) into iOS projects.

## Requirements

- Swift 5.7+

## Usage

### Step 1

To use this library (and [fastlane][fastlane]) in your iOS project, you need to create an executable Swift Package project with:

```bash
swift package init --type executable --name Fastlane
```

### Step 2

Add the [nimble-fastlane][nimble-fastlane] dependency to your `Package.swift`.

```swift
.package(url: "https://github.com/nimblehq/nimble-fastlane", branch: "main")
```

Here is an example:

```swift
// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "FastlaneRunner",
    products: [
        .executable(
            name: "fastlaneRunner",
            targets: ["FastlaneRunner"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/nimblehq/nimble-fastlane", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "FastlaneRunner",
            dependencies: [
                .byNameItem(name: "NimbleFastlane", condition: nil)
            ],
            path: "FastlaneRunner"
        )
    ]
)
```

### Step 3

Add an entry point (`@main`) or a `main.swift` file (mandatory for executable Swift Packages), configure `Constants`, and start the `fastlane runloop`. For example:

```swift
import Fastlane
import FastlaneTemplates

@main
public enum FastlaneRunner {
    public static func main() {
        NimbleFastlane.configure(projectPath: "path/to/xcodeproj") // And with more constants
        Main().run(with: SharedFastfile())
    }
}
```

### Step 4

Build release the executable FastlaneRunner project:

```bash
swift build -c release
```

Copy to the `bin` project and use it:

```bash
cp .build/release/fastlaneRunner ./bin/fastlaneRunner

./bin/fastlaneRunner lane buildAndTest
```

## License

This project is Copyright (c) 2014 and onwards Nimble. It is free software and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: /LICENSE

## About
<a href="https://nimblehq.co/">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://assets.nimblehq.co/logo/dark/logo-dark-text-160.png">
    <img alt="Nimble logo" src="https://assets.nimblehq.co/logo/light/logo-light-text-160.png">
  </picture>
</a>

This project is maintained and funded by Nimble.

We ❤️ open source and do our part in sharing our work with the community!
See [our other projects][community] or [hire our team][hire] to help build your product.

Want to join? [Check out our Jobs][jobs]!

[community]: https://github.com/nimblehq
[hire]: https://nimblehq.co/
[jobs]: https://jobs.nimblehq.co/
[fastlane]: https://github.com/fastlane/fastlane
[nimble-fastlane]: https://github.com/nimblehq/nimble-fastlane
