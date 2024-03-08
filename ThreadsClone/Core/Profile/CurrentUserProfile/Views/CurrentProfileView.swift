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
                            
                        }, label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                                .frame(width: UIScreen.main.bounds.width / 2, height: 32)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay {
                                    Capsule()
                                        .stroke(Color.black, lineWidth: 1.0)
                                }
                        })
                        
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Share Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                                .frame(width: UIScreen.main.bounds.width / 2, height: 32)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay {
                                    Capsule()
                                        .stroke(Color.black, lineWidth: 1.0)
                                }
                        })
                    }
                    .padding()
                    
                    // user content list view
                    UserContentListView()
                }
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
        }
    }
}

#Preview {
    CurrentProfileView()
}
