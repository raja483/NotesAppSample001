//
//  ContentViewModel.swift
//  NoteBook
//
//  Created by Rajasekhar on 27/12/25.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var notes: [Note] = []
    func saveNote(_ note: Note) {
        notes.append(note)
        do {
            let data = try JSONEncoder().encode(notes)
            let noteStr = String(data: data, encoding: .utf8)
            UserDefaults.standard.set(noteStr, forKey: "SavedNotes")
        }
        catch {
            
        }
    }
    func readSavedNotes() {
        do {
            if let noteStr = UserDefaults.standard.string(forKey: "SavedNotes") {
                let data = noteStr.data(using: .utf8)!
                notes = try JSONDecoder().decode([Note].self, from: data)
            }
        }
        catch {
            
        }
    }
}
