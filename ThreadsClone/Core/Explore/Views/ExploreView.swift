//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct ExploreView: View {
    @StateObject private var exploreVM = ExploreVM()
    
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(exploreVM.users){ user in
                        NavigationLink(value: user) {
                            VStack {
                                UserRow(user: user)
                            }
                            .padding(.vertical, 4)
                            Divider()
                        }
                        .tint(.black)
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileViews(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    ExploreView()
}
