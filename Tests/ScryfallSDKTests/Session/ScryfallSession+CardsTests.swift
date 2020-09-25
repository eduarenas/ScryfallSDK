//
//  ScryfallSession+CardsTests.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import XCTest
@testable import ScryfallSDK

final class CardRequestsTests: XCTestCase {

    func testSearchRequestNoArgs() {
        let session = TestScryfallSession()
        session.search("nipper") { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/search")
        XCTAssertEqual(urlComponents?.queryItems?.count, 1)
        XCTAssertEqual(urlComponents?.queryItems?.first, URLQueryItem(name: "q", value: "nipper"))

        _ = session.search("nipper")
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testSearchRequestAllArgs() {
        let session = TestScryfallSession()
        session.search("nipper",
                       uniqueStrategy: .cards,
                       order: .name,
                       direction: .desc,
                       includeExtras: true,
                       includeMultilingual: false,
                       includeVariations: true,
                       page: 1) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/search")
        XCTAssertEqual(urlComponents?.queryItems?.count, 8)
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "q", value: "nipper")))
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "unique", value: "cards")))
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "order", value: "name")))
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "dir", value: "desc")))
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "include_extras", value: "true")))
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "include_multilingual", value: "false")))
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "include_variations", value: "true")))
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "page", value: "1")))

        _ = session.search("nipper",
                           uniqueStrategy: .cards,
                           order: .name,
                           direction: .desc,
                           includeExtras: true,
                           includeMultilingual: false,
                           includeVariations: true,
                           page: 1)
        let publisherRequest = session.capturedRequest
        let publisherUrlComponents = URLComponents(url: publisherRequest!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(publisherRequest?.httpMethod, "GET")
        XCTAssertEqual(publisherUrlComponents?.scheme, "https")
        XCTAssertEqual(publisherUrlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(publisherUrlComponents?.path, "/cards/search")
        XCTAssertEqual(publisherUrlComponents?.queryItems?.count, 8)
        XCTAssertTrue(publisherUrlComponents!.queryItems!.contains(URLQueryItem(name: "q", value: "nipper")))
        XCTAssertTrue(publisherUrlComponents!.queryItems!.contains(URLQueryItem(name: "unique", value: "cards")))
        XCTAssertTrue(publisherUrlComponents!.queryItems!.contains(URLQueryItem(name: "order", value: "name")))
        XCTAssertTrue(publisherUrlComponents!.queryItems!.contains(URLQueryItem(name: "dir", value: "desc")))
        XCTAssertTrue(publisherUrlComponents!.queryItems!.contains(URLQueryItem(name: "include_extras", value: "true")))
        XCTAssertTrue(publisherUrlComponents!.queryItems!.contains(URLQueryItem(name: "include_multilingual", value: "false")))
        XCTAssertTrue(publisherUrlComponents!.queryItems!.contains(URLQueryItem(name: "include_variations", value: "true")))
        XCTAssertTrue(publisherUrlComponents!.queryItems!.contains(URLQueryItem(name: "page", value: "1")))
    }

    func testCardByExactNameRequestNoSet() {
        let session = TestScryfallSession()
        session.card(exactName: "boot nipper") { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/named")
        XCTAssertEqual(urlComponents?.queryItems?.count, 1)
        XCTAssertEqual(urlComponents?.queryItems?.first, URLQueryItem(name: "exact", value: "boot nipper"))

        _ = session.card(exactName: "boot nipper")
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testCardByExactNameRequestWithSet() {
        let session = TestScryfallSession()
        session.card(exactName: "boot nipper", set: "IKO") { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/named")
        XCTAssertEqual(urlComponents?.queryItems?.count, 2)
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "exact", value: "boot nipper")))
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "set", value: "IKO")))

        _ = session.card(exactName: "boot nipper", set: "IKO")
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testCardByFuzzyNameNoSet() {
        let session = TestScryfallSession()
        session.card(fuzzyName: "boot nipper") { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/named")
        XCTAssertEqual(urlComponents?.queryItems?.count, 1)
        XCTAssertEqual(urlComponents?.queryItems?.first, URLQueryItem(name: "fuzzy", value: "boot nipper"))

        _ = session.card(fuzzyName: "boot nipper")
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testCardByFuzzyNameWithSet() {
        let session = TestScryfallSession()
        session.card(fuzzyName: "boot nipper", set: "IKO") { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/named")
        XCTAssertEqual(urlComponents?.queryItems?.count, 2)
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "fuzzy", value: "boot nipper")))
        XCTAssertTrue(urlComponents!.queryItems!.contains(URLQueryItem(name: "set", value: "IKO")))

        _ = session.card(fuzzyName: "boot nipper", set: "IKO")
        let publisherRequest = session.capturedRequest
        let publisherUrlComponents = URLComponents(url: publisherRequest!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(publisherRequest?.httpMethod, "GET")
        XCTAssertEqual(publisherUrlComponents?.scheme, "https")
        XCTAssertEqual(publisherUrlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(publisherUrlComponents?.path, "/cards/named")
        XCTAssertEqual(publisherUrlComponents?.queryItems?.count, 2)
        XCTAssertTrue(publisherUrlComponents!.queryItems!.contains(URLQueryItem(name: "fuzzy", value: "boot nipper")))
        XCTAssertTrue(publisherUrlComponents!.queryItems!.contains(URLQueryItem(name: "set", value: "IKO")))
    }

    func testCardAutocompleteRequest() {
        let session = TestScryfallSession()
        session.cardAutocomplete("boot") { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/autocomplete")
        XCTAssertEqual(urlComponents?.queryItems?.count, 1)
        XCTAssertEqual(urlComponents?.queryItems?.first, URLQueryItem(name: "q", value: "boot"))

        _ = session.cardAutocomplete("boot")
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testRandomCardRequestNoQuery() {
        let session = TestScryfallSession()
        session.randomCard() { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/random")
        XCTAssertEqual(urlComponents?.queryItems?.count, 0)

        _ = session.randomCard()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testRandomCardRequestWithQuery() {
        let session = TestScryfallSession()
        session.randomCard(query: "cancel") { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/random")
        XCTAssertEqual(urlComponents?.queryItems?.count, 1)
        XCTAssertEqual(urlComponents?.queryItems?.first, URLQueryItem(name: "q", value: "cancel"))

        _ = session.randomCard(query: "cancel")
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testCardCollectionRequest() throws {
        let session = TestScryfallSession()
        session.cardCollection(identifiers: [
            .id(UUID(uuidString: "89923289-0f62-444e-a781-d9948f32eedd")!),
            .mtgoId(10),
            .multiverseId(20),
            .oracleId(UUID(uuidString: "683a5707-cddb-494d-9b41-51b4584ded69")!),
            .illustrationId(UUID(uuidString: "1311e0dd-56ba-40af-b173-b06915182001")!),
            .name("Boot Nipper"),
            .nameAndSet(name: "Ancient Tomb", set: "uma"),
            .collectorNumberAndSet(collectorNumber: "150", set: "mrd")

        ]) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "POST")
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Content-Type"), "application/json")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/collection")
        let bodyDict = try JSONSerialization.jsonObject(with: request!.httpBody!, options: []) as! [String: [[String: AnyHashable]]]
        XCTAssertEqual(bodyDict.count, 1)
        XCTAssertEqual(bodyDict["identifiers"]!.count, 8)
        XCTAssertTrue(bodyDict["identifiers"]!.contains(["id": "89923289-0F62-444E-A781-D9948F32EEDD"]))
        XCTAssertTrue(bodyDict["identifiers"]!.contains(["mtgo_id": 10]))
        XCTAssertTrue(bodyDict["identifiers"]!.contains(["multiverse_id": 20]))
        XCTAssertTrue(bodyDict["identifiers"]!.contains(["oracle_id": "683A5707-CDDB-494D-9B41-51B4584DED69"]))
        XCTAssertTrue(bodyDict["identifiers"]!.contains(["illustration_id": "1311E0DD-56BA-40AF-B173-B06915182001"]))
        XCTAssertTrue(bodyDict["identifiers"]!.contains(["name": "Boot Nipper"]))
        XCTAssertTrue(bodyDict["identifiers"]!.contains(["name": "Ancient Tomb", "set": "uma" ]))
        XCTAssertTrue(bodyDict["identifiers"]!.contains(["collector_number": "150", "set": "mrd" ]))

        _ = session.cardCollection(identifiers: [
            .id(UUID(uuidString: "89923289-0f62-444e-a781-d9948f32eedd")!),
            .mtgoId(10),
            .multiverseId(20),
            .oracleId(UUID(uuidString: "683a5707-cddb-494d-9b41-51b4584ded69")!),
            .illustrationId(UUID(uuidString: "1311e0dd-56ba-40af-b173-b06915182001")!),
            .name("Boot Nipper"),
            .nameAndSet(name: "Ancient Tomb", set: "uma"),
            .collectorNumberAndSet(collectorNumber: "150", set: "mrd")

        ])
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testCardByCodeAndNumberRequestNoLanguage() {
        let session = TestScryfallSession()
        session.card(code: "iko", number: "076") { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/iko/076")

        _ = session.card(code: "iko", number: "076")
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testCardByCodeAndNumberRequestWithLanguage() {
        let session = TestScryfallSession()
        session.card(code: "iko", number: "076", lang: .es) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/iko/076/es")

        _ = session.card(code: "iko", number: "076", lang: .es)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testCardByMultiverseIdRequest() {
        let session = TestScryfallSession()
        session.card(multiverseId: 479596) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/multiverse/479596")

        _ = session.card(multiverseId: 479596)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testCardByMtgoIdRequest() {
        let session = TestScryfallSession()
        session.card(mtgoId: 80161) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/mtgo/80161")

        _ = session.card(mtgoId: 80161)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testCardByArenaIdRequest() {
        let session = TestScryfallSession()
        session.card(arenaId: 71143) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/arena/71143")

        _ = session.card(arenaId: 71143)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testCardByTCGplayerIdRequest() {
        let session = TestScryfallSession()
        session.card(tcgPlayerId: 212705) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/tcgplayer/212705")

        _ = session.card(tcgPlayerId: 212705)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testCardByIdRequest() {
        let session = TestScryfallSession()
        session.card(id: UUID(uuidString: "cff5a5b8-f823-4429-acd8-c4f34a676cb4")!) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/CFF5A5B8-F823-4429-ACD8-C4F34A676CB4")

        _ = session.card(id: UUID(uuidString: "cff5a5b8-f823-4429-acd8-c4f34a676cb4")!)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }
}
