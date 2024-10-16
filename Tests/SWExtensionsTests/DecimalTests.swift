//
//  DecimalTests.swift
//
//  Created by Sun on 2024/8/14.
//

@testable import SWExtensions
import XCTest

final class DecimalTests: XCTestCase {
    func testDigits() throws {
        XCTAssertEqual(Decimal(0.1).sw.integerDigitCount, 1)
        XCTAssertEqual(Decimal(10.001).sw.integerDigitCount, 2)
        XCTAssertEqual(Decimal(123456).sw.integerDigitCount, 6)
    }
}
