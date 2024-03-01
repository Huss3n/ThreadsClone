//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullName: String = ""
    @State private var username: String = ""
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
                TextField("Enter email", text: $email)
                    .modifier(ThreadsFieldModifier())
                    
                
                SecureField("Enter password", text: $password)
                    .modifier(ThreadsFieldModifier())
                
                TextField("Enter full name", text: $fullName)
                    .modifier(ThreadsFieldModifier())
                
                TextField("Enter your username", text: $username)
                    .modifier(ThreadsFieldModifier())
            }
        
            Button(action: {
                
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
