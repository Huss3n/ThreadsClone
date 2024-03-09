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
    
    @Published var selectedImage: PhotosPickerItem?
    @Published var image: Image?
    
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
       setUpSubscriber()
    }
    
    
    private func setUpSubscriber() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
     
}
