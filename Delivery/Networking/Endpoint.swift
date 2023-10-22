//
//  Endpoint.swift
//  Delivery
//
//  Created by Sıla Murat on 23.08.2023.
//

import Foundation
import Moya

enum Endpoint {
    case categories
    case cart(id: Int = 1)
    case products(id: Int)
    case user
    case addCart(userId: Int, vegetableId: Int, quantity: Int)
    case updateCart(userId: Int, itemId: Int, quantity: Int)
    case removeCart(userId: Int, itemId: Int)
}

extension Endpoint: TargetType {
    var baseURL: URL {
        return URL(string: "http://46.101.58.198:1903")!
    }

    var path: String {
        switch self {
        case .categories:
            return "/category/all"
        case .cart(let id):
            return "/cart/\(id)"
        case .products(let id):
            return "/category/vegetables/\(id)"
        case .user:
            return "/user/all"
        case .addCart:
            return "/cart"
        case .removeCart(let userId , let itemId):
            return "/cart/\(userId)/\(itemId)"
        case .updateCart:
            return "/cart"
        }
    
    }
    
    var method: Moya.Method {
        switch self {
        case .cart, .categories, .products , .user:
            return .get
        case .addCart:
            return .post
        case .removeCart:
            return .delete
        case .updateCart:
            return .put
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var task: Task {
        switch self {
        case .cart, .categories, .products , .user , .removeCart:
            return .requestPlain
        case .addCart(let userId, let vegetableId, let quantity):
            return .requestParameters(parameters: ["userId" : userId, "vegetableId" : vegetableId, "quantity": quantity], encoding: JSONEncoding.default)
        case .updateCart(let userId, let itemId, let quantity):
            return .requestParameters(parameters: ["userId" : userId, "itemId" : itemId, "quantity": quantity], encoding: JSONEncoding.default)  
        }

    }
}
