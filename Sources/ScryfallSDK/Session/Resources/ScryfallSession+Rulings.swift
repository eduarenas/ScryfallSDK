//
//  ScryfallSession+Rulings.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import Combine
import Foundation

// Card related rulings.
private extension Path {
    static let rulingsByMultiverseId = { (id: Int) in Path("/cards/multiverse/\(id)/rulings") }
    static let rulingsByMtgoId = { (id: Int) in Path("/cards/mtgo/\(id)/rulings") }
    static let rulingsByArenaId = { (id: Int) in Path("/cards/arena/\(id)/rulings") }
    static let rulingsByCodeAndNumber = { (code: String, number: String) in Path("/cards/\(code)/\(number)/rulings") }
    static let rulingsById = { (id: UUID) in Path("/cards/\(id)/rulings") }
}

public extension ScryfallSession {

    /// Returns a List of rulings for a card with the given Multiverse ID. If the card has multiple multiverse IDs, this method can find either of them.
    /// - Parameters:
    ///   - multiverseId: The multiverse ID.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func rulings(multiverseId: Int, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        performRequest(rulingsRequest(multiverseId: multiverseId), completion: completion)
    }

    /// Creates a publisher that requests a List of rulings for a card with the given Multiverse ID. If the card has multiple multiverse IDs, this method can find either of them.
    /// - Parameters:
    ///   - multiverseId: The multiverse ID.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func rulings(multiverseId: Int) -> AnyPublisher<List<Ruling>, Swift.Error> {
        requestPublisher(for: rulingsRequest(multiverseId: multiverseId))
    }

    private func rulingsRequest(multiverseId: Int) -> URLRequest {
        URLRequest(url: URL(path: .rulingsByMultiverseId(multiverseId)), method: .get)
    }

    /// Returns rulings for a card with the given MTGO ID (also known as the Catalog ID).
    /// The ID can either be the card’s `mtgo_id` or its `mtgo_foil_id`.
    /// - Parameters:
    ///   - mtgoId: The MTGO ID.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func rulings(mtgoId: Int, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        performRequest(rulingsRequest(mtgoId: mtgoId), completion: completion)
    }

    /// Creates a publisher that requests rulings for a card with the given MTGO ID (also known as the Catalog ID).
    /// The ID can either be the card’s `mtgo_id` or its `mtgo_foil_id`.
    /// - Parameters:
    ///   - mtgoId: The MTGO ID.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func rulings(mtgoId: Int) -> AnyPublisher<List<Ruling>, Swift.Error> {
        requestPublisher(for: rulingsRequest(mtgoId: mtgoId))
    }

    private func rulingsRequest(mtgoId: Int) -> URLRequest {
        URLRequest(url: URL(path: .rulingsByMtgoId(mtgoId)), method: .get)
    }

    /// Returns rulings for a card with the given Magic: The Gathering Arena ID.
    /// - Parameters:
    ///   - arenaId: The Arena ID.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func rulings(arenaId: Int, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        performRequest(rulingsRequest(arenaId: arenaId), completion: completion)
    }

    /// Creates a publisher that requests rulings for a card with the given Magic: The Gathering Arena ID.
    /// - Parameters:
    ///   - arenaId: The Arena ID.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func rulings(arenaId: Int) -> AnyPublisher<List<Ruling>, Swift.Error> {
        requestPublisher(for: rulingsRequest(arenaId: arenaId))
    }

    private func rulingsRequest(arenaId: Int) -> URLRequest {
        URLRequest(url: URL(path: .rulingsByArenaId(arenaId)), method: .get)
    }

    /// Returns a List of rulings for the card with the given set code and collector number.
    /// - Parameters:
    ///   - code: The three to five-letter set code.
    ///   - number: The collector number.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func rulings(code: String, number: String, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        performRequest(rulingsRequest(code: code, number: number), completion: completion)
    }

    /// Creates a publisher that requests a List of rulings for the card with the given set code and collector number.
    /// - Parameters:
    ///   - code: The three to five-letter set code.
    ///   - number: The collector number.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func rulings(code: String, number: String) -> AnyPublisher<List<Ruling>, Swift.Error> {
        requestPublisher(for: rulingsRequest(code: code, number: number))
    }

    private func rulingsRequest(code: String, number: String) -> URLRequest {
        URLRequest(url: URL(path: .rulingsByCodeAndNumber(code, number)), method: .get)
    }

    /// Returns a List of rulings for a card with the given Scryfall ID.
    /// - Parameters:
    ///   - id: The Scryfall ID.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func rulings(id: UUID, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        performRequest(rulingsRequest(id: id), completion: completion)
    }

    /// Creates a publisher that requests a List of rulings for a card with the given Scryfall ID.
    /// - Parameters:
    ///   - id: The Scryfall ID.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func rulings(id: UUID) -> AnyPublisher<List<Ruling>, Swift.Error> {
        requestPublisher(for: rulingsRequest(id: id))
    }

    private func rulingsRequest(id: UUID) -> URLRequest {
        URLRequest(url: URL(path: .rulingsById(id)), method: .get)
    }
}
