//
//  Note.swift
//  NoteBook
//
//  Created by Rajasekhar on 27/12/25.
//

import Foundation

enum NoteStatus: String, Codable {
    case done
    case pendding
    case deleted
    case inprogress
}

struct Note: Identifiable, Codable {
    var id = UUID().uuidString
    let name: String
    let description: String
    let status: NoteStatus
}
