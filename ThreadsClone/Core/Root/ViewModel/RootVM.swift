//
//  RootVM.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 02/03/2024.
//

import Foundation
import Combine
import Firebase


class RootVM:ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpSubscribers()
    }
    
    private func setUpSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] receivedUserSession in
            self?.userSession = receivedUserSession
        }.store(in: &cancellables)
    }
}
