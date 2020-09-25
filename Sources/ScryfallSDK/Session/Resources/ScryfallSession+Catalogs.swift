//
//  ScryfallSession+Catalogs.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import Combine
import Foundation

// Card Symbol related catalogs.
private extension Path {
    static let cardNames = Path("/catalog/card-names")
    static let artistNames = Path("/catalog/artist-names")
    static let wordBank = Path("/catalog/word-bank")
    static let creatureTypes = Path("/catalog/creature-types")
    static let planeswalkerTypes = Path("/catalog/planeswalker-types")
    static let landTypes = Path("/catalog/land-types")
    static let artifactTypes = Path("/catalog/artifact-types")
    static let enchantmentTypes = Path("/catalog/enchantment-types")
    static let spellTypes = Path("/catalog/spell-types")
    static let powers = Path("/catalog/powers")
    static let toughnesses = Path("/catalog/toughnesses")
    static let loyalties = Path("/catalog/loyalties")
    static let watermarks = Path("/catalog/watermarks")
    static let keywordAbilities = Path("/catalog/keyword-abilities")
    static let keywordActions = Path("/catalog/keyword-actions")
    static let abilityWords = Path("/catalog/ability-words")
}

public extension ScryfallSession {

    /// Returns a `Catalog` of all nontoken English card names in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// 
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func cardNames(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(cardNamesRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all nontoken English card names in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func cardNames() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: cardNamesRequest())
    }

    private func cardNamesRequest() -> URLRequest {
        URLRequest(url: URL(path: .cardNames), method: .get)
    }

    /// Returns a `Catalog` of all canonical artist names in Scryfall’s database.
    ///
    /// This catalog won’t include duplicate, misspelled, or funny names for artists.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func artistNames(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(artistNamesRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all canonical artist names in Scryfall’s database.
    ///
    /// This catalog won’t include duplicate, misspelled, or funny names for artists.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func artistNames() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: artistNamesRequest())
    }

    private func artistNamesRequest() -> URLRequest {
        URLRequest(url: URL(path: .artistNames), method: .get)
    }

    /// Returns a `Catalog` of all English words, of length 2 or more, that could appear in a card name.
    ///
    /// Values are drawn from cards currently in Scryfall’s database. Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func wordBank(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(wordBankRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all English words, of length 2 or more, that could appear in a card name.
    ///
    /// Values are drawn from cards currently in Scryfall’s database. Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func wordBank() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: wordBankRequest())
    }

    private func wordBankRequest() -> URLRequest {
        URLRequest(url: URL(path: .wordBank), method: .get)
    }

    /// Returns a `Catalog` of all creature types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func creatureTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(creatureTypesRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all creature types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func creatureTypes() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: creatureTypesRequest())
    }

    private func creatureTypesRequest() -> URLRequest {
        URLRequest(url: URL(path: .creatureTypes), method: .get)
    }

    /// Returns a `Catalog` of all Planeswalker types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func planeswalkerTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(planeswalkerTypesRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all Planeswalker types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func planeswalkerTypes() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: planeswalkerTypesRequest())
    }

    private func planeswalkerTypesRequest() -> URLRequest {
        URLRequest(url: URL(path: .planeswalkerTypes), method: .get)
    }

    /// Returns a `Catalog` of all Land types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func landTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(landTypesRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all Land types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func landTypes() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: landTypesRequest())
    }

    private func landTypesRequest() -> URLRequest {
        URLRequest(url: URL(path: .landTypes), method: .get)
    }

    /// Returns a `Catalog` of all artifact types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func artifactTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(artifactTypesRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all artifact types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func artifactTypes() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: artifactTypesRequest())
    }

    private func artifactTypesRequest() -> URLRequest {
        URLRequest(url: URL(path: .artifactTypes), method: .get)
    }

    /// Returns a `Catalog` of all enchantment types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func enchantmentTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(enchantmentTypesRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all enchantment types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func enchantmentTypes() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: enchantmentTypesRequest())
    }

    private func enchantmentTypesRequest() -> URLRequest {
        URLRequest(url: URL(path: .enchantmentTypes), method: .get)
    }

    /// Returns a `Catalog` of all spell types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func spellTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(spellTypesRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all spell types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func spellTypes() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: spellTypesRequest())
    }

    private func spellTypesRequest() -> URLRequest {
        URLRequest(url: URL(path: .spellTypes), method: .get)
    }

    /// Returns a `Catalog` of all possible values for a creature or vehicle’s power in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func powers(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(powersRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all possible values for a creature or vehicle’s power in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func powers() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: powersRequest())
    }

    private func powersRequest() -> URLRequest {
        URLRequest(url: URL(path: .powers), method: .get)
    }

    /// Returns a `Catalog` of all possible values for a creature or vehicle’s toughness in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func toughnesses(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(toughnessesRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all possible values for a creature or vehicle’s toughness in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func toughnesses() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: toughnessesRequest())
    }

    private func toughnessesRequest() -> URLRequest {
        URLRequest(url: URL(path: .toughnesses), method: .get)
    }

    /// Returns a Catalog of all possible values for a Planeswalker’s loyalty in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func loyalties(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(loyaltiesRequest(), completion: completion)
    }

    /// Creates a publisher that requests a Catalog of all possible values for a Planeswalker’s loyalty in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func loyalties() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: loyaltiesRequest())
    }

    private func loyaltiesRequest() -> URLRequest {
        URLRequest(url: URL(path: .loyalties), method: .get)
    }

    /// Returns a `Catalog` of all card watermarks in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func watermarks(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(watermarksRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all card watermarks in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func watermarks() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: watermarksRequest())
    }

    private func watermarksRequest() -> URLRequest {
        URLRequest(url: URL(path: .watermarks), method: .get)
    }

    /// Returns a `Catalog` of all keyword abilities in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func keywordAbilities(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(keywordAbilitiesRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all keyword abilities in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func keywordAbilities() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: keywordAbilitiesRequest())
    }

    private func keywordAbilitiesRequest() -> URLRequest {
        URLRequest(url: URL(path: .keywordAbilities), method: .get)
    }

    /// Returns a `Catalog` of all keyword actions in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func keywordActions(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(keywordActionsRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all keyword actions in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func keywordActions() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: keywordActionsRequest())
    }

    private func keywordActionsRequest() -> URLRequest {
        URLRequest(url: URL(path: .keywordActions), method: .get)
    }

    /// Returns a `Catalog` of all ability words in Scryfall’s database.
    /// 
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func abilityWords(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        performRequest(abilityWordsRequest(), completion: completion)
    }

    /// Creates a publisher that requests a `Catalog` of all ability words in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    ///
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func abilityWords() -> AnyPublisher<Catalog, Swift.Error> {
        requestPublisher(for: abilityWordsRequest())
    }

    private func abilityWordsRequest() -> URLRequest {
        URLRequest(url: URL(path: .abilityWords), method: .get)
    }
}
