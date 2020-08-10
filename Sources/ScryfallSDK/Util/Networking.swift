//
//  Networking.swift
//  
//
//  Created by Eduardo Arenas on 8/10/20.
//

import Foundation

/// Possible HTTP methods. At the moment Scryfall only supports `GET` and `POST` requests.
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
