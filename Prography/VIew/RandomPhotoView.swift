//
//  RandomPhotoView.swift
//  Prography
//
//  Created by 김수경 on 2024/01/31.
//

import SwiftUI

struct RandomPhotoView: View {
    @State private var currentIndex = 0
    @State private var buttonTapped = false
    
    let viewModel = RandomPhotoViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { scrollView in
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top) {
                        ForEach(0..<viewModel.photos.count, id: \.self) { index in
                            RandomPhotoImageCell(viewModel: RandomPhotoImageCellViewModel(photo: viewModel.photos[index]), currentIndex: $currentIndex,
                                                 index: index, buttonTapped: $buttonTapped
                            )
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.white)
                                    .frame(width: viewModel.cardWidth, height: viewModel.cardHeight)
                                    .shadow(radius: 4)
                            )
                            .onTapGesture {
                                self.currentIndex = index
                            }
                            .onAppear {
                                if index == viewModel.photos.count - 1 {
                                    viewModel.getPhotos()
                                }
                            }
                        }
                    }
                    .padding(.top, 10)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Image(.logo)
                            }
                        }
                    }
                    .task {
                        viewModel.getPhotos()
                    }
                    .onChange(of: buttonTapped) { oldValue, newValue in
                        if newValue == true {
                            scrollView.scrollTo(1, anchor: .center)
                            buttonTapped = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RandomPhotoView()
}
