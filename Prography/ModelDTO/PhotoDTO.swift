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
    let tags: [Tags]?
    let currentUserCollections: [CurrentUserCollections]?
    let user: User?
    
    enum CodingKeys: String, CodingKey {
        case altDescription = "alt_description"
        case currentUserCollections = "current_user_collections"
        case id, width, height, description, urls, tags, user
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

struct Tags: Decodable {
    let title: String
}

struct CurrentUserCollections: Decodable {
    let title: String
}

struct User: Decodable {
    let userName: String
    
    enum CodingKeys: String, CodingKey {
        case userName = "username"
    }
}
