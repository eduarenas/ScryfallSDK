//
//  Card.swift
//  
//
//  Created by Eduardo Arenas on 8/7/20.
//

import Foundation

/// Card objects represent individual Magic: The Gathering cards that players could obtain and add to their collection (with a few minor exceptions).
public struct Card: Codable {

    // MARK: Core Card Fields

    /// This card’s Arena ID, if any. A large percentage of cards are not available on Arena and do not have this ID.
    public let arenaId: Int?

    /// A unique ID for this card in Scryfall’s database.
    public let id: UUID

    /// A language code for this printing.
    public let lang: Language

    /// This card’s Magic Online ID (also known as the Catalog ID), if any.
    /// A large percentage of cards are not available on Magic Online and do not have this ID.
    public let mtgoId: Int?

    /// This card’s foil Magic Online ID (also known as the Catalog ID), if any.
    /// A large percentage of cards are not available on Magic Online and do not have this ID.
    public let mtgoFoilId: Int?

    /// This card’s multiverse IDs on Gatherer, if any, as an array of integers. Note that Scryfall includes many
    /// promo cards, tokens, and other esoteric objects that do not have these identifiers.
    public let multiverseIds: [Int]?

    /// This card’s ID on [TCGplayer’s API](https://docs.tcgplayer.com/docs), also known as the productId.
    public let tcgplayerId: Int?

    /// A unique ID for this card’s oracle identity. This value is consistent across reprinted card editions,
    /// and unique among different cards with the same name (tokens, Unstable variants, etc).
    public let oracleId: UUID

    /// A link to where you can begin paginating all re/prints for this card on Scryfall’s API.
    public let printsSearchUri: URL

    /// A link to this card’s rulings list on Scryfall’s API.
    public let rulingsUri: URL

    /// A link to this card’s permapage on Scryfall’s website.
    public let scryfallUri: URL

    /// A link to this card object on Scryfall’s API.
    public let uri: URL


    // MARK: Gameplay Fields

    /// If this card is closely related to other cards, this property will be an array with `RelatedCard` objects.
    public let allParts: [RelatedCard]?

    /// An array of `CardFace` objects, if this card is multifaced.
    public let cardFaces: [Face]?

    /// The card’s converted mana cost. Note that some funny cards have fractional mana costs.
    public let cmc: Double

    /// This card’s color identity.
    public let colorIdentity: [Color]

    /// The colors in this card’s color indicator, if any. A `nil` value for this field indicates the card does not have one.
    public let colorIndicator: [Color]?

    /// This card’s colors, if the overall card has colors defined by the rules. Otherwise the colors will be on the `cardFaces` objects.
    public let colors: [Color]?

    /// This card’s overall rank/popularity on EDHREC. Not all cards are ranked.
    public let edhrecRank: Int?

    /// True if this printing exists in a foil version.
    public let foil: Bool

    /// This card’s hand modifier, if it is Vanguard card. This value will contain a delta, such as -1.
    public let handModifier: String?

    /// An array of keywords that this card uses, such as `'Flying'` and `'Cumulative upkeep'`.
    public let keywords: [String]

    /// Card layout
    public let layout: Layout

    /// Dictionary describing the legality of this card across play formats. Each key is a format name and the corresponding
    /// value is the `Legality` for that format.
    public let legalities: [String: Legality]

    /// This card’s life modifier, if it is Vanguard card. This value will contain a delta, such as `+2`.
    public let lifeModifier: String?

    /// This loyalty if any. Note that some cards have loyalties that are not numeric, such as `X`.
    public let loyalty: String?

    /// The mana cost for this card. This value will be any empty string "" if the cost is absent.
    ///
    /// Remember that per the game rules, a missing mana cost and a mana cost of {0} are different values.
    /// Multi-faced cards will report this value in card faces.
    public let manaCost: String?

    /// The name of this card.
    ///
    /// If this card has multiple faces, this field will contain both names separated by `␣//␣`.
    public let name: String

    /// True if this printing exists in a nonfoil version.
    public let nonfoil: Bool

    /// The Oracle text for this card, if any.
    public let oracleText: String?

    /// True if this card is oversized.
    public let oversized: Bool

    /// This card’s power, if any.
    ///
    /// Note that some cards have powers that are not numeric, such as `*`.
    public let power: String?

    /// Colors of mana that this card could produce.
    public let producedMana: [Color]?

    /// True if this card is on the Reserved List.
    public let reserved: Bool

    /// This card’s toughness, if any.
    ///
    /// Note that some cards have toughnesses that are not numeric, such as `*`.
    public let toughness: String?

