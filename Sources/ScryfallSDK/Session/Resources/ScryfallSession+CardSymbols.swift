//
//  ScryfallSession+CardSymbols.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import Foundation

// Card Symbol related paths.
private extension Path {
    static let symbology = Path("/symbology")
    static let parseMana = Path("/symbology/parse-mana")
}

public extension ScryfallSession {

    func symbology(completion: @escaping (_ result: Result<List<CardSymbol>, Swift.Error>) -> Void) {
        let url = URL(path: .symbology)
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func parseMana(cost: String, completion: @escaping (_ result: Result<ParseManaResponse, Swift.Error>) -> Void) {
        let url = URL(path: .parseMana, query: ["cost": cost])
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

}
