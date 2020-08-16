//
//  ParseManaResponse.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import Foundation

public struct ParseManaResponse: Decodable {

    public let cost: String

    public let cmc: Double

    public let color: [Color]

    public let colorless: Bool

    public let monocolored: Bool

    public let multicolored: Bool
}
