//
//  Entry.swift
//  Journal
//
//  Created by Jackson Barnes on 9/9/21.
//

import Foundation
class Entry: Codable{
    var title: String
    var contents: String
    var timestamp: Date
    
    init(title: String, contents: String, timestamp: Date = Date()) {
        self.title = title
        self.contents = contents
        self.timestamp = timestamp
    }
}


extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title &&
            lhs.contents == rhs.contents &&
            lhs.timestamp == rhs.timestamp
    }
}
