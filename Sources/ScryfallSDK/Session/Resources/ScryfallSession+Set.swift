//
//  File.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Foundation

// Set related paths.
extension Path {
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
        let url = URL(path: .sets)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Fetches a `Set` with the given Scryfall id.
    /// - Parameters:
    ///   - id: Scryfall id for the set.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func set(id: UUID, completion: @escaping (_ result: Result<Set, Swift.Error>) -> Void) {
        let url = URL(path: .setById(id))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Fetches a Set with the given set code. The code can be either the code or the mtgo_code for the set.
    /// - Parameters:
    ///   - code: Scryfall id for the set.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func set(code: String, completion: @escaping (_ result: Result<Set, Swift.Error>) -> Void) {
        let url = URL(path: .setByCode(code))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Fetches a Set with the given `tcgplayer_id`, also known as the `groupId` on TCGplayer’s API.
    /// - Parameters:
    ///   - tcgplayerId: Scryfall id for the set.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func set(tcgplayerId: Int, completion: @escaping (_ result: Result<Set, Swift.Error>) -> Void) {
        let url = URL(path: .setByTcgPlayerId(tcgplayerId))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }
}
