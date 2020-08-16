//
//  ScryfallSession+Lists.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Foundation

public extension ScryfallSession {

    /// Fetch the next page for the list passed in as an argument, if any.
    /// - Parameters:
    ///   - list: An instance of `List` representing a data page.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result of fetching the data at the URL stored in `nextPageUrl` or an errr describing what wen wrong. The object will be `nil` if there's no next page.
    func nextPage<Object>(for list: List<Object>, completion: @escaping (_ result: Result<List<Object>?, Swift.Error>) -> Void) {
        guard let nextPageUrl = list.nextPage else {
            completion(.success(nil))
            return
        }
        let request = URLRequest(url: nextPageUrl, method: .get)
        performRequest(request, completion: completion)
    }
}

public extension List {

    /// Fetch the next page for the list, if any.
    /// - Parameters:
    ///   - session: An instance of `ScryfallSession` to use for performing the request. If omitted it will use  the default session.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result of fetching the data at the URL stored in `nextPageUrl` or an errr describing what wen wrong. The object will be `nil` if there's no next page.
    func nextPage(in session: ScryfallSession = .default, completion: @escaping (_ result: Result<List<Object>?, Swift.Error>) -> Void) {
        session.nextPage(for: self, completion: completion)
    }
}
