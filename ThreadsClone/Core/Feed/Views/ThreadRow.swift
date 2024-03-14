//
//  ThreadRow.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct ThreadRow: View {
    let thread: Thread
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                ProfileImageView(user: thread.user)
                
                VStack(alignment: .leading) {
                    Text(thread.user?.username ?? "No name")
                        .fontWeight(.semibold)
                    
                    Text(thread.caption)
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
                
                Text(thread.timestamp.timestampString())
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

struct ThreadRow_Preview: PreviewProvider {
    static var previews: some View {
        ThreadRow(thread: dev.thread)
    }
}
