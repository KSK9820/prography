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
    private var cancellable: AnyCancellable? = nil
    
    var uiImage: UIImage? = nil
    
    init(url: URL) {
        self.url = url
    }
    
    func load() {
        if ImageCacher.shared[url.absoluteString] != nil {
            DispatchQueue.main.async { [weak self] in
                self?.uiImage = ImageCacher.shared[self?.url.absoluteString]
            }
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
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] image in
                    self?.uiImage = image
                    ImageCacher.shared.store(image, for: self?.url.absoluteString)
            })
    }
}
