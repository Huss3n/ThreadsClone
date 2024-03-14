//
//  UserContentVM.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 14/03/2024.
//

import Foundation

class UserContentVM: ObservableObject {
    @Published var threads: [Thread] = []
    
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        self.threads = try await ThreadService.fetchUserThreads(uid: user.id)
    }
}
