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
    
    func testArtistEncoding() {
        XCTAssert(card.artist == jsonDict["artist"] as! String)
    }
    
    func testBorderColorEncoding() {
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
    
    func testColorIdentityEncoding() {
        XCTAssert(card.colorIdentity.contains(.white))
        XCTAssert(card.colorIdentity.contains(.blue))
        XCTAssert(card.colorIdentity.contains(.black))
        XCTAssert(card.colorIdentity.contains(.red))
        XCTAssert(card.colorIdentity.contains(.green))
        XCTAssert(card.colorIdentity.count == 5)
    }
    
    func testColorIndicatorEncoding() {
        XCTAssert(card.colorIndicator == nil)
        
        if let nicolBolasCardFile = Bundle(for: CardTests.self).path(forResource: "Nicol Bolas, the Arisen", ofType: "json") {
            let nicolBolasCard = try! JSONDecoder().decode(Card.self, from: try! Data(contentsOf: URL(fileURLWithPath: nicolBolasCardFile)))
            
            if let nicolBolasColorIndicator = nicolBolasCard.colorIndicator {
                XCTAssert(nicolBolasColorIndicator.contains(.blue))
                XCTAssert(nicolBolasColorIndicator.contains(.black))
                XCTAssert(nicolBolasColorIndicator.contains(.red))
                XCTAssert(nicolBolasColorIndicator.count == 3)
            } else {
                XCTFail("colorIndicator set to nil when should be set")
            }
        } else {
            XCTFail("Nicol Bolas, the Arisen.json not found")
        }
    }
    
    func testColorsEncoding() {
        XCTAssert(card.colors.contains(.white))
        XCTAssert(card.colors.contains(.blue))
        XCTAssert(card.colors.contains(.black))
        XCTAssert(card.colors.contains(.red))
        XCTAssert(card.colors.contains(.green))
        XCTAssert(card.colors.count == 5)
    }
    
    func testConvetedManaCostEncoding() {
        XCTAssert(card.convertedManaCost == jsonDict["convertedManaCost"] as! Float)
    }
    
    func testDuelDeckSodeEncoding() {
        XCTAssert(card.duelDeckSide == nil)
        
        if let duelDeckLeftSideCardFile = Bundle(for: CardTests.self).path(forResource: "Artificer's Epiphany", ofType: "json") {
            let duelDeckLeftSideCard = try! JSONDecoder().decode(Card.self, from: try! Data(contentsOf: URL(fileURLWithPath: duelDeckLeftSideCardFile)))
            XCTAssert(duelDeckLeftSideCard.duelDeckSide == .left)
        } else {
            XCTFail("Artificer's Epiphany.json not found")
        }
        if let duelDeckRightSideCardFile = Bundle(for: CardTests.self).path(forResource: "Foundry of the Consuls", ofType: "json") {
            let duelDeckRightSideCard = try! JSONDecoder().decode(Card.self, from: try! Data(contentsOf: URL(fileURLWithPath: duelDeckRightSideCardFile)))
            XCTAssert(duelDeckRightSideCard.duelDeckSide == .right)
        } else {
            XCTFail("Foundry of the Consuls.json not found")
        }
    }
    
    func testFaceConvertedManaCostEncoding() {
        XCTAssert(card.faceConvertedManaCost == nil)
        
        if let bedeckCardFile = Bundle(for: CardTests.self).path(forResource: "Bedeck", ofType: "json") {
            let bedeckCardData = try! Data(contentsOf: URL(fileURLWithPath: bedeckCardFile))
            let bedeckCard = try! JSONDecoder().decode(Card.self, from: bedeckCardData)
            let bedeckJsonDict = try! JSONSerialization.jsonObject(with: bedeckCardData, options: []) as! [String : Any]
            XCTAssert(bedeckCard.faceConvertedManaCost != nil)
            XCTAssert(bedeckCard.faceConvertedManaCost == bedeckJsonDict["faceConvertedManaCost"] as? Float)
        } else {
            XCTFail("Bedeck.json not found")
        }
    }
    
    func testFlavourTextEncoding() {
        XCTAssert(card.flavorText == nil, "flavorText should be set to nil")
        
        if let flavourTextCardFile = Bundle(for: CardTests.self).path(forResource: "Abbey Gargoyles", ofType: "json") {
            let flavourTextCardFileData = try! Data(contentsOf: URL(fileURLWithPath: flavourTextCardFile))
            let flavourTextCard = try! JSONDecoder().decode(Card.self, from: flavourTextCardFileData)
            let flavourTextJsonDict = try! JSONSerialization.jsonObject(with: flavourTextCardFileData, options: []) as! [String : Any]
            XCTAssert(flavourTextCard.flavorText != nil, "flavorText should not be set to nil")
            XCTAssert(flavourTextCard.flavorText == flavourTextJsonDict["flavorText"] as? String, "flavorText doenst match text from file")
        } else {
            XCTFail("Missing Abbey Gargoyles.json not found")
        }
    }

    static var allTests = [
        ("testArtistEncoding", testArtistEncoding),
        ("testBorderColorEncoding", testBorderColorEncoding),
        ("testColorIdentityEncoding", testColorIdentityEncoding),
        ("testColorIndicatorEncoding", testColorIndicatorEncoding),
        ("testColorsEncoding", testColorsEncoding),
        ("testConvetedManaCostEncoding", testConvetedManaCostEncoding),
        ("testDuelDeckSodeEncoding", testDuelDeckSodeEncoding),
        ("testFaceConvertedManaCostEncoding", testFaceConvertedManaCostEncoding),
        ("testFlavourTextEncoding", testFlavourTextEncoding)
    ]
}
