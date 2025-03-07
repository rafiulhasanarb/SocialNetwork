//
//  ProfileHeaderView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    
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
                Text(user.fullname)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(user.bio ?? "")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // Action button
            Button {
                
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 40)
                    .foregroundStyle(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            }
            
            Divider()
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileHeaderView(user: User.MockUser[0])
}
