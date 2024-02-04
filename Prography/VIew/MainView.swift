//
//  MainView.swift
//  Prography
//
//  Created by 김수경 on 2024/01/31.
//

import SwiftUI

struct MainView: View {
    @State private var isPresentingModal: Bool = false
    @State private var id: String = String()
    @State private var last = false
    private let viewModel = MainViewModel()
    
 
    
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
                    let columns = [GridItem(.flexible()), GridItem(.flexible())]
                    
                    LazyVGrid(columns: columns, spacing: 10) {
//                        ForEach(viewModel.photos, id: \.self) { photo in
//                            RecentImageCell(viewModel: RecentImageCellViewModel(photo: photo))
//                                .onTapGesture {
//                                    self.isPresentingModal = true
//                                    self.id = photo.id
//                                }
//                        }
                        ForEach(viewModel.photos.indices, id: \.self) { index in
                                RecentImageCell(viewModel: RecentImageCellViewModel(photo: viewModel.photos[index]))
                                    .onTapGesture {
                                        self.isPresentingModal = true
                                        self.id = viewModel.photos[index].id
                                    }
                                    .onAppear {
                                        print(index)
                                        if index == viewModel.photos.count - 1 && last == true {
                                            viewModel.getPhotos(page: 1)
                                        }
                                    }
                            }
                    }
                    .transparentFullScreenCover(isPresented: $isPresentingModal) {
                        PhotoDetailView(viewModel: PhotoDetailViewModel(id: id))
                    }
                } header: {
                    HStack {
                        Text("최신 이미지")
                            .font(.title.bold())
                        Spacer()
                    }
                }
                .padding([.leading, .trailing])
                .task {
                    viewModel.getPhotos(page: 1)
                    last = true
                }
            }
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
