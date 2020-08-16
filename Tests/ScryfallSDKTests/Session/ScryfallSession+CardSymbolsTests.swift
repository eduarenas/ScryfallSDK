//
//  ScryfallSession+CardSymbolsTests.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import XCTest
@testable import ScryfallSDK

final class CardSymbolsRequestsTests: XCTestCase {

    func testSymbologyRequest() {
        let session = TestScryfallSession()
        session.symbology() { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/symbology")
    }

    func testParseManaRequest() {
        let session = TestScryfallSession()
        session.parseMana(cost: "RUx") { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/symbology/parse-mana")
        XCTAssertEqual(urlComponents?.queryItems?.count, 1)
        XCTAssertEqual(urlComponents?.queryItems?.first, URLQueryItem(name: "cost", value: "RUx"))
    }
}
