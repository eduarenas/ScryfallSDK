//
//  BulkData.swift
//  
//
//  Created by Eduardo Arenas on 8/8/20.
//

import Foundation

/// Scryfall provides daily exports of our card data in bulk files. Each of these files is represented as a bulk_data object via the API.
/// URLs for files change their timestamp each day, and can be fetched programmatically.
///
/// * Card objects in bulk data include price information, but prices should be considered dangerously stale after 24 hours.
/// Only use bulk price information to track trends or provide a general estimate of card value.
/// Prices are not updated frequently enough to power a storefront or sales system. You consume price information at your own risk.
/// * Updates to gameplay data (such as card names, Oracle text, mana costs, etc) are much less frequent.
/// If you only need gameplay information, downloading card data once per week or right after set releases would most likely be sufficient.
/// * Every card type in every product is included, including planar cards, schemes, Vanguard cards, tokens, emblems, and funny cards.
/// Make sure you’ve reviewed documentation for the Card type.
/// Bulk data is only collected once every 12 hours. You can use the card API methods to retrieve fresh objects instead.
public struct BulkData: Codable {

    /// A unique ID for this bulk item.
    public let id: UUID

    /// The Scryfall API URI for this file.
    public let uri: URL

    /// Kind of bulk item.
    public let type: DataType

    /// A human-readable name for this file.
    public let name: String

    /// A human-readable description for this file.
    public let description: String

    /// The URI that hosts this bulk file for fetching.
    public let downloadUri: URL

    /// The time when this file was last updated.
    public let updatedAt: Date

    /// The size of this file in integer bytes.
    public let compressedSize: Int

    /// The MIME type of this file.
    public let contentType: MIMEType

    /// The Content-Encoding encoding that will be used to transmit this file when you download it.
    public let contentEncoding: ContentEncoding

    /// Possible kinds of bulk items that can be downloaded.
    public enum DataType: String, Codable {

        /// A JSON file containing one Scryfall card object for each Oracle ID on Scryfall.
        /// The chosen sets for the cards are an attempt to return the most up-to-date recognizable version of the card.
        case oracleCards

        /// A JSON file of Scryfall card objects that together contain all unique artworks. The chosen cards promote the best image scans.
        case uniqueArtwork

        /// A JSON file containing every card object on Scryfall in English or the printed language if the card is only available in one language.
        case defaultCards

        /// A JSON file containing every card object on Scryfall in every language.
        case allCards

        /// A JSON file containing all Rulings on Scryfall. Each ruling refers to cards via an `oracle_id`.
        case rulings
    }

    /// Possible bulk data file types.
    public enum MIMEType: String, Codable {

        case json = "application/json"
    }

    /// Possible Content-Encoding used to transfer buld items.
    public enum ContentEncoding: String, Codable {

        case gzip
    }
}
