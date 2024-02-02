//
//  CacheImageView.swift
//  Prography
//
//  Created by 김수경 on 2024/02/01.
//

import SwiftUI

struct CacheImageView: View {
    private var loader: ImageCacheLoader
    
    init(urlString: String) {
        self.loader = ImageCacheLoader(url: URL(string: urlString)!)
    }
    
    var body: some View {
        selectImage()
            .onAppear(perform: loader.load)
    }
    
    private func selectImage() -> some View {
        Group {
            if let image = loader.uiImage {
                Image(uiImage: image)
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    CacheImageView(urlString: "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FpEyoy%2Fbtq7ygWkOum%2FlgvkupIYN2x5xKQ00NGkl1%2Fimg.png")
}
