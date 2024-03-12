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
    @Published var uiImage: UIImage?
    
    func updateUserDate() async throws {
        try await uploadImage()
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedImage else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    
    private func uploadImage() async throws {
        guard let image = self.uiImage else { return }
        // call the upload image function and get the uploaded image url
        guard let imageURL = try? await UploadImage.uploadImage(image) else { return }
        
        // upload the image url to firebase
        try await UserService.shared.updateImageURl(withImageURL: imageURL)
    }
}
