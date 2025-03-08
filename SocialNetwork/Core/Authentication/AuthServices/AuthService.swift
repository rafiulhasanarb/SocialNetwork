//
//  AuthService.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthService {
    
    static let shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            try await self.loadUserData()
        }
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await self.loadUserData()
        } catch {
            print("Error login user: \(error.localizedDescription)")
            return
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await updateUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("Error creating user: \(error.localizedDescription)")
            return
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        guard let uid = self.userSession?.uid else { return }
        _ = try await Firestore.firestore().collection("users").document(uid).getDocument()
        self.currentUser = try await UserService.fetchUser(withUid: uid)
    }
    
    @MainActor
    func signOut() async throws {
        try Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func updateUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
