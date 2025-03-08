//
//  LoginViewModel.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
