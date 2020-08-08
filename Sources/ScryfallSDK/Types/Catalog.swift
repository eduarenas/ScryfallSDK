//
//  Catalog.swift
//  
//
//  Created by Eduardo Arenas on 8/8/20.
//

import Foundation

/// A Catalog object contains an array of Magic datapoints (words, card values, etc).
///
/// Catalog objects are provided by the API as aids for building other Magic software and understanding possible values for a field on Card objects.
public struct Catalog: Codable {

    /// A link to the current catalog on Scryfall’s API.
    public let uri: URL

    /// The number of items in the `data` array.
    public let totalValues: Int

    /// An array of datapoints.
    public let data: [String]
}
