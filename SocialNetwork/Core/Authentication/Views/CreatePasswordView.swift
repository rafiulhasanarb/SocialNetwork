//
//  CreatePasswordView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct CreatePasswordView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var registerViewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Create Password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You will create a password that you will use to log in to your account.")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Password", text: $registerViewModel.password)
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .modifier(CustomTextFeildModifier())
            
            NavigationLink {
                CompleteSignUpView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    CreatePasswordView()
}
