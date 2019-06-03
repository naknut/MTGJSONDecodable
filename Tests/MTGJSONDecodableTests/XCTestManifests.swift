import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CardTests.allTests),
        testCase(ColorTests.allTests),
        testCase(DuelDeckSideTests.allTests),
        testCase(LanguageTests.allTests),
        testCase(ForeignDataTests.allTests),
        testCase(FrameEffectTests.allTests)
    ]
}
#endif
