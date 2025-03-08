//
//  SearchViewModel.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/8/25.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    init () {
        Task {
            try await fetchAllUsers()
        }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
