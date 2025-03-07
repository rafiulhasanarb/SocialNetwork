//
//  UploadPostViewModel.swift
//  SocialNetwork
//
//  Created by Rafiul Hasan on 3/7/25.
//

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
    
    
    func uploadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let image = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: image)
    }
}
