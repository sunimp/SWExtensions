import XCTest
@testable import HsExtensions

final class ArrayTests: XCTestCase {
    private let testArray = ["a", "b", "c", "d", "e"]

    func testUnique() throws {
        let doubleArray = testArray + testArray
        XCTAssertEqual(testArray, doubleArray.hs.unique.sorted(by: <))
    }

    func testChunks() throws {
        XCTAssertEqual(testArray.hs.chunked(into: 2), [["a", "b"], ["c", "d"], ["e"]])
    }

    func testAtIndex() throws {
        XCTAssertEqual(testArray.hs.at(2), "c")
        XCTAssertEqual(testArray.hs.at(5), nil)
    }

}
