import XCTest
@testable import MTGJSONDecodable

class LanguageTests: XCTestCase {
    
    func testInitEnglish() {
        XCTAssert(Card.ForeignData.Language(rawValue: "English") == .english)
    }
    
    func testInitSpanish() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Spanish") == .spanish)
    }
    
    func testInitFrench() {
        XCTAssert(Card.ForeignData.Language(rawValue: "French") == .french)
    }
    
    func testInitGerman() {
        XCTAssert(Card.ForeignData.Language(rawValue: "German") == .german)
    }
    
    func testInitPortugueseBrazil() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Portuguese (Brazil)") == .portuguese_brazil)
    }
    
    func testInitKorean() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Korean") == .korean)
    }
    
    func testInitRussian() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Russian") == .russian)
    }
    
    func testInitSimplifiedChinese() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Chinese Simplified") == .simplifiedChinese)
    }
    
    func testInitTraditionalChinese() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Chinese Traditional") == .traditionalChinese)
    }
    
    func testInitHebrew() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Hebrew") == .hebrew)
    }
    
    func testInitLatin() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Latin") == .latin)
    }
    
    func testInitAncientGreek() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Ancient Greek") == .ancientGreek)
    }
    
    func testInitArabic() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Arabic") == .arabic)
    }
    
    func testInitSanskrit() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Sanskrit") == .sanskrit)
    }
    
    func testInitPhyrexian() {
        XCTAssert(Card.ForeignData.Language(rawValue: "Phyrexian") == .phyrexian)
    }
    
    static var allTests = [
        ("testInitEnglish", testInitEnglish),
        ("testInitSpanish", testInitSpanish),
        ("testInitFrench", testInitFrench),
        ("testInitGerman", testInitGerman),
        ("testInitPortugueseBrazil", testInitPortugueseBrazil),
        ("testInitKorean", testInitKorean),
        ("testInitRussian", testInitRussian),
        ("testInitSimplifiedChinese", testInitSimplifiedChinese),
        ("testInitTraditionalChinese", testInitTraditionalChinese),
        ("testInitHebrew", testInitHebrew),
        ("testInitLatin", testInitLatin),
        ("testInitAncientGreek", testInitAncientGreek),
        ("testInitArabic", testInitArabic),
        ("testInitSanskrit", testInitSanskrit),
        ("testInitPhyrexian", testInitPhyrexian)
    ]
}
