//
//  Cart.swift
//  Delivery
//
//  Created by Sıla Murat on 21.08.2023.
//

import Foundation
import SwiftUI

struct CartResponse: Codable {
    let body: [CartM]
    let message: String
    let vegetableList: [VegetableListResponse]
}

struct VegetableListResponse: Codable, Hashable, Identifiable {
    let id: Int
    let itemId: Int
    let quantity: Int
    let name: String
    let imageUrl: String? 
    let price: Double
    let categoryId: Int
    
}
struct CartM: Codable, Hashable, Identifiable{
    var id: Int
    var userId: Int
    var vegetableId: Int
    var quantity: Int
}
