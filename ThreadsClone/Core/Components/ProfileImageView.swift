//
//  ProfileImageView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        Image("profile")
            .resizable()
//            .scaledToFill()
            .scaledToFit()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(Color.black, lineWidth: 1.0)
            }
    }
}

#Preview {
    ProfileImageView()
}
