//
//  TestSession.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import Foundation
@testable import ScryfallSDK

class TestScryfallSession: ScryfallSession {

    var capturedRequest: URLRequest?

    override func performRequest<ResponseType: Decodable>(
        _ request: URLRequest,
        completion: @escaping (_ result: Result<ResponseType, Swift.Error>) -> Void
    ) {
        capturedRequest = request
    }
}