    /// The type line of this card.
    public let typeLine: String


    // MARK: Print Fields

    /// The name of the illustrator of this card.
    ///
    /// Newly spoiled cards may not have this field yet.
    public let artist: String?

    /// Whether this card is found in boosters.
    public let booster: Bool

    /// This card’s border color.
    public let borderColor: BorderColor

    /// The Scryfall ID for the card back design present on this card.
    public let cardBackId: UUID

    /// This card’s collector number.
    ///
    /// Note that collector numbers can contain non-numeric characters, such as letters or `★`.
    public let collectorNumber: String

    /// True if you should consider [avoiding use of this print](https://scryfall.com/blog/220) downstream.
    public let contentWarning: Bool?

    /// True if this card was only released in a video game.
    public let digital: Bool

    /// The just-for-fun name printed on the card (such as for Godzilla series cards).
    public let flavorName: String?

    /// The flavor text, if any.
    public let flavorText: String?

    /// This card’s frame effects, if any.
    public let frameEffects: [String]?

    /// This card’s frame layout.
    public let frame: Frame

    /// True if this card’s artwork is larger than normal.
    public let fullArt: Bool

    /// A list of `Game`s that this card print is available in
    public let games: [Game]

    /// True if this card’s imagery is high resolution.
    public let highresImage: Bool

    /// A unique identifier for the card artwork that remains consistent across reprints.
    ///
    /// Newly spoiled cards may not have this field yet.
    public let illustrationId: UUID?

    /// A dictionary listing available imagery for this card.
    // TODO: Fix
     public let imageUris: [String: URL]?

    /// An object containing daily price information for this card, including usd, usd_foil, eur, and tix prices, as strings.
    // TODO: Fix
     public let prices: [String: String?]

    /// The localized name printed on this card, if any.
    public let printedName: String?

    /// The localized text printed on this card, if any.
    public let printedText: String?

    /// The localized type line printed on this card, if any.
    public let printedTypeLine: String?

    /// True if this card is a promotional print.
    public let promo: Bool

    /// An array of strings describing what categories of promo cards this card falls into.
    public let promoTypes: [String]?

    /// An object providing URIs to this card’s listing on major marketplaces.
    // TODO: Should this really be optional?
    public let purchaseUris: [String: URL]?

    /// This card’s `Rarity`.
    public let rarity: Rarity

    /// An object providing URIs to this card’s listing on other Magic: The Gathering online resources.
    public let relatedUris: [String: URL]

    /// The date this card was first released.
    public let releasedAt: Date

    /// True if this card is a reprint.
    public let reprint: Bool

    /// A link to this card’s set on Scryfall’s website.
    public let scryfallSetUri: URL

    /// This card’s full set name.
    public let setName: String

    /// A link to where you can begin paginating this card’s set on the Scryfall API.
    public let setSearchUri: URL

    /// The type of set this printing is in.
    public let setType: SetType

    /// A link to this card’s set object on Scryfall’s API.
    public let setUri: URL

    /// This card’s set code.
    public let set: String

    /// True if this card is a Story Spotlight.
    public let storySpotlight: Bool

    /// True if the card is printed without text.
    public let textless: Bool

    /// Whether this card is a variation of another printing.
    public let variation: Bool

    /// The printing ID of the printing this card is a variation of.
    public let variationOf: UUID?

    /// This card’s watermark, if any.
    public let watermark: String?


    /// Multiface cards have a `cardFaces` property containing at least two `CardFace` objects.
    public struct Face: Codable {

        /// The name of the illustrator of this card face. Newly spoiled cards may not have this field yet.
        public let artist: String?

        /// The colors in this face’s color indicator, if any.
        public let colorIndicator: [Color]?

        /// This face’s colors, if the game defines colors for the individual face of this card.
        public let colors: [Color]?

        /// The flavor text printed on this face, if any.
        public let flavorText: String?

        /// A unique identifier for the card face artwork that remains consistent across reprints.
        /// Newly spoiled cards may not have this field yet.
        public let illustrationId: UUID?

        /// A dictionary  providing URIs to imagery for this face, if this is a double-sided card.
        /// If this card is not double-sided, then the image_uris property will be part of the parent object instead.
        // TODO: Fix this
         public let imageUris: [String: URL]?

        /// This face’s loyalty, if any.
        public let loyalty: String?

        /// The mana cost for this face. This value will be any empty string "" if the cost is absent.
        /// Remember that per the game rules, a missing mana cost and a mana cost of {0} are different values.
        public let manaCost: String

