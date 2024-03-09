//
//  EditProfileVM.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 09/03/2024.
//

import Foundation
import PhotosUI
import SwiftUI


class EditProfileVM: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage: Image?
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedImage else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
    
}
