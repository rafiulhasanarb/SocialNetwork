//
//  SearchView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.users) { user in
                        userRow(user)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func userRow(_ user: User) -> some View {
        NavigationLink(value: user) {
            HStack {
                Image(user.profileImageUrl ?? "defaultImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(user.username)
                        .fontWeight(.semibold)
                    Text(user.fullname ?? "")
                }
                .font(.footnote)
                
                Spacer()
            }
            .foregroundStyle(.black)
            .padding(.horizontal)
        }
    }
}

#Preview {
    SearchView()
}
