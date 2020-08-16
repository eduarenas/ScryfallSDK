//
//  Search.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Foundation

public struct Search {

    public enum UniqueMode: String, Encodable {
        case cards
        case art
        case prints
    }

    public enum Order: String, Encodable {
        case name
        case set
        case released
        case rarity
        case color
        case usd
        case tix
        case eur
        case cmc
        case power
        case toughness
        case edhrec
        case artist
    }

    public enum Direction: String, Encodable {
        case auto
        case asc
        case desc
    }
}