        /// The name of this particular face.
        public let name: String

        /// The Oracle text for this face, if any.
        public let oracleText: String?

        /// This face’s power, if any. Note that some cards have powers that are not numeric, such as `*`.
        public let power: String?

        /// The localized name printed on this face, if any.
        public let printedName: String?

        /// The localized text printed on this face, if any.
        public let printedText: String?

        /// The localized type line printed on this face, if any.
        public let printedTypeLine: String?

        /// This face’s toughness, if any.
        public let toughness: String?

        /// The type line of this particular face.
        public let typeLine: String

        /// The watermark on this particulary card face, if any.
        public let watermark: String?
    }

    /// `Layout` categorizes the arrangement of card parts, faces, and other bounded regions on cards.
    /// The layout can be used to programmatically determine which other properties on a card you can expect.
    public enum Layout: String, Codable {

        /// A standard Magic card with one face
        case normal

        /// A split-faced card
        case split

        /// Cards that invert vertically with the flip keyword
        case flip

        /// Double-sided cards that transform
        case transform

        /// Cards with meld parts printed on the back
        case meld

        /// Cards with Level Up
        case leveler

        /// Saga-type cards
        case saga

        /// Cards with an Adventure spell part
        case adventure

        /// Plane and Phenomenon-type cards
        case planar

        /// Scheme-type cards
        case scheme

        /// Vanguard-type cards
        case vanguard

        /// Token cards
        case token

        /// Tokens with another token printed on the back
        case doubleFacedToken = "double_faced_token" // TODO: Do I need this?

        /// Emblem cards
        case emblem

        /// Cards with Augment
        case augment

        /// Host-type cards
        case host

        /// Art Series collectable double-faced cards
        case artSeries = "art_series" // TODO: Do I need this?

        /// A Magic card with two sides that are unrelated
        case doubleSided = "double_sided"  // TODO: Do I need this?
    }

    /// Formats of play.
    public enum Format: String, Codable {
        case standard
        case future
        case historic
        case pioneer
        case modern
        case legacy
        case pauper
        case vintage
        case penny
        case commander
        case brawl
        case duel
        case oldschool
    }

    /// Legality of the card in a given format.
    public enum Legality: String, Codable {

        /// Card can be played in the given format.
        case legal

        /// Card is not part of the given format and can't be played.
        case notLegal = "not_legal" // TODO: Why is this needed with the `.convertFromSnakeCase` decoding strategy?

        /// If you wish to use a card that’s on the restricted list for your chosen format, you may include only a single copy of that card,
        /// counting both your main deck and your sideboard. Currently, only the Vintage format uses a restricted list.
        case restricted

        /// If a card appears on the banned list for your chosen format, then you may not include that card in your deck or sideboard.
        /// Doing so makes your deck illegal to play in any sanctioned tournaments for that format.
        case banned
    }

    /// Possible card border colors
    public enum BorderColor: String, Codable {
        case black
        case borderless
        case gold
        case silver
        case white
    }

    public enum Frame: String, Codable {

        /// The original Magic card frame, starting from Limited Edition Alpha.
        case y1993 = "1993"

        /// The updated classic frame starting from Mirage block
        case y1997 = "1997"

        /// The “modern” Magic card frame, introduced in Eighth Edition and Mirrodin block.
        case y2003 = "2003"

        /// The holofoil-stamp Magic card frame, introduced in Magic 2015.
        case y2015 = "2015"

        /// The frame used on cards [from the future](http://mtgsalvation.gamepedia.com/Timeshifted#Timeshifted_in_Future_Sight)
        case future
    }

    /// `FrameEffect` tracks additional frame artwork applied over a particular frame. For example, there are both 2003 and 2015-frame cards with the Nyx-touched effect.
    public enum FrameEffect: String, Codable {

        /// The cards have a legendary crown
        case legendary

        /// The miracle frame effect
        case miracle

        /// The Nyx-touched frame effect
        case nyxtouched

        /// The draft-matters frame effect
        case draft

        /// The Devoid frame effect
        case devoid

        /// The Odyssey tombstone mark
        case tombstone

        /// A colorshifted frame
        case colorshifted

        /// The FNM-style inverted frame
        case inverted

        /// The sun and moon transform marks
        case sunmoondfc

        /// The compass and land transform marks
        case compasslanddfc

        /// The Origins and planeswalker transform marks
        case originpwdfc

        /// The moon and Eldrazi transform marks
        case mooneldrazidfc

        /// The waxing and waning crescent moon transform marks
        case moonreversemoondfc

