//
//  ProfileImageView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct ProfileImageView: View {
    var user: User?
    
    var body: some View {
        if let image = user?.profileImageURL {
            
        }else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    ProfileImageView()
}
