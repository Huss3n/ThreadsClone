//
//  UserService.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 06/03/2024.
//

import Foundation
import Firebase
import FirebaseFirestore


class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapShot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapShot.data(as: User.self)
        self.currentUser = user
        
        print("DEBUG: user is \(user)")
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUID = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        return users.filter({ $0.id != currentUID })
    }
    
    func reset() {
        self.currentUser = nil
    }
}
