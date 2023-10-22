//
//  CartView.swift
//  Delivery
//
//  Created by Sıla Murat on 9.08.2023.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color.theme.background.ignoresSafeArea()
                ScrollView{
                    if cartViewModel.cartProducts.count > 0 {
                        ForEach(cartViewModel.cartProducts, id: \.self){ cartProduct in
                            ProductCartView(cart: cartProduct)
                        }
                        VStack (spacing: 0){
                            HStack{
                                Text("Your total is ")
                                    .bold()
                                    .foregroundColor(Color.theme.textPrimary)
                                Spacer()
                                Text(cartViewModel.total.formatted(.currency(code: "EUR")))
                                    .bold()
                                    .foregroundColor(Color.theme.textPrimary)
                            }
                            VStack{
                                NavigationLink(destination: Checkout()) {
                                    RectangleButton(image: nil, title: "Checkout")
                                }
                                
                            }
                            .padding(.top)
                            
                        }
                        .padding()
                    }else {
                        Text("Your Cart is Empty")
                            .bold()
                            .foregroundColor(Color.theme.textPrimary)
                    }
                }
                .navigationTitle("Cart")
                .padding(.top)
                
            }
           
            
        }
        
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartViewModel())
    }
}
