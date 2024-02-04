//
//  RandomPhotoImageCell.swift
//  Prography
//
//  Created by 김수경 on 2024/02/03.
//

import SwiftUI

struct RandomPhotoImageCell: View {
    private let viewModel: RandomPhotoImageCellViewModel
    @Binding var currentIndex: Int
    @Binding var buttonTapped: Bool
    
    let index: Int
    
    init(viewModel: RandomPhotoImageCellViewModel, currentIndex: Binding<Int>, index: Int, buttonTapped: Binding<Bool>) {
        self.viewModel = viewModel
        self._currentIndex = currentIndex
        self.index = index
        self._buttonTapped = buttonTapped
    }
    
    var body: some View {
        VStack {
            CacheImageView(urlString: viewModel.photoURLString)
                .frame(width: viewModel.photoWidth, height: viewModel.photoHeight)
                .shadow(radius: 10)
                .background(
                    RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                        .fill(.black)
                )
                .padding(.top, 12)
            
            HStack(alignment: .center) {
                Button(action: {}, label: {
                    Image(.cancel)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.gray60)
                        .overlay {
                            Circle()
                                .stroke(.gray30, lineWidth: 1)
                                .frame(width: 60, height: 60)
                        }
                })
                .padding(.trailing, 60)
                
                Button(action: {
                    currentIndex = index + 1
                    buttonTapped = true
                }, label: {
                    Image(.bookmark)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .fill(.brand)
                                .frame(width: 72, height: 72)
                        )
                })
                .padding(.trailing, 60)
                
                Button(action: {}, label: {
                    Image(.information)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.gray60)
                        .overlay {
                            Circle()
                                .stroke(.gray30, lineWidth: 1)
                                .frame(width: 60, height: 60)
                        }
                })
            }
            .frame(width: viewModel.cardWidth, height: 120)
        }
    }
}


#Preview {
    RandomPhotoImageCell(viewModel: RandomPhotoImageCellViewModel(photo: PhotoDTO(id: "300", width: 2448, height: 3264, description: "kadjflakjdl;skfja;lskdjf;alksdjfla", altDescription: nil, urls: Urls(raw: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", full: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", regular: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", small: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", thumb: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg"), tags: [Tags(title: "man"), Tags(title: "dd")], currentUserCollections: [CurrentUserCollections(title: "hihihihihihih")], user: User(userName: "dddd"))), currentIndex: .constant(0), index: 0, buttonTapped: .constant(false))
    //    RandomPhotoImageCell(viewModel: RandomPhotoImageCellViewModel(photo: PhotoDTO(id: "300", width: 2448, height: 3264, description: "kadjflakjdl;skfja;lskdjf;alksdjfla", altDescription: nil, urls: Urls(raw: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", full: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", regular: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", small: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", thumb: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg"), tags: [Tags(title: "man"), Tags(title: "dd")], currentUserCollections: [CurrentUserCollections(title: "hihihihihihih")], user: User(userName: "dddd"))), index: 1)
}
