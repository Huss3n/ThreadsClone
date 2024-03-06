//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 04/03/2024.
//

import Foundation

class LoginVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    
    @MainActor
    func loginUser() async throws {
        try await AuthService.shared.loginUser(withEmail: email, password: password)
    }
}
