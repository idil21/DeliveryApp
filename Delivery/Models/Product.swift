//
//  Product.swift
//  Delivery
//
//  Created by Sıla Murat on 21.08.2023.
//

import Foundation
import SwiftUI

struct ProductResponse: Codable {
    let body: [Product]
    let message: String
}
struct Product: Codable, Hashable, Identifiable{
    var id: Int
    var name: String
    var price: Double
    var imageUrl: String?
    /*
    var image: Image {
        Image(imageUrl)
    }
     
    var origin: String
    var quantity: Double
    var unit: String
    var detail: String
    var categoryId: String
     */
}
