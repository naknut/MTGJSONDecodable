import XCTest
@testable import MTGJSONDecodable

class StartingMaximumHandSizeModifierDecoderTests: XCTestCase {
    func testDecodeInvalidSign() {
        do {
            _ = try StartingMaximumHandSizeModifierDecoder.decode("")
            XCTFail("This call should throw.")
        } catch {
            guard let error = error as? StartingMaximumHandSizeModifierDecoder.DecodeStartingMaximumHandSizeModifierError else { XCTFail("Threw wrong error type."); return }
            XCTAssert(error == .invalidSign, "Error is of wrong case")
        }
    }
    
    func testDecodeInvalidValue() {
        do {
            _ = try StartingMaximumHandSizeModifierDecoder.decode("+")
            XCTFail("This call should throw.")
        } catch {
            guard let error = error as? StartingMaximumHandSizeModifierDecoder.DecodeStartingMaximumHandSizeModifierError else { XCTFail("Threw wrong error type."); return }
            XCTAssert(error == .invalidValue, "Error is of wrong case")
        }
    }
    
    func testDecodePositiveValue() {
        do {
            let maximumHandSizeModifier = try StartingMaximumHandSizeModifierDecoder.decode("+1")
            XCTAssert(maximumHandSizeModifier == 1, "Got the wrong value")
        } catch {
            XCTFail("Call should not throw")
        }
    }
    
    func testDecodeNegativeValue() {
        do {
            let maximumHandSizeModifier = try StartingMaximumHandSizeModifierDecoder.decode("-1")
            XCTAssert(maximumHandSizeModifier == -1, "Got the wrong value")
        } catch {
            XCTFail("Call should not throw")
        }
    }
    
    static var allTests = [
        ("testDecodeInvalidSign", testDecodeInvalidSign),
        ("testDecodeInvalidValue", testDecodeInvalidValue),
        ("testDecodePositiveValue", testDecodePositiveValue),
        ("testDecodeNegativeValue", testDecodeNegativeValue)
    ]
}
