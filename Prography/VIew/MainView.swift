//
//  MainView.swift
//  Prography
//
//  Created by 김수경 on 2024/01/31.
//

import SwiftUI

struct MainView: View {
    private let viewModel = MainViewModel()
    
//    init() {
//        viewModel.getPhotos()
//    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                
                // MARK: - Bookmark

                Section {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(viewModel.photos, id: \.self) { photo in
                                BookmarkImageCell(image: photo)
                            }
                        }
                    }
                } header: {
                    HStack {
                        Text("북마크")
                            .font(.title.bold())
                        Spacer()
                    }
                }
                .padding([.leading, .trailing])
                
                
                // MARK: - RecentImage

                Section {
                    HStack(alignment: .top){
                        LazyVStack(spacing: 8) {
                            ForEach(0..<viewModel.photos.count, id: \.self) { index in
                                if index % 2 == 0 {
                                    RecentImageCell(image: viewModel.photos[index])
                                }
                            }
                        }
                        LazyVStack(spacing: 8) {
                            ForEach(0..<viewModel.photos.count, id: \.self) { index in
                                if index % 2 == 1 {
                                    RecentImageCell(image: viewModel.photos[index])
                                }
                            }
                        }
                    }
                } header: {
                    HStack {
                        Text("최신 이미지")
                            .font(.title.bold())
                        Spacer()
                    }
                }
                .padding([.leading, .trailing])
            }
            .onAppear {
                viewModel.getPhotos()
            }
        }
    }
}

#Preview {
    MainView()
}
