//
//  Category.swift
//  Delivery
//
//  Created by Sıla Murat on 21.08.2023.
//

import Foundation
import SwiftUI

struct CategoryResponse: Codable {
    let body: [CategoryM]
    let message: String
}

struct CategoryM: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var imageUrl: String?
   
}
