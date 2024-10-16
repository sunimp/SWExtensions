//
//  ArrayTests.swift
//
//  Created by Sun on 2022/9/20.
//

@testable import SWExtensions
import XCTest

final class ArrayTests: XCTestCase {
    // MARK: Properties

    private let testArray = ["a", "b", "c", "d", "e"]

    // MARK: Functions

    func testUnique() throws {
        let doubleArray = testArray + testArray
        XCTAssertEqual(testArray, doubleArray.sw.unique.sorted(by: <))
    }

    func testChunks() throws {
        XCTAssertEqual(testArray.sw.chunked(into: 2), [["a", "b"], ["c", "d"], ["e"]])
    }

    func testAtIndex() throws {
        XCTAssertEqual(testArray.sw.at(2), "c")
        XCTAssertEqual(testArray.sw.at(5), nil)
    }
}
