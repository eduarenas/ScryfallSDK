//
//  ScryfallSession.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Foundation

/// Main API object. Functions to call specific endpoints should be added via extensions.
final class ScryfallSession {

    private static let scheme = "https"
    private static let host = "https://api.scryfall.com"

    /// Create a `URL` object used to create a request.
    /// - Parameters:
    ///   - path: API endpoint path.
    ///   - query: Dictionary containing query arguments if any
    /// - Returns: `URL` value with the full API url that can be used to create a `URLRequest`.
    func url(for path: String, query: [String: CustomStringConvertible]? = nil) -> URL  {
        var urlComponets = URLComponents()
        urlComponets.scheme = ScryfallSession.scheme
        urlComponets.host = ScryfallSession.host
        urlComponets.path = path
        urlComponets.queryItems = query?.map { URLQueryItem(name: $0.key, value: $0.value.description) }
        return urlComponets.url!
    }

    /// Creates a `URLRequest` object decribing a request to be performed in a `URLSession`.
    /// - Parameters:
    ///   - url: Full `URL` of the resource to be requested.
    ///   - method: `HTTPMethod` to be used for the request.
    ///   - body: Data to be sent as part of the HTTP request.
    /// - Returns: `URLRequest` calue with all the configuration needed by `URLSession` to perform a request.
    func request(for url: URL, method: HTTPMethod, body: Data) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        return request
    }

    /// Performs a request and call the completion handler with a secoded response object.
    /// - Parameters:
    ///   - request: `URLRequest` fully describing the request to be performed.
    ///   - completion: Completion handler taking a result type that will contain the fully decoded response or an error.
    func performRequest<ResponseType: Decodable>(_ request: URLRequest, completion: @escaping (Result<ResponseType, Swift.Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(Result.failure(error))
            } else if let data = data {
                do {
                    if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode < 400 {
                        completion(Result.success(try JSONDecoder.scryfallDecoder.decode(ResponseType.self, from: data)))
                    } else {
                        completion(Result.failure(try JSONDecoder.scryfallDecoder.decode(Error.self, from: data)))
                    }
                } catch let error {
                    completion(Result.failure(error))
                }
            } else {
                completion(Result.failure(UnknownError(message: "Unknown error occurred while performing request.")))
            }
        }.resume()
    }
}
