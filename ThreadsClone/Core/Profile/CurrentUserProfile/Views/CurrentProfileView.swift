//
//  CurrentProfileView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 07/03/2024.
//

import SwiftUI

struct CurrentProfileView: View {
    @StateObject private var profileVM = CurrentUserProfileVM()
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    @State private var showEditProfile: Bool = false
    
    
    private var tabBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 10
    }
    
    // computed property for the current user
    private var currentUser: User? {
        return profileVM.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 4) {
                    // bio and stats
                    VStack(spacing: 40) {
                        ProfileHeaderView(user: currentUser)
                    }
                    
                    // edit and share buttons
                    HStack {
                        Button(action: {
                            showEditProfile.toggle()
                        }, label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                                .frame(width: 352, height: 32)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay {
                                    Capsule()
                                        .stroke(Color.black, lineWidth: 0.5)
                                }
                        })

                    }
                    
                    // user content list view
                    UserContentListView()
                }
                .sheet(isPresented: $showEditProfile, content: {
                    EditProfileView()
                })
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CurrentProfileView()
}
