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
                    caption = ""
                    viewModel.postImage = nil
                    viewModel.selectedImage = nil
                    tabSelection = 0
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    
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
}

#Preview {
    UploadPostView(tabSelection: .constant(0))
}
