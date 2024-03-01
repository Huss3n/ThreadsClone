//
//  ProfileImageView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        Image(systemName: "person")
//            .resizable()
//            .scaledToFill()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .overlay {
                Circle()
                    .stroke(Color.black, lineWidth: 1.0)
            }
    }
}

#Preview {
    ProfileImageView()
}
