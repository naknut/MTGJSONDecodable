import XCTest
@testable import MTGJSONDecodable

final class ColorTests: XCTestCase {

    func testDecodeWhite() {
        let white = Card.Color(rawValue: "W")
        XCTAssert(white == .white)
    }
    
    func testDecodeBlue() {
        let blue = Card.Color(rawValue: "U")
        XCTAssert(blue == .blue)
    }
    
    func testDecodeBlack() {
        let black = Card.Color(rawValue: "B")
        XCTAssert(black == .black)
    }
    
    func testDecodeRed() {
        let red = Card.Color(rawValue: "R")
        XCTAssert(red == .red)
    }
    
    func testDecodeGreen() {
        let green = Card.Color(rawValue: "G")
        XCTAssert(green == .green)
    }
    
    static var allTests = [
        ("testDecodeWhite", testDecodeWhite),
        ("testDecodeBlue", testDecodeBlue),
        ("testDecodeBlack", testDecodeBlack),
        ("testDecodeRed", testDecodeRed),
        ("testDecodeGreen", testDecodeGreen)
    ]
}