        /// A custom Showcase frame
        case showcase

        /// An extended art frame
        case extendedart

        /// The cards have a companion frame
        case companion
    }

    /// Rarity indicates the availability of a card.
    public enum Rarity: String, Codable {

        /// Most abundant cards in the game.
        case common

        /// Slightly more rare than commong cards.
        case uncommon

        /// There is  at least one in every pack, except where it's replaced by a Mythic Rare.
        case rare

        /// Rarer than `.rare` cards
        case mythic
    }

    public struct PriceCategory: Hashable, Codable {

        /// Price in USD
        static let usd = PriceCategory(value: "usd")

        /// Price in USD for foil version
        static let usdFoil = PriceCategory(value: "usd_foil")

        /// Price in Euros
        static let eur = PriceCategory(value: "eur")

        /// Price in TIX. MGTO currency.
        static let tix = PriceCategory(value: "tix")

        let value: String
    }
}

/// Cards that are closely related to other cards (because they call them by name, or generate a token, or meld, etc)
/// have a `allParts` property that contains `RelatedCard` objects.
public struct RelatedCard: Codable {

    /// An unique ID for this card in Scryfall’s database.
    public let id: UUID

    /// A field explaining what role this card plays in this relationship
    public let component: Component

    /// The name of this particular related card.
    public let name: String

    /// The type line of this card.
    public let typeLine: String

    /// A URI where you can retrieve a full object describing this card on Scryfall’s API.
    public let uri: URL

    /// Possible relationship role  values.
    public enum Component: String, Codable {

        /// A marker used to represent any permanent that isn’t represented by a card.
        case token

        /// One part of a meld pair that can combine with another part to form an oversized card face.
        case meldPart = "meld_part" // TODO: Do I need this?

        /// Oversized card face; the result of combining two med parts.
        case meldResult = "meld_result" // TODO: Do I need this?

        /// Other cards that can be used for combos.
        case comboPiece = "combo_piece" // TODO: Do I need this?
    }
}

/// Versions of the game Magic: The Gathering.
public enum Game: String, Codable {

    /// Tabletop version of Magic: The Gathering
    case paper

    /// Magic: The Gathering Arenas
    case arena

    /// Magic: The Gathering Online
    case mtgo

    /// Magic: The Gathering for Sega Dreamcast
    case sega

    /// Magic: The Gathering computer game written by MicroProse
    case astral
}

public enum ImageType: String, Codable {

    /// A transparent, rounded full card PNG. This is the best image to use for videos or other high-quality content. (745 x 1040 - PNG).
    case png

    /// A full card image with the rounded corners and the majority of the border cropped off.
    /// Designed for dated contexts where rounded images can’t be used  (480 x 680 - JPG).
    case borderCrop

    /// A rectangular crop of the card’s art only.
    /// Not guaranteed to be perfect for cards with outlier designs or strange frame arrangements (JPG)
    case artCrop

    /// A large full card image (672 x 936 - JPG).
    case large

    /// A medium-sized full card image (488 x 680 - JPG).
    case normal

    /// A small full card image. Designed for use as thumbnail or list icon (146 x 204 - JPG).
    case small
}

public enum CardId {
    case id(UUID)
    case mtgoId(Int)
    case multiverseId(Int)
    case oracleId(UUID)
    case illustrationId(UUID)
    case name(String)
    case nameAndSet(name: String, set: String)
    case collectorNumberAndSet(collectorNumber: String, set: String)
}

extension CardId: Encodable {

    enum CodingKeys: CodingKey {
        case id
        case mtgoId
        case multiverseId
        case oracleId
        case illustrationId
        case name
        case set
        case collectorNumber
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .id(let id):
            try container.encode(id, forKey: .id)
        case .mtgoId(let mtgoId):
            try container.encode(mtgoId, forKey: .mtgoId)
        case .multiverseId(let multiverseId):
            try container.encode(multiverseId, forKey: .multiverseId)
        case .oracleId(let oracleId):
            try container.encode(oracleId, forKey: .oracleId)
        case .illustrationId(let illustrationId):
            try container.encode(illustrationId, forKey: .illustrationId)
        case .name(let name):
            try container.encode(name, forKey: .name)
        case .nameAndSet(let name, let set):
            try container.encode(name, forKey: .name)
            try container.encode(set, forKey: .set)
        case .collectorNumberAndSet(let collectorNumber, let set):
            try container.encode(collectorNumber, forKey: .collectorNumber)
            try container.encode(set, forKey: .set)
        }
    }
}
