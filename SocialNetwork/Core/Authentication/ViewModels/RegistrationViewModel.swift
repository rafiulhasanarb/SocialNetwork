//
//  RegistrationViewModel.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import Foundation

final class RegistrationViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        clearFields()
    }
    
    private func clearFields() {
        email = ""
        username = ""
        password = ""
    }
}
