//
//  RecentImageCellViewModel.swift
//  Prography
//
//  Created by 김수경 on 2024/02/02.
//

import Foundation

final class RecentImageCellViewModel: ObservableObject {
    private let photo: PhotoDTO
    
    init(photo: PhotoDTO) {
        self.photo = photo
    }
    
    let width = CGFloat((screenWidth - 40) / 2)
    
    var height: CGFloat {
        CGFloat(photo.height * Int(width) / photo.width)
    }
    var title: String {
        if let collections = photo.currentUserCollections,
           let title = collections.first?.title {
            return title
        }
        return ""
    }
    var photoURLString: String {
        return photo.urls.full
    }
}
