//
//  PostGridView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct PostGridView: View {
    
    let posts: [Post]
    let gridItems: [GridItem] = [ .init(.flexible(), spacing: 2), .init(.flexible(), spacing: 2), .init(.flexible(), spacing: 2)]
    var imageDimention: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 2) {
            ForEach(posts) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimention, height: imageDimention)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(posts: Post.MockPost)
}
