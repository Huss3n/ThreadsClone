//
//  FeedViwe.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject private var feedVM = FeedVM()

    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(feedVM.threads) { thread in
                        ThreadRow(thread: thread)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .refreshable {
                print("Refresh threads")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundStyle(.black)
                    })
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
