//
//  MainViewModel.swift
//  Prography
//
//  Created by 김수경 on 2024/01/31.
//

import Combine
import Foundation

@Observable
final class MainViewModel {
    
    private var cancellables = Set<AnyCancellable>()
    private let httpService: HTTPServicable = HTTPService()
    private(set) var photos: [PhotoDTO] = []
    
    func getPhotos(page: Int) {
        httpService.request(for: UnsplashRequest.main, type: [PhotoDTO].self)
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] photos in
                    self?.photos += photos
            })
            .store(in: &cancellables)
    }
}
