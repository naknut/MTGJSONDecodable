import XCTest
@testable import MTGJSONDecodable

final class DuelDeckSideTests: XCTestCase {

    func testDecodeLeft() {
        let left = Card.DuelDeckSide(rawValue: "a")
        XCTAssert(left == .left)
    }
    
    func testDecodeRight() {
        let right = Card.DuelDeckSide(rawValue: "b")
        XCTAssert(right == .right)
    }
    
    static var allTests = [
        ("testDecodeLeft", testDecodeLeft),
        ("testDecodeRight", testDecodeRight)
    ]
}
