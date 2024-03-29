//
//  PhotoDetailView.swift
//  Prography
//
//  Created by 김수경 on 2024/02/02.
//

import SwiftUI


struct PhotoDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    private let viewModel: PhotoDetailViewModel

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
                    image.image?
                        .resizable()
                        .scaledToFit()
                }
        
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
        .task {
            viewModel.getaPhoto()
        }
    }
        
}

#Preview {
    PhotoDetailView(viewModel: PhotoDetailViewModel(id: "d6NJmJ60B8M"))
}
