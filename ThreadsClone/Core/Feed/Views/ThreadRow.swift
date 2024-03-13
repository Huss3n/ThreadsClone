//
//  ThreadRow.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct ThreadRow: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                ProfileImageView(user: nil)
                
                VStack(alignment: .leading) {
                    Text("Hussein Aisak")
                        .fontWeight(.semibold)
                    
                    Text("Happy coding. Loving SwiftUI")
                        .font(.footnote)
                    
                    HStack(spacing: 12) {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "heart")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "bubble.right")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "arrow.rectanglepath")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "paperplane")
                        })
                    }
                    .foregroundStyle(.black)
                    .padding(.vertical, 8)
                }
                
                Spacer()
                
                Text("10m")
                    .font(.caption)
                    .foregroundStyle(Color(.systemGray3))
                
                Button(action: {}, label: {
                    Image(systemName: "ellipsis")
                        .foregroundStyle(Color(.darkGray))
                })
                
            }
            .padding(.leading)
            
            Divider()
        }
        .padding(4)
    }
}

#Preview {
    ThreadRow()
}
