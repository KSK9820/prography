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
    
    func getPhotos() {
        httpService.request(for: UnsplashRequest.main, type: [PhotoDTO].self)
            .replaceError(with: [])
            .assign(to: \.photos, on: self)
            .store(in: &cancellables)
    }
}
