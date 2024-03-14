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
                Task { try await feedVM.fetchThreads() }
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FeedView()
}
