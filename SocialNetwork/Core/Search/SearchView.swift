//
//  SearchView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0..<20, id: \.self) { user in
                        HStack {
                            Image("rafi-profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("John Doe")
                                    .fontWeight(.semibold)
                                Text("San Francisco, CA")
                            }
                            .font(.footnote)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
