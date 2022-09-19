import XCTest
@testable import HsExtensions

final class TimerTests: XCTestCase {

    func testTimer() throws {

        let exp = expectation(description: "Timer fired!")

        let expectDate = Date(timeIntervalSinceNow: 2)
        var result = Date()
        _ = Timer.fireAfter(2) {
            result = Date()
            exp.fulfill()
        }

        waitForExpectations(timeout: 5)
        XCTAssertEqual(round(expectDate.timeIntervalSince1970), round(result.timeIntervalSince1970))
    }

}
