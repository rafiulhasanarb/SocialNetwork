//
//  MainTabView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab: Int = 0
    
    let user: User
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .onAppear {
                    selectedTab = 0
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear {
                    selectedTab = 1
                }
            
            UploadPostView(tabSelection: $selectedTab)
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .onAppear {
                    selectedTab = 2
                }
            
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }
                .onAppear {
                    selectedTab = 3
                }
            
            CurrentUserProfileView(user: user)
                .tabItem {
                    Image(systemName: "person")
                }
                .onAppear {
                    selectedTab = 4
                }
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView(user: User.MockUser[0])
}
