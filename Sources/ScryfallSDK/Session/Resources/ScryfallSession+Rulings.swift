//
//  ScryfallSession+Rulings.swift
//  
//
//  Created by Eduardo Arenas on 8/16/20.
//

import Foundation

// Card related rulings.
private extension Path {
    static let rulingsByMultiverseId = { (id: Int) in Path("/cards/multiverse/\(id)/rulings") }
    static let rulingsByMtgoId = { (id: Int) in Path("/cards/mtgo/\(id)/rulings") }
    static let rulingsByArenaId = { (id: Int) in Path("/cards/arena/\(id)/rulings") }
    static let rulingsByCodeAndNumber = { (code: String, number: String) in Path("/cards/\(code)/\(number)/rulings") }
    static let rulingsById = { (id: UUID) in Path("/cards/\(id)/rulings") }
}

public extension ScryfallSession {

    func rulings(multiverseId: Int, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        let url = URL(path: .rulingsByMultiverseId(multiverseId))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func rulings(mtgoId: Int, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        let url = URL(path: .rulingsByMtgoId(mtgoId))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func rulings(arenaId: Int, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        let url = URL(path: .rulingsByArenaId(arenaId))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func rulings(code: String, number: String, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        let url = URL(path: .rulingsByCodeAndNumber(code, number))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }

    func rulings(id: UUID, completion: @escaping (_ result: Result<List<Ruling>, Swift.Error>) -> Void) {
        let url = URL(path: .rulingsById(id))
        let request = URLRequest(url: url, method: .get)
        performRequest(request, completion: completion)
    }
}

