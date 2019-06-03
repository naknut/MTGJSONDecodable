import XCTest
@testable import MTGJSONDecodable

class FrameEffectTests: XCTestCase {
    func testInitCompassLandDoubleFacedCard() {
        XCTAssert(Card.FrameEffect(rawValue: "compasslanddfc") == .compassLandDoubleFacedCard)
    }
    
    func testSunMoonDoubleFacedCard() {
        XCTAssert(Card.FrameEffect(rawValue: "sunmoondfc") == .sunMoonDoubleFacedCard)
    }
    
    static var allTests = [
        ("testInitCompassLandDoubleFacedCard", testInitCompassLandDoubleFacedCard),
        ("testSunMoonDoubleFacedCard", testSunMoonDoubleFacedCard),
    ]
}
