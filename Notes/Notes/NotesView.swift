//
//  ContentView.swift
//  Notes
//
//  Created by Sabrina Summerfield on 4/14/24.
//

import SwiftUI

struct NotesView: View {
    
    @ObservedObject var notesApp = NoteViewModel()
    @State var notes = NoteModel(title: "", notecontents: "")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($notesApp.notes) { $notes in
                    NavigationLink {
                        NoteDetail(notes: $notes)
                    } label: {
                        Text(notes.title)
                    }
                }
                Section {
                    NavigationLink {
                        NoteDetail(notes: $notes)
                    } label: {
                        Text("New note")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                    }
                }
            }
            .onAppear {
                notesApp.fetchData()
            }
            .refreshable {
                notesApp.fetchData()
            }
            
            
        }
    }
}
struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
