//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 07/03/2024.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    
    private var tabBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 10
    }
    
    var body: some View {
        // user content list view
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases){ filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width: tabBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation )
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: tabBarWidth, height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            
            LazyVStack {
                ForEach(0..<20){ _ in
                    ThreadRow()
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView()
}
