//
//  ItemCard.swift
//  Delivery
//
//  Created by Sıla Murat on 25.07.2023.
//

import SwiftUI

struct CategoryCard: View {
    var category: CategoryM
    @ObservedObject var productsViewModel: ProductsViewModel
    
    init(category: CategoryM){
        self.productsViewModel = ProductsViewModel(selectedCategoryId: category.id)
        self.category = category
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Image(category.imageUrl ?? "Lettuce")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 140)
            VStack(alignment: .leading, spacing: 8){
                Text(category.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.textPrimary)
                Text("(\(productsViewModel.products.count))")
                    .font(.subheadline)
                    .foregroundColor(Color.theme.textSecondary)
                
            }
            .padding([.horizontal,.bottom])
            
            
        }
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.theme.border, lineWidth: 1)
        )
    }
    
    
    
}

/*
struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(label: "Vegetables", image:"Vegetables")
            .previewLayout(.sizeThatFits)
    }
}
*/
