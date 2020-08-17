//
//  Search.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Foundation

public enum Search {

    /// The unique mode declares how duplicate results in a query are to be handled.
    public enum UniqueMode: String, Encodable {

        /// Removes duplicate gameplay objects (cards that share a name and have the same functionality).
        ///
        /// For example, if your search matches more than one print of Pacifism, only one copy of Pacifism will be returned.
        /// Default.
        case cards

        /// Returns only one copy of each unique artwork for matching cards.
        ///
        /// For example, if your search matches more than one print of Pacifism, one card with each different illustration
        /// for Pacifism will be returned, but any cards that duplicate artwork already in the results will be omitted.
        case art

        /// Returns all prints for all cards matched (disables rollup).
        ///
        /// For example, if your search matches more than one print of Pacifism, all matching prints will be returned.
        case prints
    }

    /// The order parameter determines how Scryfall should sort the returned cards.
    public enum Order: String, Encodable {

        /// Sort cards by name, A → Z.
        case name

        /// Sort cards by their set and collector number: AAA/#1 → ZZZ/#999.
        case set

        /// Sort cards by their release date: Newest → Oldest.
        case released

        /// Sort cards by their rarity: Common → Mythic.
        case rarity

        /// Sort cards by their color and color identity: WUBRG → multicolor → colorless.
        case color

        /// Sort cards by their lowest known U.S. Dollar price: 0.01 → highest, `nil` last.
        case usd

        /// Sort cards by their lowest known TIX price: 0.01 → highest, `nil` last.
        case tix

        /// Sort cards by their lowest known Euro price: 0.01 → highest, `nil` last.
        case eur

        /// Sort cards by their converted mana cost: 0 → highest.
        case cmc

        /// Sort cards by their power: `nil` → highest.
        case power

        /// Sort cards by their toughness: `nil` → highest.
        case toughness

        /// Sort cards by their EDHREC ranking: lowest → highest.
        case edhrec

        /// Sort cards by their front-side artist name: A → Z.
        case artist
    }

    /// The direction specifies which direction the sorting should occur.
    public enum Direction: String, Encodable {

        /// Scryfall will automatically choose the most inuitive direction to sort.
        case auto

        /// Sort ascending (the direction of the arrows in the `Order` documentation).
        case asc

        /// Sort descending (flip the direction of the arrows in the `Order` documentation).
        case desc
    }
}
