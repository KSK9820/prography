//
//  UnsplashRequest.swift
//  prography
//
//  Created by 김수경 on 2024/01/30.
//

import Foundation

enum UnsplashRequest {
    case main
    case randomPhoto
    case photoDetail(id: String)
}

extension UnsplashRequest: HTTPRequestable {
    static let apiKey = Bundle.main.infoDictionary?["API_KEY"] as! String
    
    var urlString: String { "https://api.unsplash.com" }
    var httpMethod: HTTPMethod {
        switch self {
        case .main:
            return .get
        case .randomPhoto:
            return .get
        case .photoDetail:
            return .get
        }
    }
    var path: [String]? {
        switch self {
        case .main:
            return ["photos"]
        case .randomPhoto:
            return ["photos", "randoms"]
        case .photoDetail(let id):
            return ["photos", id]
        }
    }
    var queries: [URLQueryItem]? { nil }
    var contentType: [String : String]? {
        switch self {
        case .main:
            return ["Authorization" : "Client-ID \(Self.apiKey)"]
        case .randomPhoto:
            return ["Authorization" : "Client-ID \(Self.apiKey)"]
        case .photoDetail:
            return ["Authorization" : "Client-ID \(Self.apiKey)"]
        }
    }
}
