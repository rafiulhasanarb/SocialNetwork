//
//  UserService.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/8/25.
//

import Foundation
import FirebaseFirestore

final class UserService {
    
    static func fetchUser(withUid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(withUid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
        var users: [User] = []
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        for doc in documents {
            guard let user = try? doc.data(as: User.self) else { return []}
            users.append(user)
        }
        
        return users
        // better way to get users
        // let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        // return snapshot.documents.compactMap { try? $0.data(as: User.self) }
    }
}
