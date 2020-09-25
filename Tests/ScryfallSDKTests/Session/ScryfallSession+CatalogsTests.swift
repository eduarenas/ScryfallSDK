//
//  ScryfallSession+CatalogsTests.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import XCTest
@testable import ScryfallSDK

final class CatalogsRequestsTests: XCTestCase {

    func testCardNamesCatalogRequest() {
        let session = TestScryfallSession()
        session.cardNames() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/card-names")

        _ = session.cardNames()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testArtistNamesCatalogRequest() {
        let session = TestScryfallSession()
        session.artistNames() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/artist-names")

        _ = session.artistNames()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testWordBankCatalogRequest() {
        let session = TestScryfallSession()
        session.wordBank() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/word-bank")

        _ = session.wordBank()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testcreatureTypesCatalogRequest() {
        let session = TestScryfallSession()
        session.creatureTypes() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/creature-types")

        _ = session.creatureTypes()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testPlaneswalkerTypesCatalogRequest() {
        let session = TestScryfallSession()
        session.planeswalkerTypes() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/planeswalker-types")

        _ = session.planeswalkerTypes()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testlandTypesCatalogRequest() {
        let session = TestScryfallSession()
        session.landTypes() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/land-types")

        _ = session.landTypes()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testartifactTypesCatalogRequest() {
        let session = TestScryfallSession()
        session.artifactTypes() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/artifact-types")

        _ = session.artifactTypes()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testEnchantmentTypesCatalogRequest() {
        let session = TestScryfallSession()
        session.enchantmentTypes() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/enchantment-types")

        _ = session.enchantmentTypes()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testSpellTypesCatalogRequest() {
        let session = TestScryfallSession()
        session.spellTypes() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/spell-types")

        _ = session.spellTypes()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testPowersCatalogRequest() {
        let session = TestScryfallSession()
        session.powers() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/powers")

        _ = session.powers()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testToughnessesCatalogRequest() {
        let session = TestScryfallSession()
        session.toughnesses() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/toughnesses")

        _ = session.toughnesses()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testLoyaltiesCatalogRequest() {
        let session = TestScryfallSession()
        session.loyalties() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/loyalties")

        _ = session.loyalties()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testWatermarksCatalogRequest() {
        let session = TestScryfallSession()
        session.watermarks() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/watermarks")

        _ = session.watermarks()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testKeywordAbilitiesCatalogRequest() {
        let session = TestScryfallSession()
        session.keywordAbilities() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/keyword-abilities")

        _ = session.keywordAbilities()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testKeywordActionsCatalogRequest() {
        let session = TestScryfallSession()
        session.keywordActions() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/keyword-actions")

        _ = session.keywordActions()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testAbilityWordsCatalogRequest() {
        let session = TestScryfallSession()
        session.abilityWords() { _ in }
        let request = session.capturedRequest!
        let urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(urlComponents.scheme, "https")
        XCTAssertEqual(urlComponents.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents.path, "/catalog/ability-words")

        _ = session.abilityWords()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }


}
