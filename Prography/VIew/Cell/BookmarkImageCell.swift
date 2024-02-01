//
//  BookmarkImageCell.swift
//  Prography
//
//  Created by 김수경 on 2024/02/01.
//

import SwiftUI

final class BookmarkImageCellViewModel: ObservableObject {
    private var image: PhotoDTO
    
    // 비즈니스 로직
    var width: CGFloat {
        CGFloat(image.width * 128 / image.height)
    }
    
    var isLoading: Bool {
        false
    }
    
    init(image: PhotoDTO) {
        self.image = image
    }
}

struct BookmarkImageCell: View {
    private let image: PhotoDTO
    private let viewModel: BookmarkImageCellViewModel
    
    init(image: PhotoDTO) {
        self.image = image
        self.viewModel = BookmarkImageCellViewModel(image: self.image)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 4)
                .fill(.clear)
                .background(
                    Group {
                        if viewModel.isLoading {
                            
                        } else {
                            AsyncImage(url: URL(string: image.urls.thumb)!)
                        }
                    }
                )
                .frame(width: CGFloat(viewModel.width), height: CGFloat(128))
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
    
}

#Preview {
    BookmarkImageCell(image: PhotoDTO(id: "!", width: 8640, height: 5670, description: "aa", altDescription: "Aa", urls: Urls.init(raw: "a", full: "a", regular: "a", small: "a", thumb: "a"), tags: nil))
}
