//
//  FeedVM.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 13/03/2024.
//

import Foundation


@MainActor
class FeedVM: ObservableObject {
    @Published var threads: [Thread] = []
    
    init() {
        Task {
            try await  fetchThreads()
        }
    }
    
    
    // fetch threads
    @MainActor
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserData()
    }
    
     
    func fetchUserData() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUID = thread.ownerUID
            
            let threadUser = try await UserService.fetchUser(withUID: ownerUID)
            
            threads[i].user = threadUser
        }
    }
     
}
