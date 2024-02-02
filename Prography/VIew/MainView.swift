//
//  MainView.swift
//  Prography
//
//  Created by 김수경 on 2024/01/31.
//

import SwiftUI

struct MainView: View {
    private let viewModel = MainViewModel()

    @State private var selectedImageID: PhotoDTO? = nil
    @State private var isPresentingModal: Bool = false
    
    init() {
        viewModel.getPhotos()
    }
    
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
                    HStack(alignment: .top) {
                        LazyVStack(spacing: 8) {
                            
                            ForEach(0..<viewModel.photos.count, id: \.self) { index in
                                RecentImageCell(viewModel: RecentImageCellViewModel(photo: viewModel.photos[index]))
                                    .onTapGesture {
                                        self.selectedImageID = viewModel.photos[index]
                                        self.isPresentingModal = true
                                    }
                            }
                            
                        }
                        
                        LazyVStack(spacing: 8) {
                            ForEach(0..<viewModel.photos.count, id: \.self) { index in
                                if index % 2 == 1 {
                                    RecentImageCell(viewModel: RecentImageCellViewModel(photo: viewModel.photos[index]))
                                        .onTapGesture {
                                            self.selectedImageID = viewModel.photos[index]
                                            self.isPresentingModal = true
                                        }
                                }
                                
                            }
                        }
                    }.transparentFullScreenCover(isPresented: $isPresentingModal) {
                        PhotoDetailView(viewModel: PhotoDetailViewModel(photo: selectedImageID ?? viewModel.photos[1]))
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
            //            .onAppear {
            //                viewModel.getPhotos()
            //            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(.logo)
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
