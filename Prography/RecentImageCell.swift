//
//  BookMarkCell.swift
//  Prography
//
//  Created by 김수경 on 2024/01/31.
//

import SwiftUI

struct RecentImageCell: View {
    let image: PhotoDTO
    var body: some View {
        VStack {
            Text(image.id)
            Text(image.urls.raw)
        }
    }
}

#Preview {
    RecentImageCell(image: PhotoDTO(id: "!", width: 2100, height: 100, description: "aa", altDescription: "Aa", urls: Urls.init(raw: "a", full: "a", regular: "a", small: "a", thumb: "a"), tags: nil))
}
