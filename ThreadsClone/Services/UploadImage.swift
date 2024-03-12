//
//  UploadImage.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 12/03/2024.
//

import Foundation
import Firebase
import FirebaseStorage


struct UploadImage {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        // 1. compress the image quality
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        
        // 2. create a unique id for the image
        let filename = UUID().uuidString
        
        // 3. create a storage ref
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        // save the image to storage
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let imageURL = try await storageRef.downloadURL()
            return imageURL.absoluteString
        } catch {
            print("Error saving image to storage \(error.localizedDescription)")
            return nil
        }
    }
}
