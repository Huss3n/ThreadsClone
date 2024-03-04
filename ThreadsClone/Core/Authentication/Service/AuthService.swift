//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 02/03/2024.
//

import Foundation
import Firebase

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
            try await Auth.auth().signIn(withEmail: email, password: password)
        } catch {
            print("DEBUG: Failed to login user \(error.localizedDescription)")
        }
    }
    
    
    // MARK: Create User account
    @MainActor
    func createUser(withEmail email: String, password: String, username: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Successfully created user with uid \(result.user.uid)")
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
        } catch {
            print("DEBUG: Error logging out user \(error.localizedDescription)")
        }
    }
}