//
//  UploadView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct CreateThread: View {
    @StateObject private var createVM = CreateThreadVM()

    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    var body: some View {
        NavigationStack {
            VStack{
                
                HStack(alignment: .top) {
                    ProfileImageView(user: user)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.fullName ?? "No name")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread", text: $createVM.caption)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !createVM.caption.isEmpty {
                        Button(action: {
                            createVM.caption = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        })
                    }
                }
                
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        Task {
                            try await createVM.uploadThread()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                    .opacity(createVM.caption.isEmpty ? 0.5 : 1.0)
                    .disabled(createVM.caption.isEmpty)
                }
            }
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CreateThread()
}
