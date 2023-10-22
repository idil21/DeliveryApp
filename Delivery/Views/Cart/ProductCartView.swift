//
//  CartProductView.swift
//  Delivery
//
//  Created by Sıla Murat on 9.08.2023.
//

import SwiftUI

struct ProductCartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    var cart: VegetableListResponse
    var body: some View {
        HStack(spacing: 10){
            Image(cart.imageUrl ?? "Lettuce")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5){
                Text(cart.name )
                Text(cart.price.formatted(.currency(code: "EUR")))
                HStack{
                    Stepper("quantity: \(cart.quantity)") {
                        cartViewModel.updateCart(itemId: cart.itemId, quantity: cart.quantity + 1)
                    } onDecrement: {
                        if cart.quantity > 1 {
                            cartViewModel.updateCart(itemId: cart.itemId, quantity: cart.quantity - 1)
                        }else{
                            cartViewModel.removeFromCart(productId: cart.itemId)
                        }
                    }
                    Spacer()
                }
                .padding(.trailing, 20)
               
                

            }
            .bold()
            .foregroundColor(Color.theme.textPrimary)
            .padding()
            
            Spacer()
            Image(systemName: "trash")
                .foregroundColor(Color.theme.textPrimary)
                .onTapGesture {
                    cartViewModel.removeFromCart(productId: cart.itemId)
                }
            
        }
        .padding(.horizontal)
        .background(Color.theme.background)
    }
}
/*
struct ProductCartView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCartView(item: VegetableViewModel().vegetableArray[0])
    }
}
*/
