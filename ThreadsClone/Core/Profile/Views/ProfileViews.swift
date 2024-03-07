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

    var body: some View {
        ScrollView {
            VStack(spacing: 4) {
                // bio and stats
                VStack(spacing: 40) {
                    ProfileHeaderView(user: user)
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

struct ProfileView_Preview: PreviewProvider {
    static var previews: some View {
        ProfileViews(user: dev.user)
    }
}
