//
//  ScryfallSession.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Combine
import Foundation

/// Main SDK interface containing functions to fetch objects from the Scryfall REST API.
public class ScryfallSession {

    public static let `default` = ScryfallSession()

    /// Performs a request and call the completion handler with a decoded response object.
    /// - Parameters:
    ///   - request: `URLRequest` fully describing the request to be performed.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the fully decoded response or an error describing what went wrong.
    func performRequest<ResponseType: Decodable>(
        _ request: URLRequest,
        completion: @escaping (_ result: Result<ResponseType, Swift.Error>) -> Void
    ) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(Result.failure(error))
            } else if let data = data {
                do {
                    completion(Result.success(try ScryfallSession.decodeResponse(data: data, response: response)))
                } catch let error {
                    completion(Result.failure(error))
                }
            } else {
                completion(Result.failure(UnknownError(message: "Unknown error occurred while performing request.")))
            }
        }.resume()
    }

    /// Creates a publisher that performs URLRequest and publishes a decoded value when it completes.
    /// - Parameter request: Object with the description of the request to perform.
    /// - Returns: Publisher that will emit the decoded result of performing the request or a failure with the error description.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func requestPublisher<ResponseType: Decodable>(for request: URLRequest) -> AnyPublisher<ResponseType, Swift.Error> {
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap(ScryfallSession.decodeResponse)
            .eraseToAnyPublisher()
    }

    private static func decodeResponse<ResponseType: Decodable>(data: Data, response: URLResponse?) throws -> ResponseType {
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode < 400 else {
            throw try JSONDecoder.scryfallDecoder.decode(Error.self, from: data)
        }
        return try JSONDecoder.scryfallDecoder.decode(ResponseType.self, from: data)
    }
}
