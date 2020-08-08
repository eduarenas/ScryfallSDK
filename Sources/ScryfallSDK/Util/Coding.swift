//
//  File.swift
//  
//
//  Created by Eduardo Arenas on 8/8/20.
//

import Foundation

extension JSONEncoder {

    static let scryfallEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
}

extension JSONDecoder {

    static let scryfallDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .custom { (decoder) in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            if let date = DateFormatter.iso8601.date(from: dateString) {
                return date
            } else if let date = DateFormatter.date.date(from: dateString) {
                return date
            }

            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Expected date string to be one of the formats \"yyyy'-'MM'-'dd'\" or \"yyyy-MM-dd'T'HH:mm:ssZZZZZ\""
            )
        }
        return decoder
    }()
}
