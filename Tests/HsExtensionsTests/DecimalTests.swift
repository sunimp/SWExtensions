import XCTest
@testable import HsExtensions

final class DecimalTests: XCTestCase {

    func testDigits() throws {
        XCTAssertEqual(Decimal(0.1).hs.integerDigitCount, 1)
        XCTAssertEqual(Decimal(10.001).hs.integerDigitCount, 2)
        XCTAssertEqual(Decimal(123456).hs.integerDigitCount, 6)
    }

}
