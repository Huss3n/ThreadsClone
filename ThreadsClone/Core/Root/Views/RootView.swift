//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 29/02/2024.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel = RootVM()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    RootView()
}
