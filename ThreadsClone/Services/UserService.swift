//
//  UserService.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 06/03/2024.
//

import Foundation
import Firebase


class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
    }
}
