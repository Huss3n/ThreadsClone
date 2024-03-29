//
//  ProfileVM.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 07/03/2024.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI


class CurrentUserProfileVM: ObservableObject {
    @Published var currentUser: User?
 
    var cancellables = Set<AnyCancellable>()
    
    init() {
       setUpSubscriber()
    }
    
    
    private func setUpSubscriber() {
        UserService.shared.$currentUser.sink { [weak self] user in
            DispatchQueue.main.async {
                self?.currentUser = user
            }
        }.store(in: &cancellables)
    }
    

}
