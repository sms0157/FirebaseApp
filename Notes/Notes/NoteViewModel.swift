//
//  NoteViewModel.swift
//  Notes
//
//  Created by Sabrina Summerfield on 4/14/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class NoteViewModel : ObservableObject {
    
    @Published var notes = [NoteModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        self.notes.removeAll()
        db.collection("notes")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.notes.append(try document.data(as: NoteModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        
    }
    
    func saveData(notes: NoteModel) {
        
        if let id = notes.id {
           
                let docRef = db.collection("notes").document(id)
                
                docRef.updateData([
                    "title": notes.title,
                    "notecontents" : notes.notecontents
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
    
        } else {
            
                var ref: DocumentReference? = nil
                ref = db.collection("notes").addDocument(data: [
                    "title": notes.title,
                    "notecontents": notes.notecontents
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
        }
        
    }

