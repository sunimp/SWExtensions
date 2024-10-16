//
//  StringTests.swift
//
//  Created by Sun on 2022/9/20.
//

@testable import SWExtensions
import XCTest

// MARK: - StringTests

final class StringTests: XCTestCase {
    // MARK: Properties

    private let testData = Data([0x1F, 0x2D, 0x3C])

    // MARK: Functions

    func testInitData() throws {
        XCTAssertEqual("0x1f2d3c".sw.hexData, testData)
        XCTAssertEqual("0x1F2d3C".sw.hexData, testData)
        XCTAssertEqual("1F2d3C".sw.hexData, testData)
    }

    func testStripPrefix() throws {
        XCTAssertEqual("0x1f2d3c".sw.stripHexPrefix(), "1f2d3c")
        XCTAssertEqual("1f2d3c".sw.stripHexPrefix(), "1f2d3c")
    }

    func testReversedHexData() throws {
        XCTAssertEqual("0x1f2d3c".sw.reversedHexData, Data([0x3C, 0x2D, 0x1F]))
    }
}

func byteArrayLittleEndian(int: Int) -> [UInt8] {
    [
        UInt8(int & 0x0000_00FF),
        UInt8((int & 0x0000_FF00) >> 8),
        UInt8((int & 0x00FF_0000) >> 16),
        UInt8((int & 0xFF00_0000) >> 24),
    ]
}
