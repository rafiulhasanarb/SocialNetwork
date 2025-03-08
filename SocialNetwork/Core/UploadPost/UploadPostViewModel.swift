//
//  UploadPostViewModel.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
import PhotosUI
import SwiftUI

final class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await uploadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var postImage:Image?
    
    private var uiImage: UIImage?
    
    @MainActor
    func uploadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let image = UIImage(data: data) else { return }
        self.uiImage = image
        self.postImage = Image(uiImage: image)
    }
    
    @MainActor
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try await postRef.setData(encodedPost)
    }
}
