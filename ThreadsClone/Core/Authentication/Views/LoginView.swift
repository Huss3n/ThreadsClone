//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 29/02/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("threads-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack {
                    TextField("Enter your email", text: $email)
                        .modifier(ThreadsFieldModifier())
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(ThreadsFieldModifier())
                }
               
                
                NavigationLink {
                    Text("Forgot password")
                    
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Login")
                        .modifier(AuthButtonModifiers())
                })
                .padding(.top)
                
                Spacer()
                

                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundStyle(.black)
                    
                }
                .padding(.vertical, 16)

            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
