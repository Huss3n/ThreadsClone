//
//  UserRow.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            ProfileImageView(user: user)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fullName)
            }
            .font(.footnote)
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Follow")
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 1.0)
                    }
            })
        }
        .padding(.horizontal)
    }
}

struct UserRow_Preview: PreviewProvider {
    static var previews: some View {
        UserRow(user: dev.user)
    }
}
