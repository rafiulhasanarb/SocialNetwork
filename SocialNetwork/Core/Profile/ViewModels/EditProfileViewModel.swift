//
//  EditProfileViewModel.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/8/25.
//

import SwiftUI
import PhotosUI
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

final class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await uploadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var fullname = ""
    @Published var bio = ""
    @Published var profileImage:Image?
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
    }
    
    @MainActor
    func uploadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let image = UIImage(data: data) else { return }
        self.uiImage = image
        self.profileImage = Image(uiImage: image)
    }
    
    @MainActor
    func updateUserData() async throws {
        var data:[String: Any] = [:]
        
        // update profile image if change
        if let uiImage = uiImage {
            let imageUrl = try await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        // update fullname if change
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        // update bio if change
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            //try await Firestore.firestore().collection("users").document(Auth.auth().currentUser!.uid).updateData(data)
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
