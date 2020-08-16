//
//  DateFormatter.swift
//  
//
//  Created by Eduardo Arenas on 8/8/20.
//

import Foundation

extension DateFormatter {

    static var date: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
        return dateFormatter
    }()

    static var iso8601: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter
    }()
}
