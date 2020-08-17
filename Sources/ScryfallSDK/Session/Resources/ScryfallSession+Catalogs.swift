//
//  ScryfallSession+Catalogs.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

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

    /// A `Catalog` object contains an array of Magic datapoints (words, card values, etc).
    ///
    /// Catalog objects are provided by the API as aids for building other Magic software and understanding possible values for a field on Card objects.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func cardNames(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .cardNames)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all canonical artist names in Scryfall’s database.
    ///
    /// This catalog won’t include duplicate, misspelled, or funny names for artists.
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func artistNames(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .artistNames)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all English words, of length 2 or more, that could appear in a card name.
    ///
    /// Values are drawn from cards currently in Scryfall’s database. Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func wordBank(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .wordBank)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all creature types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func creatureTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .creatureTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all Planeswalker types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func planeswalkerTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .planeswalkerTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all Land types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func landTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .landTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all artifact types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func artifactTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .artifactTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all enchantment types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func enchantmentTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .enchantmentTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all spell types in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func spellTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .spellTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all possible values for a creature or vehicle’s power in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func powers(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .powers)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all possible values for a creature or vehicle’s toughness in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func toughnesses(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .toughnesses)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a Catalog of all possible values for a Planeswalker’s loyalty in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func loyalties(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .loyalties)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all card watermarks in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func watermarks(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .watermarks)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all keyword abilities in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func keywordAbilities(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .keywordAbilities)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all keyword actions in Scryfall’s database.
    ///
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func keywordActions(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .keywordActions)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    /// Returns a `Catalog` of all ability words in Scryfall’s database.
    /// 
    /// Values are updated as soon as a new card is entered for spoiler seasons.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func abilityWords(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .abilityWords)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }
}
