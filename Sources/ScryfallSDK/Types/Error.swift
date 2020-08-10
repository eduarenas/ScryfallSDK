//
//  Error.swift
//  
//
//  Created by Eduardo Arenas on 8/7/20.
//

import Foundation

/// An Error object represents a failure to find information or understand the input you provided to the API.
/// Error objects are always transmitted with the appropriate `4XX` or `5XX` HTTP status code.
public struct Error: Codable, Swift.Error {

    /// An integer HTTP status code for this error.
    public let status: Int

    /// A computer-friendly string representing the appropriate HTTP status code.
    public let code: String

    /// A human-readable string explaining the error.
    public let details: String

    /// A computer-friendly string that provides additional context for the main error.
    /// For example, an endpoint many generate `HTTP 404` errors for different kinds of input.
    /// This field will provide a label for the specific kind of 404 failure, such as ambiguous.
    public let type: String?

    /// If your input also generated non-failure warnings, they will be provided as human-readable strings in this array.
    public let warnings: [String]?
}

/// If `URLSession` return no error and one can't be parsed from the response, `UnknownError` is used.
public struct UnknownError: Swift.Error {
    let message: String
}
