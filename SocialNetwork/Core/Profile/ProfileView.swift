//
//  ProfileView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItems: [GridItem] = [ .init(.flexible(), spacing: 2), .init(.flexible(), spacing: 2), .init(.flexible(), spacing: 2)]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                VStack(spacing: 10) {
                    
                    HStack {
                        Image("rafi-profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            UserStateView(value: 36, title: "Posts")
                            UserStateView(value: 52, title: "Followers")
                            UserStateView(value: 10, title: "Following")
                        }
                    }
                    
                    //Name and bio
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Rafiul Hasan")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("Wake up and smell the coffee!")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // Action button
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 40)
                            .foregroundStyle(.black)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                            }
                    }
                    
                    Divider()
                    
                }
                .padding(.horizontal)
                
                // post grid view
                LazyVGrid(columns: gridItems, spacing: 2) {
                    ForEach(0..<23) { _ in
                        Image("rafi-profile")
                            .resizable()
                            .scaledToFill()
                    }
                }
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }

                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
