//
//  NoteDetail.swift
//  Notes
//
//  Created by Sabrina Summerfield on 4/14/24.
//
import SwiftUI

struct NoteDetail: View {
    
    @Binding var notes : NoteModel
    @ObservedObject var notesApp = NoteViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Note Title", text: $notes.title)
                .font(.system(size: 25))
                .fontWeight(.bold)
            TextEditor(text: $notes.notecontents)
                .font(.system(size: 20))
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    notesApp.saveData(notes: notes)
                    notes.title = notes.title
                    notes.notecontents = notes.notecontents
                } label: {
                    Text("Save")
                }

            }
        }
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetail(notes: .constant(NoteModel(title: "first", notecontents: "first note")))
    }
}
