//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationVM()
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter email", text: $viewModel.email)
                    .modifier(ThreadsFieldModifier())
                    .textInputAutocapitalization(.never)
                
                SecureField("Enter password", text: $viewModel.password)
                    .modifier(ThreadsFieldModifier())
                
                TextField("Enter full name", text: $viewModel.fullName)
                    .modifier(ThreadsFieldModifier())
                
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(ThreadsFieldModifier())
                    .textInputAutocapitalization(.none)
            }
        
            Button(action: {
                Task {
                    try await viewModel.createUserAccount()
                }
            }, label: {
                Text("Sign up")
                    .modifier(AuthButtonModifiers())
            })
            .padding(.top)
            
            Spacer()
            Spacer()
            
            Divider()
            
            Button(action: {
                dismiss()
            }, label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundStyle(.black)
            })
        }
    }
}

#Preview {
    RegistrationView()
}
