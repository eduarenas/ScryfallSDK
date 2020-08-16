//
//  ScryfallSession+CardsTests.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Foundation

// Card related paths.
private extension Path {
    static let cardSearch = Path("/cards/search")
    static let cardByName = Path("/cards/named")
    static let cardAutocomplete = Path("/cards/autocomplete")
    static let randomCard = Path("/cards/random")
    static let cardCollection = Path("/cards/collection")
    static let cardByCodeAndNumber = { (code: String, number: String, lang: Language?) -> Path in
        if let lang = lang {
            return Path("/cards/\(code)/\(number)/\(lang.rawValue)")
        } else {
            return Path("/cards/\(code)/\(number)")
        }
    }
    static let cardByMultiverseId = { (id: Int) in Path("/cards/multiverse/\(id)") }
    static let cardByMtgoId = { (id: Int) in Path("/cards/mtgo/\(id)") }
    static let cardByArenaId = { (id: Int) in Path("/cards/arena/\(id)") }
    static let cardByTcgplayerId = { (id: Int) in Path("/cards/tcgplayer/\(id)") }
    static let cardById = { (id: UUID) in Path("/cards/\(id)") }
}

public extension ScryfallSession {

    func search(
        _ query: String,
        uniqueStrategy: Search.UniqueMode? = nil,
        order: Search.Order? = nil,
        direction: Search.Direction? = nil,
        includeExtras: Bool? = nil,
        includeMultilingual: Bool? = nil,
        includeVariations: Bool? = nil,
        page: Int? = nil,
        completion: @escaping (_ result: Result<List<Card>, Swift.Error>) -> Void
    ) {
        let queryArgs = queryDict(fromArgs: [
            "q": query,
            "unique": uniqueStrategy?.rawValue,
            "order": order?.rawValue,
            "dir": direction?.rawValue,
            "include_extras": includeExtras,
            "include_multilingual": includeMultilingual,
            "include_variations": includeVariations,
            "page": page
        ])

        let url = URL(path: .cardSearch, query: queryArgs)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func card(
        exactName: String,
        set: String? = nil,
        completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void
    ) {
        let queryArgs = queryDict(fromArgs: [
            "exact": exactName,
            "set": set
        ])
        let url = URL(path: .cardByName, query: queryArgs)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func card(
        fuzzyName: String,
        set: String? = nil,
        completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void
    ) {
        let queryArgs = queryDict(fromArgs: [
            "fuzzy": fuzzyName,
            "set": set
        ])
        let url = URL(path: .cardByName, query: queryArgs)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func cardAutocomplete(
        _ query: String,
        includeExtras: Bool? = nil,
        completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void
    ) {
        let queryArgs = queryDict(fromArgs: [
            "q": query,
            "include_extras": includeExtras
        ])

        let url = URL(path: .cardAutocomplete, query: queryArgs)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func randomCard(
        query: String? = nil,
        completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void
    ) {
        let queryArgs = queryDict(fromArgs: [
            "q": query,
        ])

        let url = URL(path: .randomCard, query: queryArgs)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func cardCollection(
        identifiers: [CardId],
        completion: @escaping (_ result: Result<List<Card>, Swift.Error>) -> Void
    ) {
        let url = URL(path: .cardCollection)
        do {
            let body = try JSONEncoder.scryfallEncoder.encode(["identifiers": identifiers])
            let request = URLRequest(
                url: url,
                method: .post,
                headers: ["Content-Type": "application/json"],
                body: body)
            performRequest(request, completion: completion)
        } catch let error {
            completion(Result.failure(error))
        }
    }

    func card(
        code: String,
        number: String,
        lang: Language? = nil,
        completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void
    ) {
        let url = URL(path: .cardByCodeAndNumber(code, number, lang))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func card(multiverseId: Int, completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void) {
        let url = URL(path: .cardByMultiverseId(multiverseId))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func card(mtgoId: Int, completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void) {
        let url = URL(path: .cardByMtgoId(mtgoId))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func card(arenaId: Int, completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void) {
        let url = URL(path: .cardByArenaId(arenaId))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func card(tcgPlayerId: Int, completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void) {
        let url = URL(path: .cardByTcgplayerId(tcgPlayerId))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func card(id: UUID, completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void) {
        let url = URL(path: .cardById(id))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    private func queryDict(fromArgs args: [String: Any?]) -> [String: CustomStringConvertible] {
        args.compactMapValues { $0 as? CustomStringConvertible }
    }
}
