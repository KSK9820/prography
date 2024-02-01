//
//  BookMarkCell.swift
//  Prography
//
//  Created by 김수경 on 2024/01/31.
//

import SwiftUI

final class RecentImageCellViewModel: ObservableObject {
    private var image: PhotoDTO
    let width = CGFloat((UIScreen.main.bounds.width - 40) / 2)
    
    // 비즈니스 로직
    var height: CGFloat {
        CGFloat(image.height * Int(width) / image.width)
    }
    
    var isLoading: Bool {
        false
    }
    
    var description: String {
        image.description ?? ""
    }
    
    init(image: PhotoDTO) {
        self.image = image
    }
}

struct RecentImageCell: View {
    private let image: PhotoDTO
    private let viewModel: RecentImageCellViewModel
    
    init(image: PhotoDTO) {
        self.image = image
        self.viewModel = RecentImageCellViewModel(image: self.image)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 4)
                .fill(.clear)
                .background(
                    CacheImageView(urlString: image.urls.thumb)
//                    AsyncImage(url: URL(string: image.urls.thumb))
//                    AsyncImage(url: URL(string: image.urls.thumb)!, content: {
//                        $0
//                    }, placeholder: {
//                        Text("123")
//                    })
                )
                .frame(width: viewModel.width, height: viewModel.height)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            
            VStack(alignment: .leading) {
                Text(viewModel.description)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .frame(alignment: .bottomLeading)
            .padding(.leading, 10)
            .padding(.bottom, 10)
        }
    }
}

#Preview {
    RecentImageCell(image: PhotoDTO(id: "!", width: 8640, height: 5670, description: "aa", altDescription: "Aa", urls: Urls.init(raw: "a", full: "a", regular: "a", small: "a", thumb: "a"), tags: nil))
}




