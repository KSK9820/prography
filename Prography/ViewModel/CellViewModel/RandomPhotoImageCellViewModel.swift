//
//  RandomPhotoImageCellViewModel.swift
//  Prography
//
//  Created by 김수경 on 2024/02/03.
//

import Foundation

struct RandomPhotoImageCellViewModel {
    private let photo: PhotoDTO
    
    init(photo: PhotoDTO) {
        self.photo = photo
    }
    let cardWidth = CGFloat(screenWidth * 327 / 375)
    var cardHeight: CGFloat {
        CGFloat(cardWidth * 553 / 327)
    }
    var photoWidth: CGFloat {
        CGFloat(cardWidth * 303 / 327)
    }
    var photoHeight: CGFloat {
        CGFloat(cardHeight * 427 / 553)
    }
    var photoURLString: String {
        return photo.urls.regular
    }
}
