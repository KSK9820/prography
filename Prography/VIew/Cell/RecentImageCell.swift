//
//  BookMarkCell.swift
//  Prography
//
//  Created by 김수경 on 2024/01/31.
//

import SwiftUI

struct RecentImageCell: View {
    private let viewModel: RecentImageCellViewModel
    
    init(viewModel: RecentImageCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 4)
                .fill(.clear)
                .background(
                    CacheImageView(urlString: viewModel.photoURLString)
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
                Text(viewModel.title)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .frame(alignment: .bottomLeading)
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    RecentImageCell(viewModel: RecentImageCellViewModel(photo: PhotoDTO(id: "300", width: 2448, height: 3264, description: "kadjflakjdl;skfja;lskdjf;alksdjfla", altDescription: nil, urls: Urls(raw: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", full: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", regular: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", small: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", thumb: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg"), tags: [Tags(title: "man"), Tags(title: "dd")], currentUserCollections: [CurrentUserCollections(title: "hihihihihihih")], user: User(userName: "dddd"))))
}
