//
//  File.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import XCTest
@testable import ScryfallSDK

final class SetRequestsTests: XCTestCase {

    func testSetsRequest() {
        let session = TestScryfallSession()
        session.sets(completion: { _ in })
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/sets")
    }

    func testSetByCodeRequest() {
        let session = TestScryfallSession()
        session.set(code: "mmq", completion: { _ in })
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/sets/mmq")
    }

    func testSetByTCGplayerIdCodeRequest() {
        let session = TestScryfallSession()
        session.set(tcgplayerId: 1909, completion: { _ in })
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents?.path, "/sets/tcgplayer/1909")
    }

    func testSetByIdCodeRequest() {
        let session = TestScryfallSession()
        session.set(id: UUID(uuidString: "2ec77b94-6d47-4891-a480-5d0b4e5c9372")!, completion: { _ in })
        let request = session.capturedRequest
        let urlComponents = URLComponents(url: request!.url!, resolvingAgainstBaseURL: false)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(urlComponents?.scheme, "https")
        XCTAssertEqual(urlComponents?.host, "api.scryfall.com")
        XCTAssertEqual(urlComponents!.path, "/sets/2EC77B94-6D47-4891-A480-5D0B4E5C9372")
    }
}
