//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 02/03/2024.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio: String = ""
    @State private var link: String = ""
    @State private var isPrivateProfile: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white.opacity(0.3))
                    .ignoresSafeArea(edges: [.bottom, .horizontal])
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("Hussein Aisak")
                        }
                        Spacer()
                        
                        
                        ProfileImageView()
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
                        
                        Button("cancel") {
                            //
                        }
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done") {
                            //
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

#Preview {
    EditProfileView()
}
