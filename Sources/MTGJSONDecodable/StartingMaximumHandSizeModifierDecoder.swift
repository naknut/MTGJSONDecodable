class StartingMaximumHandSizeModifierDecoder {
    enum DecodeStartingMaximumHandSizeModifierError: Error {
        case invalidSign, invalidValue
    }
    
    static func decode(_ startingMaximumHandSizeModifier: String) throws -> Int {
        let signSubstring = startingMaximumHandSizeModifier.first
        guard signSubstring == "+" || signSubstring == "-" else { throw DecodeStartingMaximumHandSizeModifierError.invalidSign }
        guard let value = Int(String(startingMaximumHandSizeModifier.suffix(1))) else { throw DecodeStartingMaximumHandSizeModifierError.invalidValue }
        return signSubstring == "+" ? value : -value
    }
}
