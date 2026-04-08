//
//  ContentView.swift
//  NoteBook
//
//  Created by Rajasekhar on 27/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contentViewModel.notes) { note in
                    VStack{
                        Text(note.name)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddNewNoteView(viewModel: contentViewModel)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
        .onAppear {
            contentViewModel.readSavedNotes()
        }
    }
}

#Preview {
    ContentView()
}
