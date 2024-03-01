//
//  FeedViwe.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<10) { _ in
                        ThreadRow()
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
