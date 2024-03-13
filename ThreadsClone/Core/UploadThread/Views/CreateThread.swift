//
//  UploadView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct CreateThread: View {
    @State private var thread: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack{
                
                HStack(alignment: .top) {
                    ProfileImageView(user: nil)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Hussein Aisak")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread", text: $thread)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !thread.isEmpty {
                        Button(action: {
                            thread = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        })
                    }
                }
                
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        //
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                    .opacity(thread.isEmpty ? 0.5 : 1.0)
                    .disabled(thread.isEmpty)
                }
            }
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CreateThread()
}
