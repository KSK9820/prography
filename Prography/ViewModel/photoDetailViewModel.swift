//
//  photoDetailViewModel.swift
//  Prography
//
//  Created by 김수경 on 2024/02/02.
//

import SwiftUI

@Observable
final class PhotoDetailViewModel {
    private let photo: PhotoDTO
    
    init(photo: PhotoDTO) {
        self.photo = photo
    }
    
    var userName: String? {
        return photo.user?.userName ?? nil
    }
    var title: String? {
        return photo.currentUserCollections?.first?.title ?? nil
    }
    var photoDescritpion: String? {
        return photo.description ?? nil
    }
    var photoTags: String {
        if let tags = photo.tags {
            return "\n# \(String(describing: tags.map { $0.title }.joined(separator: " # ")))"
        }
        return "\n"
    }
    var photoURL: URL? {
        return URL(string: photo.urls.full)
    }
    var photoHeight: CGFloat {
        return CGFloat(photo.height * Int(screenWidth) / photo.width)
    }
    
    func dismissView(presentationMode: Binding<PresentationMode>) {
        presentationMode.wrappedValue.dismiss()
    }
}
