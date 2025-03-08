//
//  CompleteSignUpView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct CompleteSignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var registerViewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12) {            
            Spacer()
            
            Text("Welcome to Social Network \(registerViewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Click the button below to complete registration and start using the Social Network app")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                        
            Button {
                Task {
                    try await registerViewModel.createUser()
                }
            } label: {
                Text("Complete Sign Up")
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
    CompleteSignUpView()
        .environmentObject(RegistrationViewModel())
}
