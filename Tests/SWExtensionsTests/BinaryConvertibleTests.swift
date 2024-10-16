//
//  BinaryConvertibleTests.swift
//
//  Created by Sun on 2022/9/20.
//

@testable import SWExtensions
import XCTest

final class BInaryConvertibleTests: XCTestCase {
    // MARK: Properties

    private let testData = Data([0x1F, 0x2D, 0x3C, 0x4B])

    // MARK: Functions

    func testSumUint16() throws {
        var result = Data()
        result = "1f2d".sw.hexData! + UInt16(0x3C4B).bigEndian
        XCTAssertEqual(testData, result)
    }

    func testSumHex() throws {
        var result = Data()
        result = "1f2d".sw.hexData! + String(data: Data([0x3C, 0x4B]), encoding: .utf8)!
        XCTAssertEqual(testData, result)
    }
}
