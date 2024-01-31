//
//  PhotoDTO.swift
//  prography
//
//  Created by 김수경 on 2024/01/30.
//

import Foundation

struct PhotoDTO: Identifiable, Decodable {
    let id: String
    let width: Int
    let height: Int
    let description: String?
    let altDescription: String?
    let urls: Urls
    let tags: Tag?
    
    enum CodingKeys: String, CodingKey {
        case altDescription = "alt_description"
        case id, width, height, description, urls, tags
    }
}

extension PhotoDTO: Hashable {
    static func == (lhs: PhotoDTO, rhs: PhotoDTO) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Urls: Decodable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}

struct Tag: Decodable {
    let title: String
}
