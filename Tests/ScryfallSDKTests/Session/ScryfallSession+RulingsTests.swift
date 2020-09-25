//
//  ScryfallSession+RulingsTests.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import XCTest
@testable import ScryfallSDK

final class RulingsRequestsTests: XCTestCase {

    func testRulingsByMultiverseIdRequest() {
        let session = TestScryfallSession()
        session.rulings(multiverseId: 479596) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/multiverse/479596/rulings")

        _ = session.rulings(multiverseId: 479596)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testRulingsByMtgoIdRequest() {
        let session = TestScryfallSession()
        session.rulings(mtgoId: 80161) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/mtgo/80161/rulings")

        _ = session.rulings(mtgoId: 80161)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testRulingsByArenaIdRequest() {
        let session = TestScryfallSession()
        session.rulings(arenaId: 71143) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/arena/71143/rulings")

        _ = session.rulings(arenaId: 71143)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testRulingsByCodeAndNumberRequestNoLanguage() {
        let session = TestScryfallSession()
        session.rulings(code: "iko", number: "076") { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/iko/076/rulings")

        _ = session.rulings(code: "iko", number: "076")
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testRulingsByIdRequest() {
        let session = TestScryfallSession()
        session.rulings(id: UUID(uuidString: "cff5a5b8-f823-4429-acd8-c4f34a676cb4")!) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/cards/CFF5A5B8-F823-4429-ACD8-C4F34A676CB4/rulings")

        _ = session.rulings(id: UUID(uuidString: "cff5a5b8-f823-4429-acd8-c4f34a676cb4")!)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }
}
