//
//  Thread.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 13/03/2024.
//

import Firebase

struct Thread: Identifiable, Codable {
    let id: String
    let ownerUID: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var user: User?
}
