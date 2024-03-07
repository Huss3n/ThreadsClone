//
//  ProfileViews.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct ProfileViews: View {
    // dependency injection
    let user: User
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    
    private var tabBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 10
    }
    
    var body: some View {
        
            ScrollView {
                VStack(spacing: 4) {
                    // bio and stats
                    VStack(spacing: 40) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 12) {
                                // fullname and username
                                Text(user.fullName)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(user.username)
                                    .font(.subheadline)
                                
                                if let bio = user.bio {
                                    Text(bio)
                                        .font(.caption)
                                }
                                
                                Text("10 followers")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                            ProfileImageView()
                            
                        }
                        .padding(.horizontal)
                    }
                    
                    // edit and share buttons
                    HStack {
                        Button(action: {}, label: {
                            Text("Follow")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: 352, height: 32)
                                .background(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        })
                    }
                    
                    // user content list view
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases){ filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundStyle(.black)
                                            .frame(width: tabBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation )
                                    } else {
                                        Rectangle()
                                            .foregroundStyle(.clear)
                                            .frame(width: tabBarWidth, height: 1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring) {
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                        
                        LazyVStack {
                            ForEach(0..<20){ _ in
                                ThreadRow()
                            }
                        }
                    }
                    .padding(.vertical, 8)
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

struct ProfileView_Preview: PreviewProvider {
    static var previews: some View {
        ProfileViews(user: dev.user)
    }
}
