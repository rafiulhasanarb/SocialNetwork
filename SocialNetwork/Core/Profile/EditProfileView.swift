//
//  EditProfileView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/8/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                PhotosPicker(selection: $viewModel.selectedImage) {
                    VStack {
                        if let selectedImage = viewModel.profileImage {
                            selectedImage
                                .resizable()
                                .foregroundStyle(.white)
                                .background(.gray)
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)                            
                        } else {
                            Image(systemName: "person")
                                .resizable()
                                .scaledToFill()
                                .foregroundStyle(.white)
                                .background(.gray)
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                        }
                        
                        Text("Change Profile Picture")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Divider()
                    }
                }
                .padding(.vertical, 8)
            }
            
            // edit profile
            VStack {
                EditProfileRowView(title: "Full Name", placeholder: "Enter your full name", text: $viewModel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio", text: $viewModel.bio)
            }
            
            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.MockUser[0])
}
