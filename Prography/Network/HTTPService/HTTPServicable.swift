//
//  HTTPServicable.swift
//  prography
//
//  Created by 김수경 on 2024/01/31.
//

import Combine
import Foundation

protocol HTTPServicable {
    var encoder: JSONEncoder { get }
    var decoder: JSONDecoder { get }
    var httpPublisher: HTTPPublishable { get }
    
    func request<D: Decodable>(for request: HTTPRequestable, type: D.Type) -> AnyPublisher<D, Error>
    func request<E: Encodable, D: Decodable>(_ data: E, for request: HTTPRequestable, type: D.Type) -> AnyPublisher<D, Error>
    
}

extension HTTPServicable {
    func request<D: Decodable>(for request: HTTPRequestable, type: D.Type) -> AnyPublisher<D, Error> {
        guard let urlRequest = request.asURLRequest() else {
            return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
        }
        return httpPublisher.publishHTTP(for: urlRequest)
            .tryMap { data in
                try decoder.decode(D.self, from: data)
            }
            .eraseToAnyPublisher()
    }
    
    func request<E: Encodable, D: Decodable>(_ data: E, for request: HTTPRequestable, type: D.Type) -> AnyPublisher<D, Error> {
        guard var urlRequest = request.asURLRequest(),
              let body = try? encoder.encode(data) else {
            return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
        }
        urlRequest.httpBody = body
        
        return httpPublisher.publishHTTP(for: urlRequest)
            .tryMap { data in
                try decoder.decode(D.self, from: data)
            }
            .eraseToAnyPublisher()
    }
}
