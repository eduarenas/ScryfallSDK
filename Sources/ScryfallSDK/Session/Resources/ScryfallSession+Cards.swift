//
//  ScryfallSession+CardsTests.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Combine
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

    /// Returns a List object containing Cards found using a fulltext search string.
    /// This string supports the same fulltext search system that the main site uses.
    ///
    /// This method is paginated, returning 175 cards at a time.
    /// 
    /// - Parameters:
    ///   - query: A fulltext search query.
    ///   - uniqueStrategy: The strategy for omitting similar cards.
    ///   - order: The method to sort returned cards.
    ///   - direction: The direction to sort cards.
    ///   - includeExtras: If `true`, extra cards (tokens, planes, etc) will be included. Defaults to `false`.
    ///   - includeMultilingual: If `true`, cards in every language supported by Scryfall will be included. Defaults to `false`.
    ///   - includeVariations: If `true`, rare care variants will be included. Defaults to `false`.
    ///   - page: The page number to return, default `1`.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
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
        performRequest(searchRequest(query,
                                     uniqueStrategy: uniqueStrategy,
                                     order: order,
                                     direction: direction,
                                     includeExtras: includeExtras,
                                     includeMultilingual: includeMultilingual,
                                     includeVariations: includeVariations,
                                     page: page
        ), completion: completion)
    }

    /// Creates a publisher that requests a List object containing Cards found using a fulltext search string.
    /// This string supports the same fulltext search system that the main site uses.
    ///
    /// This method is paginated, returning 175 cards at a time.
    ///
    /// - Parameters:
    ///   - query: A fulltext search query.
    ///   - uniqueStrategy: The strategy for omitting similar cards.
    ///   - order: The method to sort returned cards.
    ///   - direction: The direction to sort cards.
    ///   - includeExtras: If `true`, extra cards (tokens, planes, etc) will be included. Defaults to `false`.
    ///   - includeMultilingual: If `true`, cards in every language supported by Scryfall will be included. Defaults to `false`.
    ///   - includeVariations: If `true`, rare care variants will be included. Defaults to `false`.
    ///   - page: The page number to return, default `1`.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func search(
        _ query: String,
        uniqueStrategy: Search.UniqueMode? = nil,
        order: Search.Order? = nil,
        direction: Search.Direction? = nil,
        includeExtras: Bool? = nil,
        includeMultilingual: Bool? = nil,
        includeVariations: Bool? = nil,
        page: Int? = nil
    ) -> AnyPublisher<List<Card>, Swift.Error> {
        requestPublisher(for: searchRequest(query,
                                            uniqueStrategy: uniqueStrategy,
                                            order: order,
                                            direction: direction,
                                            includeExtras: includeExtras,
                                            includeMultilingual: includeMultilingual,
                                            includeVariations: includeVariations,
                                            page: page
        ))
    }

    private func searchRequest(
        _ query: String,
        uniqueStrategy: Search.UniqueMode?,
        order: Search.Order?,
        direction: Search.Direction?,
        includeExtras: Bool?,
        includeMultilingual: Bool?,
        includeVariations: Bool?,
        page: Int?
    ) -> URLRequest {
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
        return URLRequest(url: url, method: .get)
    }

    /// Returns a Card based on a name search string. If a card with the **exact** name isn't found, a 404 error is returned.
    ///
    /// You may also provide a set code in the set parameter, in which case the name search and the returned card print
    /// will be limited to the specified set.
    ///
    /// This method is designed for building chat bots, forum bots, and other services that need card details quickly.
    ///
    /// - Parameters:
    ///   - exactName: The exact card name to search for, case insenstive.
    ///   - set: A set code to limit the search to one set.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func card(
        exactName: String,
        set: String? = nil,
        completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void
    ) {
        performRequest(cardRequest(exactName: exactName, set: set), completion: completion)
    }

    /// Creates a publisher that requests a Card based on a name search string. If a card with the **exact** name isn't found, a 404 error is emitted.
    ///
    /// You may also provide a set code in the set parameter, in which case the name search and the returned card print
    /// will be limited to the specified set.
    ///
    /// This method is designed for building chat bots, forum bots, and other services that need card details quickly.
    ///
    /// - Parameters:
    ///   - exactName: The exact card name to search for, case insenstive.
    ///   - set: A set code to limit the search to one set.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func card(exactName: String, set: String? = nil) -> AnyPublisher<Card, Swift.Error> {
        requestPublisher(for: cardRequest(exactName: exactName, set: set))
    }

    private func cardRequest(exactName: String, set: String?) -> URLRequest {
        let queryArgs = queryDict(fromArgs: [
            "exact": exactName,
            "set": set
        ])
        let url = URL(path: .cardByName, query: queryArgs)
        return URLRequest(url: url, method: .get)
    }

    /// Returns a Card based on a name search string. If  a card name matches that string, then that card is returned.
    /// If not, a fuzzy search is executed for your card name. The server allows misspellings and partial words to be provided.
    ///
    /// When fuzzy searching, a card is returned if the server is confident that you unambiguously identified a unique name with your string.
    /// Otherwise, you will receive a 404 Error object describing the problem: either more than 1 one card matched your search, or zero cards matched.
    ///
    /// You may also provide a set code in the set parameter, in which case the name search and the returned card print
    /// will be limited to the specified set.
    ///
    /// This method is designed for building chat bots, forum bots, and other services that need card details quickly.
    /// - Parameters:
    ///   - fuzzyName: A fuzzy card name to search for.
    ///   - set: A set code to limit the search to one set.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func card(
        fuzzyName: String,
        set: String? = nil,
        completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void
    ) {
        performRequest(cardRequest(fuzzyName: fuzzyName, set: set), completion: completion)
    }

    /// Creates a publisher that requests a Card based on a name search string. If  a card name matches that string, then that card is returned.
    /// If not, a fuzzy search is executed for your card name. The server allows misspellings and partial words to be provided.
    ///
    /// When fuzzy searching, a card is returned if the server is confident that you unambiguously identified a unique name with your string.
    /// Otherwise, you will receive a 404 Error object describing the problem: either more than 1 one card matched your search, or zero cards matched.
    ///
    /// You may also provide a set code in the set parameter, in which case the name search and the returned card print
    /// will be limited to the specified set.
    ///
    /// This method is designed for building chat bots, forum bots, and other services that need card details quickly.
    ///
    /// - Parameters:
    ///   - fuzzyName: A fuzzy card name to search for.
    ///   - set: A set code to limit the search to one set.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func card(fuzzyName: String, set: String? = nil) -> AnyPublisher<Card, Swift.Error> {
        requestPublisher(for: cardRequest(fuzzyName: fuzzyName, set: set))
    }

    private func cardRequest(fuzzyName: String, set: String?) -> URLRequest {
        let queryArgs = queryDict(fromArgs: [
            "fuzzy": fuzzyName,
            "set": set
        ])
        let url = URL(path: .cardByName, query: queryArgs)
        return URLRequest(url: url, method: .get)
    }

    /// Returns a `Catalog` object containing up to 20 full English card names that could be autocompletions of the given string parameter.
    /// - Parameters:
    ///   - query: The string to autocomplete.
    ///   - includeExtras: If `true`, extra cards (tokens, planes, vanguards, etc) will be included. Defaults to `false`.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func cardAutocomplete(
        _ query: String,
        includeExtras: Bool? = nil,
        completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void
    ) {
        performRequest(cardAutocompleteRequest(query: query, includeExtras: includeExtras), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` object containing up to 20 full English card names that could be autocompletions of the given string parameter.
    /// - Parameters:
    ///   - query: The string to autocomplete.
    ///   - includeExtras: If `true`, extra cards (tokens, planes, vanguards, etc) will be included. Defaults to `false`.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func cardAutocomplete(_ query: String, includeExtras: Bool? = nil) -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: cardAutocompleteRequest(query: query, includeExtras: includeExtras))
    }

    private func cardAutocompleteRequest(query: String, includeExtras: Bool?) -> URLRequest {
        let queryArgs = queryDict(fromArgs: [
            "q": query,
            "include_extras": includeExtras
        ])
        let url = URL(path: .cardAutocomplete, query: queryArgs)
        return URLRequest(url: url, method: .get)
    }

    /// Returns a single random Card object.
    /// - Parameters:
    ///   - query: An optional fulltext search query to filter the pool of random cards.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func randomCard(
        query: String? = nil,
        completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void
    ) {
        performRequest(randomCardRequest(query: query), completion: completion)
    }

    /// Creates a publisher that requests a single random Card object.
    /// - Parameter query: An optional fulltext search query to filter the pool of random cards.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func randomCard(query: String? = nil) -> AnyPublisher<Card, Swift.Error> {
        requestPublisher(for: randomCardRequest(query: query))
    }

    private func randomCardRequest(query: String?) -> URLRequest {
        let queryArgs = queryDict(fromArgs: [
            "q": query,
        ])
        let url = URL(path: .randomCard, query: queryArgs)
        return URLRequest(url: url, method: .get)
    }

    /// Accepts an array of `CardId`s, and returns a `List<Card>` object with the collection of requested cards.
    ///
    /// A maximum of 75 card references may be submitted per request.
    ///
    /// - Parameters:
    ///   - identifiers: An array of `CardId`s.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func cardCollection(
        identifiers: [CardId],
        completion: @escaping (_ result: Result<List<Card>, Swift.Error>) -> Void
    ) {
        do {
            performRequest(try cardCollectionRequest(identifiers: identifiers), completion: completion)
        } catch let error {
            completion(Result.failure(error))
        }
    }

    /// Accepts an array of `CardId`s, and returns a publisher that reqyests a `List<Card>` object with the collection of requested cards.
    ///
    /// A maximum of 75 card references may be submitted per request.
    ///
    /// - Parameter identifiers: An array of `CardId`s.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func cardCollection(identifiers: [CardId]) -> AnyPublisher<List<Card>, Swift.Error> {
        do {
            return requestPublisher(for: try cardCollectionRequest(identifiers: identifiers))
        } catch let error {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }

    private func cardCollectionRequest(identifiers: [CardId]) throws -> URLRequest {
        let url = URL(path: .cardCollection)
        let body = try JSONEncoder.scryfallEncoder.encode(["identifiers": identifiers])
        return URLRequest(
            url: url,
            method: .post,
            headers: ["Content-Type": "application/json"],
            body: body)
    }

    /// Returns a single card with the given set code and collector number.
    ///
    /// You may optionally specify a language to retrieve a non-English version of the card.
    ///
    /// - Parameters:
    ///   - code: The three to five-letter set code.
    ///   - number: The collector number.
    ///   - lang: The 2-3 character language code.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func card(
        code: String,
        number: String,
        lang: Language? = nil,
        completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void
    ) {
        performRequest(cardRequest(code: code, number: number, lang: lang), completion: completion)
    }

    /// Creates a publisher that requests a single card with the given set code and collector number.
    ///
    /// You may optionally specify a language to retrieve a non-English version of the card.
    ///
    /// - Parameters:
    ///   - code: The three to five-letter set code.
    ///   - number: The collector number.
    ///   - lang: The 2-3 character language code.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func card(code: String, number: String, lang: Language? = nil) -> AnyPublisher<Card, Swift.Error> {
        requestPublisher(for: cardRequest(code: code, number: number, lang: lang))
    }

    private func cardRequest(code: String, number: String, lang: Language?) -> URLRequest {
        URLRequest(url: URL(path: .cardByCodeAndNumber(code, number, lang)), method: .get)
    }

    /// Returns a single card with the given Multiverse ID. If the card has multiple multiverse IDs, this method can find either of them.
    /// - Parameters:
    ///   - multiverseId: The multiverse ID.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func card(multiverseId: Int, completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void) {
        performRequest(cardRequest(multiverseId: multiverseId), completion: completion)
    }

    /// Creates a publisher that requests a single card with the given Multiverse ID. If the card has multiple multiverse IDs, this method can find either of them.
    /// - Parameter multiverseId: The multiverse ID.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func card(multiverseId: Int) -> AnyPublisher<Card, Swift.Error> {
        requestPublisher(for: cardRequest(multiverseId: multiverseId))
    }

    private func cardRequest(multiverseId: Int) -> URLRequest {
        URLRequest(url: URL(path: .cardByMultiverseId(multiverseId)), method: .get)
    }

    /// Returns a single card with the given MTGO ID (also known as the Catalog ID).
    ///
    /// The ID can either be the card’s `mtgo_id` or its `mtgo_foil_id`.
    ///
    /// - Parameters:
    ///   - mtgoId: The MTGO ID.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func card(mtgoId: Int, completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void) {
        performRequest(cardRequest(mtgoId: mtgoId), completion: completion)
    }

    /// Creates a publisher that requests a single card with the given MTGO ID (also known as the Catalog ID).
    ///
    /// The ID can either be the card’s `mtgo_id` or its `mtgo_foil_id`.
    ///
    /// - Parameter mtgoId: The MTGO ID.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func card(mtgoId: Int) -> AnyPublisher<Card, Swift.Error> {
        requestPublisher(for: cardRequest(mtgoId: mtgoId))
    }

    private func cardRequest(mtgoId: Int) -> URLRequest {
        URLRequest(url: URL(path: .cardByMtgoId(mtgoId)), method: .get)
    }

    /// Returns a single card with the given Magic: The Gathering Arena ID.
    /// - Parameters:
    ///   - arenaId: The Arena ID.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func card(arenaId: Int, completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void) {
        performRequest(cardRequest(arenaId: arenaId), completion: completion)
    }

    /// Creates a publisher that requests a single card with the given Magic: The Gathering Arena ID.
    /// - Parameter arenaId: The Arena ID.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func card(arenaId: Int) -> AnyPublisher<Card, Swift.Error> {
        requestPublisher(for: cardRequest(arenaId: arenaId))
    }

    private func cardRequest(arenaId: Int) -> URLRequest {
        URLRequest(url: URL(path: .cardByArenaId(arenaId)), method: .get)
    }

    /// Returns a single card with the given `tcgplayer_id`, also known as the
    /// productId on [TCGplayer’s API](https://docs.tcgplayer.com/docs).
    /// - Parameters:
    ///   - arenaId: The `tcgplayer_id` or `productId`.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func card(tcgPlayerId: Int, completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void) {
        performRequest(cardRequest(tcgPlayerId: tcgPlayerId), completion: completion)
    }

    /// Creates a publisher that requests a single card with the given `tcgplayer_id`, also known as the
    /// productId on [TCGplayer’s API](https://docs.tcgplayer.com/docs).
    /// - Parameter tcgPlayerId: The `tcgplayer_id` or `productId`.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func card(tcgPlayerId: Int) -> AnyPublisher<Card, Swift.Error> {
        requestPublisher(for: cardRequest(tcgPlayerId: tcgPlayerId))
    }

    private func cardRequest(tcgPlayerId: Int) -> URLRequest {
        URLRequest(url: URL(path: .cardByTcgplayerId(tcgPlayerId)), method: .get)
    }

    /// Returns a single card with the given Scryfall ID.
    /// - Parameters:
    ///   - id: The Scryfall ID.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func card(id: UUID, completion: @escaping (_ result: Result<Card, Swift.Error>) -> Void) {
        performRequest(cardRequest(id: id), completion: completion)
    }

    /// Creates a publisher that requests a single card with the given Scryfall ID.
    /// - Parameter id: The Scryfall ID.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func card(id: UUID) -> AnyPublisher<Card, Swift.Error> {
        requestPublisher(for: cardRequest(id: id))
    }

    private func cardRequest(id: UUID) -> URLRequest {
        URLRequest(url: URL(path: .cardById(id)), method: .get)
    }

    private func queryDict(fromArgs args: [String: Any?]) -> [String: CustomStringConvertible] {
        args.compactMapValues { $0 as? CustomStringConvertible }
    }
}
