import Foundation
import XCTest
@testable import WWExtensions

public func date(string: String) -> Date {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"

    return formatter.date(from: string)!
}

// MARK: - DateTests

final class DateTests: XCTestCase {

    private let testDate = date(string: "2022-09-18 03:17:11.000")

    func testStartHour() throws {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        let expected = date(string: "2022-09-18 03:00:00.000")
        XCTAssertEqual(testDate.ww.startOfHour, expected)
    }

    func testStartDay() throws {
        let expected = date(string: "2022-09-18 00:00:00.000")
        XCTAssertEqual(testDate.ww.startOfDay, expected)
    }

    func testStartMonth() throws {
        let expected = date(string: "2022-09-01 00:00:00.000")
        XCTAssertEqual(testDate.ww.startOfMonth, expected)
    }

    func testStartMonthAgo() throws {
        let expected = date(string: "2022-07-01 00:00:00.000")
        XCTAssertEqual(testDate.ww.startOfMonth(ago: 2), expected)
    }

}
