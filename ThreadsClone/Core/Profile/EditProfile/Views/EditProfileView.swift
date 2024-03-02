//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 02/03/2024.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.gray.opacity(0.3))
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
                    
                }
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
            }
        }
    }
}

#Preview {
    EditProfileView()
}
