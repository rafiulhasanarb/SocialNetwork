//
//  LoginView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // logo image
                Image("insta-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.top, 30)
                
                //text fields
                VStack {
                    TextField("Enter your email", text: $loginViewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .modifier(CustomTextFeildModifier())
                    
                    SecureField("Enter your password", text: $loginViewModel.password)
                        .modifier(CustomTextFeildModifier())
                }
                
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                Button {
                    Task {
                        try await loginViewModel.signIn()
                    }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 44, alignment: .center)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.vertical)
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                    Text("or")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                }
                .foregroundStyle(.gray)
                
                HStack {
                    Image(systemName: "applelogo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with Apple")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                NavigationLink(destination: AddEmailView().navigationBarBackButtonHidden(true)) {
                    HStack {
                        Text("Don't have an account?")
                        
                        Text(" Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
