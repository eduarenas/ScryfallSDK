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
    static let cardArtistNames = Path("/catalog/artist-names")
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

    func cardNames(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .cardNames)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func cardArtistNames(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .cardArtistNames)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func wordBank(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .wordBank)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func creatureTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .creatureTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func planeswalkerTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .planeswalkerTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func landTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .landTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func artifactTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .artifactTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func enchantmentTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .enchantmentTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func spellTypes(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .spellTypes)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func powers(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .powers)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func toughnesses(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .toughnesses)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func loyalties(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .loyalties)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func watermarks(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .watermarks)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func keywordAbilities(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .keywordAbilities)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func keywordActions(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .keywordActions)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func abilityWords(completion: @escaping (_ result: Result<Catalog, Swift.Error>) -> Void) {
        let url = URL(path: .abilityWords)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }
}
