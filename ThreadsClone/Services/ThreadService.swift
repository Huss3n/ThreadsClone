//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 13/03/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct ThreadService {
    
    // upload thread function
    static func uploadThread(_ thread: Thread) async throws {
        // encode the thread
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        
        // upload the thread to the threads collection
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
}
 
