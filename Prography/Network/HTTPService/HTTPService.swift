//
//  HTTPService.swift
//  prography
//
//  Created by 김수경 on 2024/01/31.
//

import Foundation

final class HTTPService: HTTPServicable {
    let encoder: JSONEncoder = JSONEncoder()
    let decoder: JSONDecoder = JSONDecoder()
    let httpPublisher: HTTPPublishable
    
    init(httpPublisher: HTTPPublishable = URLSession.shared) {
        self.httpPublisher = httpPublisher
    }
}
