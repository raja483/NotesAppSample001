//
//  AddNewNoteView.swift
//  NoteBook
//
//  Created by Rajasekhar on 27/12/25.
//

import SwiftUI

struct AddNewNoteView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var name: String = ""
    @State var description: String = ""
    @State var status: String = ""

     var viewModel: ContentViewModel
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("Name")
                TextField("Enter Name of the Note", text: $name)
            }
            
            VStack(alignment: .leading) {
                Text("Description")
                TextEditor(text: $description)
                    .background(Color(.red))
                    .frame(height: 50)
            }
            
            VStack {
                HStack {
                    Text("Status")
                    Spacer()
                    Picker("", selection: $status) {
                        ForEach(["done", "inprogress"], id: \.self) { str in
                            Text(str)
                        }
                    }
                    
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Add Note")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    saveButtonDidClicked()
                }label: {
                  Text("Save")
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
        
        }
        .navigationBarBackButtonHidden()
    }
    
    func saveButtonDidClicked() {
        let note = Note(name: name, description: description, status: NoteStatus(rawValue: status) ?? .inprogress)
        viewModel.saveNote(note)
        dismiss()
    }
}

#Preview {
    NavigationStack{
        AddNewNoteView(viewModel: ContentViewModel())
    }
}
