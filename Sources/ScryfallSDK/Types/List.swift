//
//  List.swift
//  
//
//  Created by Eduardo Arenas on 8/7/20.
//

import Foundation

/// A List object represents a requested sequence of other objects (Cards, Sets, etc).
/// List objects may be paginated, and also include information about issues raised when generating the list.
public struct List<Object: Codable>: Codable {

    /// An array of the requested objects, in a specific order.
    public let data: [Object]

    /// True if this List is paginated and there is a page beyond the current page.
    public let hasMore: Bool

    /// If there is a page beyond the current page, this field will contain a full API URI to that page.
    /// You may submit a HTTP `GET` request to that URI to continue paginating forward on this List.
    public let nextPage: URL?

    /// If this is a list of Card objects, this field will contain the total number of cards found across all pages.
    public let totalCards: Int?

    /// An array of human-readable warnings issued when generating this list, as strings.
    /// Warnings are non-fatal issues that the API discovered with your input.
    /// In general, they indicate that the List will not contain the all of the information you requested.
    /// You should fix the warnings and re-submit your request.
    public let warnings: [String]?
}
