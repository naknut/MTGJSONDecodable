import XCTest
@testable import MTGJSONDecodable

class ForeignDataTests: XCTestCase {
    
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
    
    func testInitFlavorText() {
        XCTAssert(card.foreignData.first!.flavorText == nil)
        
        if let foreignFlavorTextFile = Bundle(for: CardTests.self).path(forResource: "Foundry of the Consuls", ofType: "json") {
            let foreignFlavorTextData = try! Data(contentsOf: URL(fileURLWithPath: foreignFlavorTextFile))
            let foregnFlavorTextJsonDict = try! JSONSerialization.jsonObject(with: foreignFlavorTextData, options: []) as! [String : Any]
            let foregnFlavorTextCard = try! JSONDecoder().decode(Card.self, from: foreignFlavorTextData)
            XCTAssert(foregnFlavorTextCard.foreignData.first?.flavorText != nil)
            XCTAssert(foregnFlavorTextCard.foreignData.first!.flavorText == (((foregnFlavorTextJsonDict["foreignData"] as! Array<Any>).first as! [String : Any])["flavorText"] as! String))
        } else {
            XCTFail("Foundry of the Consuls.json not found")
        }
    }
    
    func testInitMultiverseId() {
        XCTAssert(card.foreignData.first!.multiverseId != nil)
        XCTAssert(card.foreignData.first!.multiverseId == (((jsonDict["foreignData"] as! Array<Any>).first as! [String : Any])["multiverseId"] as! Int))
        
        if let noMultiverseIdCardFile = Bundle(for: CardTests.self).path(forResource: "Abduction", ofType: "json") {
            let noMultiverseIdCard = try! JSONDecoder().decode(Card.self, from: try! Data(contentsOf: URL(fileURLWithPath: noMultiverseIdCardFile)))
            XCTAssert(noMultiverseIdCard.foreignData.first!.multiverseId == nil)
        } else {
            XCTFail("Missing Abbey Gargoyles.json not found")
        }
    }
    
    func testInitText() {
        XCTAssert(card.foreignData.first!.text != nil)
        XCTAssert(card.foreignData.first!.text == (((jsonDict["foreignData"] as! Array<Any>).first as! [String : Any])["text"] as! String))
    }
    
    static var allTests = [
        ("testInitFlavorText", testInitFlavorText),
        ("testInitMultiverseId", testInitMultiverseId),
        ("testInitText", testInitText)
    ]
}
