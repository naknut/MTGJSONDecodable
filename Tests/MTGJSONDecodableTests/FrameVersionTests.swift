import XCTest
@testable import MTGJSONDecodable

class FrameVersionTests: XCTestCase {
    func testInitNineteenNinetyThree() {
        XCTAssert(Card.FrameVersion(rawValue: "1993") == .nineteenNinetyThree)
    }
    
    func testInitNineteenNinetySeven() {
        XCTAssert(Card.FrameVersion(rawValue: "1997") == .nineteenNinetySeven)
    }
    
    func testInitTwentyOThree() {
        XCTAssert(Card.FrameVersion(rawValue: "2003") == .twentyOThree)
    }
    
    func testInitTwentyFifteen() {
        XCTAssert(Card.FrameVersion(rawValue: "2015") == .twentyFifteen)
    }
    
    static var allTests = [
        ("testInitNineteenNinetyThree", testInitNineteenNinetyThree),
        ("testInitNineteenNinetySeven", testInitNineteenNinetySeven),
        ("testInitTwentyOThree", testInitTwentyOThree),
        ("testInitTwentyFifteen", testInitTwentyFifteen)
    ]
}
