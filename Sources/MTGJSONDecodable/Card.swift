/// 🎴 A Magic: The Gathering Card.
public struct Card: Decodable {
    /// The different types of border colors a card can have.
    public enum BorderColor: String, Decodable {
        case black, borderless, gold, silver, white
    }
    
    /// The different kinds of colors used in cards.
    public enum Color: String, Decodable {
        case white = "W", blue = "U", black = "B", red = "R", green = "G"
    }
    
    /// The different sides when a card is in a duel deck.
    public enum DuelDeckSide: String, Decodable {
        case left = "a", right = "b"
    }
    
    /// The different card layouts.
    public enum Layout: String, Decodable {
        case normal, split, flip, transform, meld, leveler, saga, planar, scheme, vanguard, token, doubleFacedToken = "double_faced_token", emblem, augment, aftermath, host
    }
    
    /// Structure defining alternate language properties for a card.
    public struct ForeignData: Decodable {
        /// The different languages the foreign data can be in.
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
        
        /// Flavor text in foreign language.
        public let flavorText: String?
        /// Foreign language of card.
        public let language: Language
        /// Multiverse ID of the card. Is sometimes omited.
        public let multiverseId: Int?
        /// Name of the card in foreign language.
        public let name: String
        /// Rules text of the card in foreign language.
        public let text: String?
    }
    
    /// Special frame effects a card can have.
    public enum FrameEffect: String, Decodable {
        case colorshifted
        case compassLandDoubleFacedCard = "compasslanddfc"
        case devoid
        case draft
        case legendary
        case miracle
        case moonEldrazidDoubleFaceCard
        case nyxtouched
        case originPlaneswalkerDoubleFaceCard = "originpwdfc"
        case sunMoonDoubleFacedCard = "sunmoondfc"
    }
    
    /// The different card frame versions.
    public enum FrameVersion: String, Decodable {
        case nineteenNinetyThree = "1993", nineteenNinetySeven = "1997", twentyOThree = "2003", twentyFifteen = "2015", future
    }
    
    /// Name of the artist that illustrated the card art.
    public let artist: String
    /// Color of the border.
    public let borderColor: BorderColor
    /// List of all colors in card’s mana cost, rules text and any color indicator.
    public let colorIdentity: [Color]
    /// List of all colors in card’s color indicator (a symbol showing the colors of the card). Usually found only on cards without mana costs and other special cards.
    public let colorIndicator: [Color]?
    /// List of all colors in card’s mana cost and any color indicator. Some cards are special (such as Devoid cards or other cards with certain rules text).
    public let colors: [Color]
    /// The converted mana cost of the card.
    public let convertedManaCost: Float
    /// If the card is in a duel deck product. If not in duel deck product, duelDeck is usually nil.
    public let duelDeckSide: DuelDeckSide?
    /// The converted mana cost of the face of either half or part of the card.
    public let faceConvertedManaCost: Float?
    /// Italicized text found below the rules text that has no game function.
    public let flavorText: String?
    /// Foreign version of the card
    public let foreignData: [ForeignData]
    /// The frame effect of the card. Is nil if the card doesn't have any special frame effect.
    public let frameEffect: FrameEffect?
    /// Version of the card frame style.
    let frameVersion: FrameVersion
    
    public enum CodingKeys: String, CodingKey {
        case artist, borderColor, colorIdentity, colorIndicator, colors, convertedManaCost, faceConvertedManaCost, flavorText, foreignData, frameEffect, frameVersion
        case duelDeckSide = "duelDeck"
    }
}
