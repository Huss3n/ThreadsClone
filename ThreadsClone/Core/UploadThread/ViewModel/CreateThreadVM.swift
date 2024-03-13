//
//  CreateThreadVM.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 13/03/2024.
//

import Firebase
import FirebaseAuth

class CreateThreadVM: ObservableObject {
    
    @Published var caption = ""
    
    func uploadThread() async throws {
        // get the current user
        guard let ownerUID = Auth.auth().currentUser?.uid else { return }

        // create thread
        let thread = Thread(ownerUID: ownerUID, caption: caption, timestamp: Timestamp(), likes: 0)
        
        
        // upload thread
        try await ThreadService.uploadThread(thread)
    }
}
 
