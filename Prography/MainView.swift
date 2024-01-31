//
//  MainView.swift
//  Prography
//
//  Created by 김수경 on 2024/01/31.
//

import SwiftUI

struct MainView: View {
    private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
            Text("북마크")
            ScrollView(.horizontal) {
                LazyHStack(content: {
                  
                })
            }
                
            Text("최신 이미지")
                LazyVStack(content: {
                    ForEach(viewModel.photos) { photo in
                        RecentImageCell(image: photo)
                    }
                })
            }
        }
        .onAppear {
            viewModel.getPhotos()
        }
    }
}

#Preview {
    MainView()
}
