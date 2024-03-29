//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 02/03/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    static let shared = AuthService()
    
    // keeping track of the user session - state
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    
    // MARK: Login User
    @MainActor
    func loginUser(withEmail email: String, password: String) async throws {
        do {
            let loginResult = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = loginResult.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to login user \(error.localizedDescription)")
        }
    }
    
    
    // MARK: Create User account
    @MainActor
    func createUser(withEmail email: String, password: String, username: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(id: result.user.uid, withEmail: email, username: username, fullName: fullName)
        } catch {
            print("DEBUG: Error creating user account: \(error.localizedDescription)")
        }
    }
    
    // MARK: Logout User
    @MainActor
    func signOut() {
        do {
            try Auth.auth().signOut() // <- signs us out in backend
            
            // set the user session to nil
            self.userSession = nil // <- removes session locally and updated routing
            UserService.shared.reset() // <- remove current user
            
        } catch {
            print("DEBUG: Error logging out user \(error.localizedDescription)")
        }
    }
    
    @MainActor
    private func uploadUserData(
        id: String,
        withEmail email: String,
        username: String,
        fullName: String)
    async throws
    {
        let user = User(id: id, fullName: fullName, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
