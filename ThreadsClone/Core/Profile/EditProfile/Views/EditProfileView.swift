//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 02/03/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @StateObject private var editVM = EditProfileVM()
    
    @State private var bio: String = ""
    @State private var link: String = ""
    @State private var isPrivateProfile: Bool = false
    @Environment(\.dismiss) var dismiss
    
    let user: User
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.gray.opacity(0.15))
                    .ignoresSafeArea(edges: [.bottom, .horizontal])
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text(user.fullName)
                        }
                        Spacer()

                        PhotosPicker(selection: $editVM.selectedImage) {
                            if let image = editVM.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            }else {
                                ProfileImageView(user: user)
                            }
                        }
                    }
                    
                    Divider()
                    
                    // bio
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio", text: $bio)
                        
                    }
                    .font(.footnote)
                    
                    Divider()
                    
                    // link
                    VStack(alignment: .leading) {
                        Text("Link")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        TextField("Add Link", text: $link)
                        
                    }
                    .font(.footnote)
                    
                    Divider()
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                    
                }
                .padding()
                .navigationTitle("Edit Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        
                        Button("Cancel") {
                            dismiss()
                        }
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done") {
                            Task { try await editVM.updateUserDate() }
                            dismiss()
                        }
                        .font(.subheadline)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                    }
                }
                .background(Color(.systemGray5))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1.0)
                }
                .padding()
                
            }
        }
    }
}

struct EditProfileView_Preview: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: dev.user)
    }
}
