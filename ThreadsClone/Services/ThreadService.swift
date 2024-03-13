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
    
    // fetch threads 
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timestamp", descending: true).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Thread.self )})
    }
}
 
