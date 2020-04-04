import XCTest

final class ResourceGenTests: XCTestCase {
    func testAssertTrue() throws {
        XCTAssertTrue(true)
    }

    static var allTests = [
        ("testAssertTrue", testAssertTrue),
    ]
}
