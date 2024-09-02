//
//  ArrayTests.swift
//
//  Created by Sun on 2022/9/20.
//

@testable import WWExtensions
import XCTest

final class ArrayTests: XCTestCase {
    // MARK: Properties

    private let testArray = ["a", "b", "c", "d", "e"]

    // MARK: Functions

    func testUnique() throws {
        let doubleArray = testArray + testArray
        XCTAssertEqual(testArray, doubleArray.ww.unique.sorted(by: <))
    }

    func testChunks() throws {
        XCTAssertEqual(testArray.ww.chunked(into: 2), [["a", "b"], ["c", "d"], ["e"]])
    }

    func testAtIndex() throws {
        XCTAssertEqual(testArray.ww.at(2), "c")
        XCTAssertEqual(testArray.ww.at(5), nil)
    }
}
