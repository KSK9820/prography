//
//  RandomPhotoViewModel.swift
//  Prography
//
//  Created by 김수경 on 2024/02/03.
//

import Combine
import SwiftUI

@Observable
final class RandomPhotoViewModel {
    private var cancellables = Set<AnyCancellable>()
    private let httpService: HTTPServicable = HTTPService()
    private(set) var photos: [PhotoDTO] = []
    
    let cardWidth = CGFloat(screenWidth * 327 / 375)
    var cardHeight: CGFloat {
        CGFloat(cardWidth * 553 / 327)
    }
    var photoCount: Int {
        photos.count
    }
    
    func getPhotos() {
        DispatchQueue.global().async { [self] in
            httpService.request(for: UnsplashRequest.randomPhoto, type: [PhotoDTO].self)
                .replaceError(with: [])
                .sink(receiveValue: { [weak self] photos in
                    DispatchQueue.main.async {
                        self?.photos += photos
                    }
                })
                .store(in: &cancellables)
        }
        }
}
