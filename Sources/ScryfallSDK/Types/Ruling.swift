//
//  Ruling.swift
//  
//
//  Created by Eduardo Arenas on 8/8/20.
//

import Foundation

/// Rulings represent Oracle rulings, Wizards of the Coast set release notes, or Scryfall notes for a particular card.
///
/// If two cards have the same name, they will have the same set of rulings objects. If a card has rulings, it usually has more than one.
///
/// Rulings with a scryfall source have been added by the Scryfall team, either to provide additional context for the card,
/// or explain how the card works in an unofficial format (such as Duel Commander).
public struct Ruling: Decodable {

    /// Which company produced this ruling, either wotc or scryfall.
    public let source: Source

    /// The date when the ruling or note was published.
    public let publishedAt: Date

    /// The text of the ruling.
    public let comment: String

    /// Possible sources of rulings for a card.
    public enum Source: String, Decodable {

        /// Wizards of the Coast
        case wotc

        /// Scryfall
        case scryfall
    }
}
