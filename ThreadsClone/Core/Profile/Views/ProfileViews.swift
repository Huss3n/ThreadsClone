//
//  ProfileViews.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct ProfileViews: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 4) {
                // bio and stats
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            // fullname and username
                            Text("Muktar Hussein")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("hussein_aisak")
                                .font(.subheadline)
                            
                            Text("iOS Developer exploring the tech world")
                                .font(.caption)
                            
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
                
                
            }
        }
    }
}

#Preview {
    ProfileViews()
}
