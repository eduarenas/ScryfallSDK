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
    }

}
