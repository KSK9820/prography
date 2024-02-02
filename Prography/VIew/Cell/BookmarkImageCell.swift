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
    BookmarkImageCell(image: PhotoDTO(id: "300", width: 2448, height: 3264, description: "kadjflakjdl;skfja;lskdjf;alksdjfla", altDescription: nil, urls: Urls(raw: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", full: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", regular: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", small: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", thumb: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg"), tags: [Tags(title: "man"), Tags(title: "dd")], currentUserCollections: [CurrentUserCollections(title: "hihihihihihih")], user: User(userName: "dddd")))
}
