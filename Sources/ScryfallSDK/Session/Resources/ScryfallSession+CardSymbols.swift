//
//  ScryfallSession+CardSymbols.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import Combine
import Foundation

// Card Symbol related paths.
private extension Path {
    static let symbology = Path("/symbology")
    static let parseMana = Path("/symbology/parse-mana")
}

public extension ScryfallSession {

    /// Returns a List of all Card Symbols.
    /// - Parameters:
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func symbology(completion: @escaping (_ result: Result<List<CardSymbol>, Swift.Error>) -> Void) {
        performRequest(symbologyRequest(), completion: completion)
    }

    /// Creates a publisher that requests a List of all Card Symbols.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func symbology() -> AnyPublisher<List<CardSymbol>, Swift.Error> {
        requestPublisher(for: symbologyRequest())
    }

    private func symbologyRequest() -> URLRequest {
        URLRequest(url: URL(path: .symbology), method: .get)
    }

    /// Parses the given mana cost parameter and returns Scryfall’s interpretation.
    ///
    /// The server understands most community shorthand for mana costs (such as 2WW for {2}{W}{W}).
    /// Symbols can also be out of order, lowercase, or have multiple colorless costs (such as 2{g}2 for {4}{G}).
    ///
    /// If part of the string could not be understood, the server will return an Error object describing the problem.
    /// 
    /// - Parameters:
    ///   - cost: The mana string to parse.
    ///   - completion: Completion handler called whent he request finishes.
    ///   - result: Result with the decoded fetched object or an error explaining what went wrong.
    func parseMana(
        cost: String,
        completion: @escaping (_ result: Result<Symbology.ParsedMana, Swift.Error>) -> Void
    ) {
        performRequest(parseManaRequest(cost: cost), completion: completion)
    }

    /// Creates a publisher that requests that parses the given mana cost parameter and returns Scryfall’s
    ///
    /// The server understands most community shorthand for mana costs (such as 2WW for {2}{W}{W}).
    /// Symbols can also be out of order, lowercase, or have multiple colorless costs (such as 2{g}2 for {4}{G}).
    ///
    /// If part of the string could not be understood, the server will return an Error object describing the problem.
    ///
    /// - Parameter cost: The mana string to parse.
    /// - Returns: Publisher that will emit the the decoded fetched object or a failure with the error explaining what went wrong.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func parseMana(cost: String) -> AnyPublisher<Symbology.ParsedMana, Swift.Error> {
        requestPublisher(for: parseManaRequest(cost: cost))
    }

    private func parseManaRequest(cost: String) -> URLRequest {
        URLRequest(url: URL(path: .parseMana, query: ["cost": cost]), method: .get)
    }

}
