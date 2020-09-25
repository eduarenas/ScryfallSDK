//
//  ScryfallSession+SetsTests.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import XCTest
@testable import ScryfallSDK

final class SetRequestsTests: XCTestCase {

    func testSetsRequest() {
        let session = TestScryfallSession()
        session.sets() { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/sets")

        _ = session.sets()
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testSetByCodeRequest() {
        let session = TestScryfallSession()
        session.set(code: "mmq") { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/sets/mmq")

        _ = session.set(code: "mmq")
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testSetByTCGplayerIdCodeRequest() {
        let session = TestScryfallSession()
        session.set(tcgplayerId: 1909) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/sets/tcgplayer/1909")

        _ = session.set(tcgplayerId: 1909)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }

    func testSetByIdCodeRequest() {
        let session = TestScryfallSession()
        session.set(id: UUID(uuidString: "2ec77b94-6d47-4891-a480-5d0b4e5c9372")!) { _ in }
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents!.path, "/sets/2EC77B94-6D47-4891-A480-5D0B4E5C9372")

        _ = session.set(id: UUID(uuidString: "2ec77b94-6d47-4891-a480-5d0b4e5c9372")!)
        let publisherRequest = session.capturedRequest
        XCTAssertEqual(request, publisherRequest)
    }
}
