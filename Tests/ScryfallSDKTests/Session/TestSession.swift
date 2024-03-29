//
//  TestSession.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import Combine
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

    override func requestPublisher<ResponseType: Decodable>(for request: URLRequest) -> AnyPublisher<ResponseType, Swift.Error> {
        capturedRequest = request
        return Empty<ResponseType, Swift.Error>().eraseToAnyPublisher()
    }
}
