//
//  DecimalTests.swift
//
//  Created by Sun on 2024/8/14.
//

@testable import WWExtensions
import XCTest

final class DecimalTests: XCTestCase {
    func testDigits() throws {
        XCTAssertEqual(Decimal(0.1).ww.integerDigitCount, 1)
        XCTAssertEqual(Decimal(10.001).ww.integerDigitCount, 2)
        XCTAssertEqual(Decimal(123456).ww.integerDigitCount, 6)
    }
}
