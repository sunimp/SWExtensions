import XCTest
@testable import HsExtensions

final class BInaryConvertibleTests: XCTestCase {
    private let testData = Data([0x1F, 0x2D, 0x3C, 0x4B])

    func testSumUint16() throws {
        var result = Data()
        result = "1f2d".hs.hexData! + UInt16(0x3c4b).bigEndian
        XCTAssertEqual(testData, result)
    }

    func testSumHex() throws {
        var result = Data()
        result = "1f2d".hs.hexData! + String(data: Data([0x3C, 0x4B]), encoding: .utf8)!
        XCTAssertEqual(testData, result)
    }

}
