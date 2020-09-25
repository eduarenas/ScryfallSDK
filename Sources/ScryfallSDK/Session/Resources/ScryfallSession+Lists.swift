//
//  ScryfallSession+Lists.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//
import Combine
import Foundation

public extension ScryfallSession {

    /// Fetch the next page for the list passed in as an argument, if any.
    /// - Parameters:
    ///   - list: An instance of `List` representing a data page.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result of fetching the data at the URL stored in `nextPageUrl` or an error describing what went wrong. The object will be `nil` if there's no next page.
    func nextPage<Object>(for list: List<Object>, completion: @escaping (_ result: Result<List<Object>?, Swift.Error>) -> Void) {
        guard let nextPageUrl = list.nextPage else {
            completion(.success(nil))
            return
        }
        performRequest(URLRequest(url: nextPageUrl, method: .get), completion: completion)
    }

    /// Creates a publisher to fetch the next page for the list passed in as an argument, if any.
    /// - Parameter list: An instance of `List` representing a data page.
    /// - Returns: Publisher that will emit the the decoded fetched object at `nextPageUrl` or a failure with the error explaining what went wrong. The object will emit `nil` if there's no next page.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func nextPage<Object>(for list: List<Object>) -> AnyPublisher<List<Object>?, Swift.Error> {
        guard let nextPageUrl = list.nextPage else {
            return Just<List<Object>?>(nil)
                .setFailureType(to: Swift.Error.self)
                .eraseToAnyPublisher()
        }
        return requestPublisher(for: URLRequest(url: nextPageUrl, method: .get))
    }
}

public extension List {

    /// Fetch the next page for the list, if any.
    /// - Parameters:
    ///   - session: An instance of `ScryfallSession` to use for performing the request. If omitted it will use  the default session.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result of fetching the data at the URL stored in `nextPageUrl` or an error describing what went wrong. The object will be `nil` if there's no next page.
    func nextPage(in session: ScryfallSession = .default, completion: @escaping (_ result: Result<List<Object>?, Swift.Error>) -> Void) {
        session.nextPage(for: self, completion: completion)
    }

    /// Creates a publisher to fetch the next page for the list, if any.
    /// - Parameter session: An instance of `ScryfallSession` to use for performing the request. If omitted it will use  the default session.
    /// - Returns: Publisher that will emit the the decoded fetched object at `nextPageUrl` or a failure with the error explaining what went wrong. The object will emit `nil` if there's no next page.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func nextPage(in session: ScryfallSession = .default) -> AnyPublisher<List<Object>?, Swift.Error> {
        session.nextPage(for: self)
    }
}
