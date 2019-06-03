import XCTest
@testable import MTGJSONDecodable

final class CardTests: XCTestCase {
    
    var card: Card!
    var jsonDict: [String : Any]!
    
    override func setUp() {
        super.setUp()
        
        if let file = Bundle(for: CardTests.self).path(forResource: "Niv-Mizzet Reborn", ofType: "json") {
            let testData = try! Data(contentsOf: URL(fileURLWithPath: file))
            card = try! JSONDecoder().decode(Card.self, from: testData)
            jsonDict = try! JSONSerialization.jsonObject(with: testData, options: []) as! [String : Any]
        } else {
            XCTFail("Can't find the test JSON file")
        }
    }
    
    func testArtistDecoding() {
        XCTAssert(card.artist == jsonDict["artist"] as! String)
    }
    
    func testBorderColorDecoding() {
        XCTAssert(card.borderColor == .black)
        
        if let borderlessCardFile = Bundle(for: CardTests.self).path(forResource: "Ajani, Mentor of Heroes", ofType: "json") {
            let borderlessCard = try! JSONDecoder().decode(Card.self, from: try! Data(contentsOf: URL(fileURLWithPath: borderlessCardFile)))
            XCTAssert(borderlessCard.borderColor == .borderless)
        } else {
            XCTFail("Missing Ajani, Mentor of Heroes.json not found")
        }
        
        if let goldCardFile = Bundle(for: CardTests.self).path(forResource: "Abbey Gargoyles", ofType: "json") {
            let goldCard = try! JSONDecoder().decode(Card.self, from: try! Data(contentsOf: URL(fileURLWithPath: goldCardFile)))
            XCTAssert(goldCard.borderColor == .gold)
        } else {
            XCTFail("Missing Abbey Gargoyles.json not found")
        }
        
        if let silverCardFile = Bundle(for: CardTests.self).path(forResource: "Rumors of My Death...", ofType: "json") {
            let silverCard = try! JSONDecoder().decode(Card.self, from: try! Data(contentsOf: URL(fileURLWithPath: silverCardFile)))
            XCTAssert(silverCard.borderColor == .silver)
        } else {
            XCTFail("Missing Rumors of My Death....json not found")
        }
        
        if let whiteCardFile = Bundle(for: CardTests.self).path(forResource: "Abduction", ofType: "json") {
            let whiteCard = try! JSONDecoder().decode(Card.self, from: try! Data(contentsOf: URL(fileURLWithPath: whiteCardFile)))
            XCTAssert(whiteCard.borderColor == .white)
        } else {
            XCTFail("Missing Abduction.json not found")
        }
    }
    
    func testColorIdentityDecoding() {
        XCTAssert(card.colorIdentity.contains(.white))
        XCTAssert(card.colorIdentity.contains(.blue))
        XCTAssert(card.colorIdentity.contains(.black))
        XCTAssert(card.colorIdentity.contains(.red))
        XCTAssert(card.colorIdentity.contains(.green))
        XCTAssert(card.colorIdentity.count == 5)
    }
    
    func testColorIndicatorDecoding() {
        XCTAssert(card.colorIndicator == nil, "colorIndicator should be set to nil")
        
        if let nicolBolasCardFile = Bundle(for: CardTests.self).path(forResource: "Nicol Bolas, the Arisen", ofType: "json") {
            let nicolBolasCard = try! JSONDecoder().decode(Card.self, from: try! Data(contentsOf: URL(fileURLWithPath: nicolBolasCardFile)))
            
            if let nicolBolasColorIndicator = nicolBolasCard.colorIndicator {
                XCTAssert(nicolBolasColorIndicator.contains(.blue))
                XCTAssert(nicolBolasColorIndicator.contains(.black))
                XCTAssert(nicolBolasColorIndicator.contains(.red))
                XCTAssert(nicolBolasColorIndicator.count == 3)
            } else {
                XCTFail("colorIndicator should not be nil")
            }
        } else {
            XCTFail("Nicol Bolas, the Arisen.json not found")
        }
    }
    
