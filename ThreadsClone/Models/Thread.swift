//
//  Thread.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 13/03/2024.
//

import Firebase
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadID: String?
    let ownerUID: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadID ?? UUID().uuidString
    }
    
    var user: User?
}
