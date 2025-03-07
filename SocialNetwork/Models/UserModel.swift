//
//  UserModel.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String?
    let fullname: String
    let bio: String?
    let email: String
}


extension User {
    static var MockUser: [User] = [
        .init(id: "1", username: "rafiul", profileImageUrl: "https://randomuser.me/api/portraits/men/1.jpg", fullname: "Rafiul Hasan", bio: "Hello, I am a developer.", email: "rafiul@example.com"),
        .init(id: "2", username: "sakib", profileImageUrl: "https://randomuser.me/api/portraits/men/2.jpg", fullname: "Sakib Khan", bio: "I am a cricketer.", email: "sakib@example.com"),
        .init(id: "3", username: "tamim", profileImageUrl: "https://randomuser.me/api/portraits/men/3.jpg", fullname: "Tamim Iqbal", bio: "I am a cricketer.", email: "tamim@example.com"),
        .init(id: "4", username: "shakib", profileImageUrl: "https://randomuser.me/api/portraits/men/4.jpg", fullname: "Shakib Al Hasan", bio: "I am a cricketer.", email: "shakib@example.com"),
        .init(id: "5", username: "masud", profileImageUrl: "https://randomuser.me/api/portraits/men/5.jpg", fullname: "Masud Rana", bio: "I am a cricketer.", email: "masud@example.com"),
        .init(id: "6", username: "imran", profileImageUrl: "https://randomuser.me/api/portraits/men/6.jpg", fullname: "Imran Khan", bio: "I am a cricketer.", email: "imran@example.com"),
        .init(id: "7", username: "samiul", profileImageUrl: "https://randomuser.me/api/portraits/men/7.jpg", fullname: "Samiul Islam", bio: "I am a cricketer.", email: "samiul@example.com"),
        .init(id: "8", username: "shahid", profileImageUrl: "https://randomuser.me/api/portraits/men/8.jpg", fullname: "Shahid Afridi", bio: "I am a cricketer.", email: "shahid@example.com"),
        .init(id: "9", username: "mohammad", profileImageUrl: "https://randomuser.me/api/portraits/men/9.jpg", fullname: "Mohammad Hafeez", bio: "I am a cricketer.", email: "mohammad@example.com"),
        .init(id: "10", username: "mushtaq", profileImageUrl: "https://randomuser.me/api/portraits/men/10.jpg", fullname: "Mushtaq Khan", bio: "I am a cricketer.", email: "mushtaq@example.com")
        ]
}