    func testColorsDecoding() {
        XCTAssert(card.colors.contains(.white))
        XCTAssert(card.colors.contains(.blue))
        XCTAssert(card.colors.contains(.black))
        XCTAssert(card.colors.contains(.red))
        XCTAssert(card.colors.contains(.green))
        XCTAssert(card.colors.count == 5)
    }
    
    func testConvetedManaCostDecoding() {
        XCTAssert(card.convertedManaCost == jsonDict["convertedManaCost"] as! Float, "convertedManaCost does not match JSON")
    }
    
    func testDuelDeckSodeDecoding() {
        XCTAssert(card.duelDeckSide == nil, "duelDeckSide should be nil")
        
        if let duelDeckLeftSideCardFile = Bundle(for: CardTests.self).path(forResource: "Artificer's Epiphany", ofType: "json") {
            let duelDeckLeftSideCard = try! JSONDecoder().decode(Card.self, from: try! Data(contentsOf: URL(fileURLWithPath: duelDeckLeftSideCardFile)))
            XCTAssert(duelDeckLeftSideCard.duelDeckSide == .left, "duelDeckSide should be set to .left")
        } else {
            XCTFail("Artificer's Epiphany.json not found")
        }
    }
    
    func testFaceConvertedManaCostDecoding() {
        XCTAssert(card.faceConvertedManaCost == nil, "faceConvertedManaCost should be nil")
        
        if let bedeckCardFile = Bundle(for: CardTests.self).path(forResource: "Bedeck", ofType: "json") {
            let bedeckCardData = try! Data(contentsOf: URL(fileURLWithPath: bedeckCardFile))
            let bedeckCard = try! JSONDecoder().decode(Card.self, from: bedeckCardData)
            let bedeckJsonDict = try! JSONSerialization.jsonObject(with: bedeckCardData, options: []) as! [String : Any]
            XCTAssert(bedeckCard.faceConvertedManaCost != nil, "faceConvertedManaCost should not be nil")
            XCTAssert(bedeckCard.faceConvertedManaCost == (bedeckJsonDict["faceConvertedManaCost"] as! Float), "faceConvertedManaCost does not match JSON")
        } else {
            XCTFail("Bedeck.json not found")
        }
    }
    
    func testFlavourTextDecoding() {
        XCTAssert(card.flavorText == nil, "flavorText should be set to nil")
        
        if let flavourTextCardFile = Bundle(for: CardTests.self).path(forResource: "Abbey Gargoyles", ofType: "json") {
            let flavourTextCardFileData = try! Data(contentsOf: URL(fileURLWithPath: flavourTextCardFile))
            let flavourTextCard = try! JSONDecoder().decode(Card.self, from: flavourTextCardFileData)
            let flavourTextJsonDict = try! JSONSerialization.jsonObject(with: flavourTextCardFileData, options: []) as! [String : Any]
            XCTAssert(flavourTextCard.flavorText != nil, "flavorText should not be set to nil")
            XCTAssert(flavourTextCard.flavorText == flavourTextJsonDict["flavorText"] as? String, "flavorText does not match JSON")
        } else {
            XCTFail("Missing Abbey Gargoyles.json not found")
        }
    }

    static var allTests = [
        ("testArtistDecoding", testArtistDecoding),
        ("testBorderColorDecoding", testBorderColorDecoding),
        ("testColorIdentityDecoding", testColorIdentityDecoding),
        ("testColorIndicatorDecoding", testColorIndicatorDecoding),
        ("testColorsDecoding", testColorsDecoding),
        ("testConvetedManaCostDecoding", testConvetedManaCostDecoding),
        ("testDuelDeckSodeDecoding", testDuelDeckSodeDecoding),
        ("testFaceConvertedManaCostDecoding", testFaceConvertedManaCostDecoding),
        ("testFlavourTextDecoding", testFlavourTextDecoding)
    ]
}
