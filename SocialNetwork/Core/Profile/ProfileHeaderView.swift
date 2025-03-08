//
//  ProfileHeaderView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @State private var showEditProfile: Bool = false
    let user: User
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStateView(value: 36, title: "Posts")
                    UserStateView(value: 52, title: "Followers")
                    UserStateView(value: 10, title: "Following")
                }
            }
            
            //Name and bio
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname ?? "")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(user.bio ?? "")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // Action button
            Button {
                if user.isCurrentUser {
                    print("show edit profile...")
                } else {
                    print("follow user...")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 40)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundStyle(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? Color.gray : .clear, lineWidth: 1)
                    }
            }
            
            Divider()
            
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MockUser[0])
}
