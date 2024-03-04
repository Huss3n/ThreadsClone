//
//  SettingsView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 04/03/2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var showLogout: Bool = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 14) {
                
                // Notifications
                HStack {
                    Image(systemName: "bell")
                    Text("Notifications")
                }
                
                // privacy
                HStack {
                    Image(systemName: "lock")
                    Text("Privacy")
                }
                
                // account
                HStack {
                    Image(systemName: "person")
                    Text("Account")
                }
                
                // help
                HStack {
                    Image(systemName: "questionmark.circle")
                    Text("Help")
                }
                
                // about
                HStack {
                    Image(systemName: "questionmark.circle")
                    Text("Help")
                }
                
                Divider()
                
                Text("Log Out")
                    .onTapGesture {
                        showLogout.toggle()
                    }
                
                
                Spacer()
                
                
            }
            .navigationTitle("Settings")
            .padding()
            .confirmationDialog("Logout", isPresented: $showLogout) {
                Button("Logout", role: .destructive) {
                    AuthService.shared.signOut()
                }
                
                Button("Cancel", role: .cancel, action: {})
            } message: {
                Text("Are you sure you want to logout?")
            }
        }
    }
}

#Preview {
    SettingsView()
}
