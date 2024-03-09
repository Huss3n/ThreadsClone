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
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage: Image?
    
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
       setUpSubscriber()
    }
    
    
    private func setUpSubscriber() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
    private func loadImage() async {
        guard let item = selectedImage else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
