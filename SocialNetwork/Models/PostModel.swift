//
//  PostModel.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import Foundation
import FirebaseCore

struct Post: Codable, Hashable, Identifiable {
    let id: String
    let ownerUid: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}


extension Post {
    static var MockPost: [Post] = [
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is a test post", likes: 125, imageUrl: "", timestamp: Timestamp(), user: User.MockUser[0]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is a test post", likes: 136, imageUrl: "", timestamp: Timestamp(), user: User.MockUser[2]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is a test post", likes: 195, imageUrl: "", timestamp: Timestamp(), user: User.MockUser[3]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is a test post", likes: 145, imageUrl: "", timestamp: Timestamp(), user: User.MockUser[5]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is a test post", likes: 145, imageUrl: "", timestamp: Timestamp(), user: User.MockUser[7])
    ]
}
