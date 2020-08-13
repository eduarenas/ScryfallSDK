//
//  ScryfallSession.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Combine
import Foundation

/// Main SDK interface containing functions to fetch objects from the Scryfall REST API.
public final class ScryfallSession {

    public static let `default` = ScryfallSession()

    /// Performs a request and call the completion handler with a secoded response object.
    /// - Parameters:
    ///   - request: `URLRequest` fully describing the request to be performed.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the fully decoded response or an error describing what went wrong.
    func performRequest<ResponseType: Decodable>(_ request: URLRequest, completion: @escaping (_ result: Result<ResponseType, Swift.Error>) -> Void) {
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
