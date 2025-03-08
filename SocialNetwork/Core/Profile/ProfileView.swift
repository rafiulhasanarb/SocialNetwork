//
//  ProfileView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    var posts: [Post] {
        return Post.MockPost.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        ScrollView {
            // header
            ProfileHeaderView(user: user)
            
            // post grid view
            PostGridView(user: user)            
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MockUser[0])
}
