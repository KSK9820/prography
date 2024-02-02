//
//  PhotoDetailView.swift
//  Prography
//
//  Created by 김수경 on 2024/02/02.
//

import SwiftUI

struct PhotoDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let viewModel: PhotoDetailViewModel
    
    init(viewModel: PhotoDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        
        ZStack(alignment: .topLeading) {
            Color.black.ignoresSafeArea()
                .opacity(0.9)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            
            VStack {
                HStack {
                    HStack {
                        Button(action: {
                            viewModel.dismissView(presentationMode: presentationMode)
                        }, label: {
                            Image(.cancel)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 36, height: 36)
                            
                        })
                        .buttonStyle(.borderedProminent).clipShape(Circle())
                        .tint(.white)
                        .padding(.leading, 16)
                        
                        if let name = viewModel.userName {
                            Text(name)
                                .font(.title).bold()
                                .foregroundStyle(.white)
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 16) {
                        Image(.download)
                            .resizable().renderingMode(.template).scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white)
                        
                        Image(.bookmark)
                            .resizable().renderingMode(.template).scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing, 24)
                }
                
                AsyncImage(url: viewModel.photoURL) { image in
                    image.image?.resizable()
                }
                .frame(width: screenWidth, height: viewModel.photoHeight)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    if let title = viewModel.title {
                        Text(title)
                            .font(.title).bold()
                            .foregroundStyle(.white)
                    }
                    if let description = viewModel.photoDescritpion {
                        Text(description)
                            .lineLimit(2)
                            .foregroundStyle(.white)
                    }
                    Text(viewModel.photoTags)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
PhotoDetailView(viewModel: PhotoDetailViewModel(photo: PhotoDTO(id: "300", width: 2448, height: 3264, description: "kadjflakjdl;skfja;lskdjf;alksalkdjlakjdlkfjaldkfjlkasjdlkhasflgkhlaskdjflkajdlfkajsldfkjlakdjflakdglkhafslgkhlasdkjfdjfla", altDescription: nil, urls: Urls(raw: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", full: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", regular: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", small: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg", thumb: "https://images.unsplash.com/photo-1417325384643-aac51acc9e5d?q=75&fm=jpg"), tags: [Tags(title: "man"), Tags(title: "dd")], currentUserCollections: [CurrentUserCollections(title: "hihihihihihih")], user: User(userName: "dddd"))))
}
