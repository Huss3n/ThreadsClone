//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 07/03/2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                // fullname and username
                Text(user?.fullName ?? "" )
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(user?.username ?? "" )
                    .font(.subheadline)
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.caption)
                }
                
                Text("10 followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            ProfileImageView(user: user)
            
        }
        .padding(.horizontal)
        .padding()
    }
}

struct ProfileHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        ProfileViews(user: dev.user)
    }
}
