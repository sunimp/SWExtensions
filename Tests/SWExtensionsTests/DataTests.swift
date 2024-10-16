//
//  DataTests.swift
//
//  Created by Sun on 2022/9/20.
//

@testable import SWExtensions
import XCTest

final class DataTests: XCTestCase {
    // MARK: Properties

    private let testData = Data([0x1F, 0x2D, 0x3C])

    // MARK: Functions

    func testHex() throws {
        XCTAssertEqual(testData.sw.hex, "1f2d3c")
    }

    func testReversedHex() throws {
        XCTAssertEqual(testData.sw.reversedHex, "3c2d1f")
    }

    func testDataFrom() throws {
        let data = Data(from: Int8(-1))
        XCTAssertEqual(data.sw.hex, "ff")
    }
}
