//
//  Languge.swift
//  
//
//  Created by Eduardo Arenas on 8/7/20.
//

import Foundation

/// Scryfall archives Magic cards in 17 languages (including some unofficial languages).
///
/// Each Card object indicates its language in the lang property using an ISO-like code.
/// When available, cards may also include their printed text in printed_name, printed_type_line, and printed_text fields.
///
/// Please note that Oracle text is always English, per game rules.
/// Cards printed in non-English languages are a translation of the Oracle text at the time the card was printed,
/// but these texts do not receive errata.
public enum Language: String, Decodable {

    /// English
    case en

    /// Spanish
    case es

    /// French
    case fr

    /// German
    case de

    /// Italian
    case it

    /// Portuguese
    case pt

    /// Japanese
    case ja

    /// Korean
    case ko

    /// Russian
    case ru

    /// Simplified Chinese
    case zhs

    /// Traditional Chinese
    case zht

    /// Hebrew
    case he

    /// Latin
    case la

    /// Ancient Greek
    case grc

    /// Arabic
    case ar

    /// Sanskrit
    case sa

    /// Phyrexian
    case ph
}
