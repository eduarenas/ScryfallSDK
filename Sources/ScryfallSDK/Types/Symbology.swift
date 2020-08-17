//
//  ParseManaResponse.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import Foundation

public enum Symbology {

    public struct ParsedMana: Decodable {

        /// The normalized cost, with correctly-ordered and wrapped mana symbols.
        public let cost: String

        /// The converted mana cost. If you submit Un-set mana symbols, this decimal could include fractional parts.
        public let cmc: Double

        /// The colors of the given cost.
        public let color: [Color]

        /// True if the cost is colorless.
        public let colorless: Bool

        /// True if the cost is monocolored.
        public let monocolored: Bool

        /// True if the cost is multicolored.
        public let multicolored: Bool
    }
}
