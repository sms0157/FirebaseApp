//
//  NoteModel.swift
//  Notes
//
//  Created by Sabrina Summerfield on 4/14/24.
//

import Foundation
import FirebaseFirestoreSwift

struct NoteModel : Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var notecontents: String
}

