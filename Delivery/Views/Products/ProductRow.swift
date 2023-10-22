//
//  ProductRow.swift
//  Delivery
//
//  Created by Sıla Murat on 26.07.2023.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    var product: Product
    var body: some View {
        HStack{
            Image(product.imageUrl ?? "Lettuce")
                .resizable()
                .frame(width: 160, height: 128)
                .cornerRadius(8)
            
            VStack(alignment: .leading , spacing: 10){
                Text(product.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.textPrimary)
                HStack{
                    Text(product.price.formatted(.currency(code: "EUR")))
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.textPrimary)
                }
                Spacer()
                HStack(spacing: 10) {
                    FavoriteButton(isSet: .constant(false))
                        .frame(width: 78 , height: 40)
                    CartButton
                }
            }
            .padding(.leading , 10)
            Spacer()
        }
        .padding()
        .frame(height: 160)
        .background(Color.theme.background)
        
        
    }
}

/*
struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: ProductsViewModel(selectedCategoryId: 2).products[0] )
            .previewLayout(.sizeThatFits)
    }
}
*/
extension ProductRow {
    private var CartButton: some View {
        Button(action:  {
            cartViewModel.addToCart(productId: product.id)
        }) {
            Image(systemName: "cart")
                .padding()
                .foregroundColor(.white)
                .frame(width: 78,height: 40)
                .background(
                    Color.theme.primaryButton
                        .cornerRadius(10)
                )
        }
        .buttonStyle(.plain)
    }
}
