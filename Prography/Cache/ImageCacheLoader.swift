//
//  ImageCacheLoader.swift
//  Prography
//
//  Created by 김수경 on 2024/02/01.
//

import SwiftUI
import Combine

@Observable
final class ImageCacheLoader {
    private let url: URL
    private let imageCacher = ImageCacher()
    private var cancellable: AnyCancellable? = nil
    
    var uiImage: UIImage? = nil
    
    init(url: URL) {
        self.url = url
    }
    
    func load() {
        
        if imageCacher[url.absoluteString] != nil {
            uiImage = imageCacher[url.absoluteString]
            return
        }
        
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) in
                guard let image = UIImage(data: data) else {
                    throw URLError(.badServerResponse)
                }
                return image
            }
            .replaceError(with: UIImage(systemName: "sun.min")!)
            .sink(receiveValue: { [weak self] image in
                self?.uiImage = image
                self?.imageCacher.store(image, for: self?.url.absoluteString)
            })
    }
}
