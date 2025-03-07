//
//  CurrentUserProfileView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    var user: User
    var posts: [Post] {
        return Post.MockPost.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // post grid view
                PostGridView(posts: posts)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }

                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MockUser[0])
}
