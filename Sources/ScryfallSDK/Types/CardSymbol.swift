//
//  CardSymbol.swift
//  
//
//  Created by Eduardo Arenas on 8/8/20.
//

import Foundation

public struct CardSymbol: Decodable {

    /// The plaintext symbol. Often surrounded with curly braces `{}`.
    /// 
    /// Note that not all symbols are ASCII text (for example, `{∞}`).
    public let symbol: String

    /// An alternate version of this symbol, if it is possible to write it without curly braces.
    public let looseVariant: String?

    /// An English snippet that describes this symbol.
    ///
    /// Appropriate for use in `alt` text or other accessible communication formats.
    public let english: String

    /// True if it is possible to write this symbol “backwards”.
    ///
    /// For example, the official symbol {U/P} is sometimes written as {P/U} or {P\U} in informal settings.
    /// Note that the Scryfall API never writes symbols backwards in other responses.
    /// This field is provided for informational purposes.
    public let transposable: Bool

    /// True if this is a mana symbol.
    public let representsMana: Bool

    /// A decimal number representing this symbol’s converted mana cost.
    ///
    /// Note that mana symbols from funny sets can have fractional converted mana costs.
    public let cmc: Double?

    /// True if this symbol appears in a mana cost on any Magic card. For example `{20}` has this field set to `false`
    /// because `{20}` only appears in Oracle text, not mana costs.
    public let appearsInManaCosts: Bool

    /// True if this symbol is only used on funny cards or Un-cards.
    public let funny: Bool

    /// An array of colors that this symbol represents.
    public let colors: [Color]

    /// An array of plaintext versions of this symbol that Gatherer uses on old cards to describe original printed text.
    ///
    /// For example: `{W} `has `["oW", "ooW"]` as alternates
    public let gathererAlternates: [String]?
}
