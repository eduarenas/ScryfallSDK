//
//  SetType.swift
//  
//
//  Created by Eduardo Arenas on 8/7/20.
//

import Foundation

/// Scryfall provides an overall categorization for each Set in the `set_type` property. An exhaustive list of `set_types` is listed below:
public enum SetType: String, Codable {

    /// A yearly Magic core set (Tenth Edition, etc)
    case core

    /// A rotational expansion set in a block (Zendikar, etc)
    case expansion

    /// A reprint set that contains no new cards (Modern Masters, etc)
    case masters

    /// Masterpiece Series premium foil cards
    case masterpiece

    /// From the Vault gift sets
    case fromTheVault

    /// Spellbook series gift sets
    case spellbook

    /// Premium Deck Series decks
    case premiumDeck

    /// Duel Decks
    case duelDeck

    /// Special draft sets, like Conspiracy and Battlebond
    case draftInnovation

    /// Magic Online treasure chest prize sets
    case treasureChest

    /// Commander preconstructed decks
    case commander

    /// Planechase sets
    case planechase

    /// Archenemy sets
    case archenemy

    /// Vanguard card sets
    case vanguard

    /// A funny un-set or set with funny promos (Unglued, Happy Holidays, etc)
    case funny

    /// A starter/introductory set (Portal, etc)
    case starter

    /// A gift box set
    case box

    /// A set that contains purely promotional cards
    case promo

    /// A set made up of tokens and emblems.
    case token

    /// A set made up of gold-bordered, oversize, or trophy cards that are not legal
    case memorabilia
}
