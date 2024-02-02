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
                        ForEach(viewModel.photos, id: \.self) { photo in
                            RecentImageCell(viewModel: RecentImageCellViewModel(photo: photo))
                                .onTapGesture {
                                    self.isPresentingModal = true
                                    self.id = photo.id
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
            }
            .task {
                viewModel.getPhotos()
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
