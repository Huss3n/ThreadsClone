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
    
    static func fetchUser(withUID uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    func reset() {
        self.currentUser  = nil
    }
    
    @MainActor
    func updateImageURl(withImageURL imageURL: String) async throws {
        // get current user
        guard let currentUID = Auth.auth().currentUser?.uid else { return }
        
        // fetch the data based on this user uid
        try await Firestore.firestore().collection("users").document(currentUID).updateData([
            "profileImageURL": imageURL
        ])
        // update the url locally too
        self.currentUser?.profileImageURL = imageURL
    }
}
