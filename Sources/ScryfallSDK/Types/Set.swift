//
//  Set.swift
//  
//
//  Created by Eduardo Arenas on 8/7/20.
//

import Foundation

/// A Set object represents a group of related Magic cards. All Card objects on Scryfall belong to exactly one set.
///
/// Due to Magic’s long and complicated history, Scryfall includes many un-official sets as a way to group promotional or outlier cards together.
/// Such sets will likely have a `code` that begins with `p` or `t`, such as `pcel` or `tori`.
///
/// Official sets always have a three-letter set code, such as zen.
public struct Set: Codable {

    /// A unique ID for this set on Scryfall that will not change.
    public let id: UUID

    /// The unique three to five-letter code for this set.
    public let code: String

    /// The unique code for this set on MTGO, which may differ from the regular code.
    public let mtgoCode: String?

    /// This set’s ID on [TCGplayer’s API](https://docs.tcgplayer.com/docs), also known as the groupId.
    public let tcgplayerId: Int?

    /// The English name of the set.
    public let name: String

    /// Set classification
    public let setType: SetType

    /// The date the set was released or the first card was printed in the set (in GMT-8 Pacific time).
    public let releasedAt: Date?

    /// The block code for this set, if any.
    public let blockCode: String?

    /// The block or group name code for this set, if any.
    public let block: String?

    /// The set code for the parent set, if any. promo and token sets often have a parent set.
    public let parentSetCode: String?

    /// The number of cards in this set.
    public let cardCount: Int

    /// The denominator for the set’s printed collector numbers.
    public let printedSize: Int?

    /// True if this set was only released in a video game.
    public let digital: Bool

    /// True if this set contains only foil cards.
    public let foilOnly: Bool

    /// True if this set contains only nonfoil cards.
    public let nonfoilOnly: Bool

    /// A link to this set’s permapage on Scryfall’s website.
    public let scryfallUrl: URL

    /// A link to this set object on Scryfall’s API.
    public let uri: URL

    /// A URI to an SVG file for this set’s icon on Scryfall’s CDN. Hotlinking this image isn’t recommended, because it may change slightly over time.
    /// You should download it and use it locally for your particular user interface needs.
    public let iconSvgUri: URL

    /// A Scryfall API URI that you can request to begin paginating over the cards in this set.
    public let searchUri: URL
}
