//
//  ContentView.swift
//  Prography
//
//  Created by 김수경 on 2024/01/31.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Group {
                MainView()
                    .tabItem {
                        Image(.house)
                            .renderingMode(.template)
                    }
                RandomPhotoView()
                    .tabItem {
                        Image(.cards)
                            .renderingMode(.template)
                    }
            }
            .toolbarBackground(Color(uiColor: .black90), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}

#Preview {
    ContentView()
}

