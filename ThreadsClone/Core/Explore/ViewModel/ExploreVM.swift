//
//  ExploreVM.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 07/03/2024.
//

import Foundation

class ExploreVM: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
