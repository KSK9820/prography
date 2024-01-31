//
//  HTTPPublishable.swift
//  prography
//
//  Created by 김수경 on 2024/01/30.
//

import Combine
import Foundation

protocol HTTPPublishable {
    func publishHTTP(for request: URLRequest) -> AnyPublisher<Data, Error>
}

extension URLSession: HTTPPublishable {
    func publishHTTP(for request: URLRequest) -> AnyPublisher<Data, Error> {
        self.dataTaskPublisher(for: request)
            .tryMap { (data, response) in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .eraseToAnyPublisher()
        //AnyPublisher의 Data 타입으로 반환하기 위해서
        //return data를 사용하려면 eraseaTo 밑에서 .sink해서 사용할 수 있음
    }
}


