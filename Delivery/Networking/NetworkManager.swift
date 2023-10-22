//
//  ApiRequest.swift
//  Delivery
//
//  Created by Sıla Murat on 17.08.2023.
//

import Foundation
import Moya
import Combine


class NetworkManager {
    static let shared = NetworkManager()
    var provider = MoyaProvider<Endpoint>(plugins: [NetworkLoggerPlugin()])
    private init(){
        
    }
    
    func request<T: Decodable>(target: Endpoint , _ type: T.Type) -> AnyPublisher<T, Error> {
        return provider.requestPublisher(target)
            .tryMap { response in
                let decoder = JSONDecoder()   
                return try decoder.decode(T.self, from: response.data)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}




