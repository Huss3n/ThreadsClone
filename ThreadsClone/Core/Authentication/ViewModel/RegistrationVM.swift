//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 02/03/2024.
//

import Foundation

class RegistrationVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var username: String = ""
    @Published var fullName: String = ""
    
    
    @MainActor
    func createUserAccount() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, username: username, fullName: fullName)
    }
}
