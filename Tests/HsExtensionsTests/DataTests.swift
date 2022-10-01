import XCTest
@testable import HsExtensions

final class DataTests: XCTestCase {
    private let testData = Data([0x1F, 0x2D, 0x3C])

    func testHex() throws {
        XCTAssertEqual(testData.hs.hex, "1f2d3c")
    }

    func testReversedHex() throws {
        XCTAssertEqual(testData.hs.reversedHex, "3c2d1f")
    }

    func testDataFrom() throws {
        let data = Data(from: Int8(-1))
        XCTAssertEqual(data.hs.hex, "ff")
    }

}
