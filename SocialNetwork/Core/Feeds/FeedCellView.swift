//
//  FeedCellView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct FeedCellView: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            //Image and username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .small)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading)
            
            // post image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // action buttons
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top, 4)
            .foregroundStyle(.black)
            
            //Like label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 1)
            
            // caption label
            HStack {
                Text("\(post.user?.username ?? "")").fontWeight(.semibold) +
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .padding(.top, 1)
            
            Text("1h ago")
                .font(.footnote)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 1)
        }
    }
}

#Preview {
    FeedCellView(post: Post.MockPost[0])
}
