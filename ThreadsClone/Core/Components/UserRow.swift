//
//  UserRow.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct UserRow: View {
    var body: some View {
        HStack {
         ProfileImageView()
            
            VStack(alignment: .leading) {
                Text("husseinaisak")
                    .fontWeight(.semibold)
                Text("Hussein Aisak")
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

#Preview {
    UserRow()
}
