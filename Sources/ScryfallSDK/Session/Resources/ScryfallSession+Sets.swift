//
//  ScryfallSession+Sets.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Combine
import Foundation

// Set related paths.
private extension Path {
    static let sets = Path("/sets")
    static let setById = { (id: UUID) in Path("/sets/\(id)") }
    static let setByCode = { (code: String) in Path("/sets/\(code)") }
    static let setByTcgPlayerId = { (id: Int) in Path("/sets/tcgplayer/\(id)") }
}

public extension ScryfallSession {

    /// Fetches a `List` object of all `Set`s on Scryfall.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func sets(completion: @escaping (_ result: Result<List<Set>, Swift.Error>) -> Void) {
        performRequest(setsRequest(), completion: completion)
    }

    /// Creates a publisher that requests  a `List` object of all `Set`s on Scryfall.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func sets() -> AnyPublisher<List<Set>, Swift.Error> {
        requestPublisher(for: setsRequest())
    }

    private func setsRequest() -> URLRequest {
        URLRequest(url: URL(path: .sets), method: .get)
    }

    /// Fetches a `Set` with the given Scryfall id.
    /// - Parameters:
    ///   - id: Scryfall id for the set.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func set(id: UUID, completion: @escaping (_ result: Result<Set, Swift.Error>) -> Void) {
        performRequest(setRequest(id: id), completion: completion)
    }

    /// Creates a publisher that requests a `Set` with the given Scryfall id.
    /// - Parameter id: Scryfall id for the set.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func set(id: UUID) -> AnyPublisher<Set, Swift.Error> {
        requestPublisher(for: setRequest(id: id))
    }

    private func setRequest(id: UUID) -> URLRequest {
        URLRequest(url: URL(path: .setById(id)), method: .get)
    }

    /// Fetches a Set with the given set code. The code can be either the code or the mtgo_code for the set.
    /// - Parameters:
    ///   - code: The three to five-letter set code..
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func set(code: String, completion: @escaping (_ result: Result<Set, Swift.Error>) -> Void) {
        performRequest(setRequest(code: code), completion: completion)
    }

    /// Creates a publisher that requests and publishes a Set with the given set code. The code can be either the code or the mtgo_code for the set.
    /// - Parameter code: The three to five-letter set code..
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func set(code: String) -> AnyPublisher<Set, Swift.Error> {
        requestPublisher(for: setRequest(code: code))
    }

    private func setRequest(code: String) -> URLRequest {
        URLRequest(url: URL(path: .setByCode(code)), method: .get)
    }

    /// Fetches a Set with the given `tcgplayer_id`, also known as the `groupId` on TCGplayer’s API.
    /// - Parameters:
    ///   - tcgplayerId: Scryfall id for the set.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func set(tcgplayerId: Int, completion: @escaping (_ result: Result<Set, Swift.Error>) -> Void) {
        performRequest(setRequest(tcgplayerId: tcgplayerId), completion: completion)
    }

    /// Creates a publisher that requests and publishes a Set with the given `tcgplayer_id`, also known as the `groupId` on TCGplayer’s API.
    /// - Parameter tcgplayerId: Scryfall id for the set.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func set(tcgplayerId: Int) -> AnyPublisher<Set, Swift.Error> {
        requestPublisher(for: setRequest(tcgplayerId: tcgplayerId))
    }

    private func setRequest(tcgplayerId: Int) -> URLRequest {
        URLRequest(url: URL(path: .setByTcgPlayerId(tcgplayerId)), method: .get)
    }
}
