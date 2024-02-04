//
//  ImageCacher.swift
//  Prography
//
//  Created by 김수경 on 2024/02/01.
//

import SwiftUI

@Observable
final class ImageCacher {
    static let shared = ImageCacher()
    
    private init() { }
    
    private let nsCache = NSCache<NSString, UIImage>()
    
    subscript(_ urlString: String?) -> UIImage? {
        let image = fetch(for: urlString)
        return image
    }
    
    func fetch(for key: String?) -> UIImage? {
        guard let key = key else { return nil }
        let nsKey = NSString(string: key)
        return nsCache.object(forKey: nsKey)
    }
    
    func store(_ image: UIImage, for key: String?) {
        guard let key = key else { return }
        let nsKey = NSString(string: key)
        nsCache.setObject(image, forKey: nsKey)
    }
}
