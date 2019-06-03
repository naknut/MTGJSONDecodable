public struct Card: Decodable {
    public enum BorderColor: String, Decodable {
        case black, borderless, gold, silver, white
    }
    
    public enum Color: String, Decodable {
        case white = "W", blue = "U", black = "B", red = "R", green = "G"
    }
    
    public enum DuelDeckSide: String, Decodable {
        case left = "a", right = "b"
    }
    
    public enum Layout: String, Decodable {
        case normal, split, flip, transform, meld, leveler, saga, planar, scheme, vanguard, token, doubleFacedToken = "double_faced_token", emblem, augment, aftermath, host
    }
    
    public struct ForeignData: Decodable {
        public enum Language: String, Decodable {
            case english = "English"
            case spanish = "Spanish"
            case french = "French"
            case german = "German"
            case italian = "Italian"
            case portuguese_brazil = "Portuguese (Brazil)"
            case japanese = "Japanese"
            case korean = "Korean"
            case russian = "Russian"
            case simplifiedChinese = "Chinese Simplified"
            case traditionalChinese = "Chinese Traditional"
            case hebrew = "Hebrew"
            case latin = "Latin"
            case ancientGreek = "Ancient Greek"
            case arabic = "Arabic"
            case sanskrit = "Sanskrit"
            case phyrexian = "Phyrexian"
        }
        
        public let flavorText: String?
        public let language: Language
        public let multiverseId: Int?
        public let name: String
        public let text: String?
    }
    
    public let artist: String
    public let borderColor: BorderColor
    public let colorIdentity: [Color]
    public let colorIndicator: [Color]?
    public let colors: [Color]
    public let convertedManaCost: Float
    public let duelDeckSide: DuelDeckSide?
    public let faceConvertedManaCost: Float?
    public let flavorText: String?
    public let foreignData: [ForeignData]
    
    public enum CodingKeys: String, CodingKey {
        case artist, borderColor, colorIdentity, colorIndicator, colors, convertedManaCost, faceConvertedManaCost, flavorText, foreignData
        case duelDeckSide = "duelDeck"
    }
}
