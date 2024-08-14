import XCTest
@testable import WWExtensions

final class DecimalTests: XCTestCase {

    func testDigits() throws {
        XCTAssertEqual(Decimal(0.1).ww.integerDigitCount, 1)
        XCTAssertEqual(Decimal(10.001).ww.integerDigitCount, 2)
        XCTAssertEqual(Decimal(123456).ww.integerDigitCount, 6)
    }

}
