//
//  Networking.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Foundation

/// Possible HTTP methods. At the moment Scryfall only supports `GET` and `POST` requests.
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

/// Represents an API path. Simple wrapper around string to provide some type safety.
struct Path {
    let value: String
    init(_ value: String) { self.value = value }
}

extension URL {

    /// Create a `URL` object used to create a request.
    /// - Parameters:
    ///   - path: API endpoint path.
    ///   - query: Dictionary containing query arguments if any
    /// - Returns: `URL` value with the full API url that can be used to create a `URLRequest`.
    init(path: Path, query: [String: CustomStringConvertible]? = nil) {
        var urlComponets = URLComponents()
        urlComponets.scheme = "https"
        urlComponets.host = "api.scryfall.com"
        urlComponets.path = path.value
        urlComponets.queryItems = query?.map { URLQueryItem(name: $0.key, value: $0.value.description) }
        self = urlComponets.url!
    }
}

extension URLRequest {

    /// Creates a `URLRequest` object decribing a request to be performed in a `URLSession`.
    /// - Parameters:
    ///   - url: Full `URL` of the resource to be requested.
    ///   - method: `HTTPMethod` to be used for the request.
    ///   - body: Data to be sent as part of the HTTP request.
    /// - Returns: `URLRequest` calue with all the configuration needed by `URLSession` to perform a request.
    init(url: URL, method: HTTPMethod, body: Data? = nil) {
        self.init(url: url)
        self.httpMethod = method.rawValue
        self.httpBody = body
    }
}
