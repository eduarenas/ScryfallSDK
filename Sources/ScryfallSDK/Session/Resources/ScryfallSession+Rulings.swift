//
//  ScryfallSession+Rulings.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

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
        let url = URL(path: .rulingsByMultiverseId(multiverseId))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns rulings for a card with the given MTGO ID (also known as the Catalog ID).
    /// The ID can either be the card’s `mtgo_id` or its `mtgo_foil_id`.
    /// - Parameters:
    ///   - mtgoId: The MTGO ID.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func rulings(mtgoId: Int, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        let url = URL(path: .rulingsByMtgoId(mtgoId))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns rulings for a card with the given Magic: The Gathering Arena ID.
    /// - Parameters:
    ///   - arenaId: The Arena ID.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func rulings(arenaId: Int, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        let url = URL(path: .rulingsByArenaId(arenaId))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a List of rulings for the card with the given set code and collector number.
    /// - Parameters:
    ///   - code: The three to five-letter set code.
    ///   - number: The collector number.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func rulings(code: String, number: String, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        let url = URL(path: .rulingsByCodeAndNumber(code, number))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a List of rulings for a card with the given Scryfall ID.
    /// - Parameters:
    ///   - id: The Scryfall ID.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func rulings(id: UUID, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        let url = URL(path: .rulingsById(id))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }
}

