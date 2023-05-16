@testable import NimbleFastlane
import XCTest

final class ConfigurationTest: XCTestCase {

    func testSetUp() throws {
        Configuration.setUp(target: "target", xcodeprojPath: "xcodeprojPath")
        XCTAssertEqual(Configuration.shared.target, "target")
        XCTAssertEqual(Configuration.shared.xcodeprojPath, "xcodeprojPath")
    }
}
