//
//  UploadPostView.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import SwiftUI

struct UploadPostView: View {
    
    @StateObject private var viewModel = UploadPostViewModel()
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @Binding var tabSelection: Int
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        try? await viewModel.uploadPost(caption: caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                }
            }
            .padding(.horizontal)
            
            //post image and captions
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
    
    private func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.postImage = nil
        viewModel.selectedImage = nil
        tabSelection = 0
    }
}

#Preview {
    UploadPostView(tabSelection: .constant(0))
}
