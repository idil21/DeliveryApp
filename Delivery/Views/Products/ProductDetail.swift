//
//  ProductDetail.swift
//  Delivery
//
//  Created by Sıla Murat on 27.07.2023.
//

import SwiftUI
import ImageSlideshow
struct ProductDetail: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    var product : Product
    var body: some View {
        
        ZStack{
            Color.theme.background.edgesIgnoringSafeArea(.all)
            GeometryReader{ geometry in
                VStack(spacing: 0){
                    VStack(alignment: .leading){
                        ImageSlideshowView(
                            images:  [
                                ImageSource(image: (UIImage(named: product.imageUrl ?? "Lettuce") ?? UIImage(named: "Vegetables"))!),
                                ImageSource(image: (UIImage(named: product.imageUrl ?? "Lettuce") ?? UIImage(named: "Vegetables"))!)
                            ]
                        )
                        .frame(width: geometry.size.width , height: geometry.size.height * 0.4)
                        Backdrop
                        
                    }
                    .ignoresSafeArea()
                }
                .navigationBarBackButtonHidden()
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        CustomNavBar()
                    }
                }
                
            }
        }
        
        
        
        
    }
}
/*
struct ProductDetail_Previews: PreviewProvider {
    static var products = ProductsViewModel(selectedCategoryId: 2).products
    static var previews: some View {
        ProductDetail(product: products[0])
            .previewLayout(.sizeThatFits)
    }
}*/

extension ProductDetail{
    private var Backdrop : some View {
        ZStack(alignment: .topTrailing){
            VStack{
                HStack{
                    Text(product.name)
                        .font(.system(size: 30 , weight: .bold))
                        .foregroundColor(Color.theme.textPrimary)
                    
                    Spacer()
                    
                }.padding(.top, 25)
                
                HStack{
                    VStack(alignment: .leading, spacing: 15){
                        HStack(spacing: 5){
                            Text(product.price.formatted(.currency(code: "EUR")))
                                .font(.system(size: 32 , weight: .bold))
                                .foregroundColor(Color.theme.textPrimary)
                        }
                        HStack(spacing: 5){
                            Text("~ 1 ")
                            Text("kg")
                        }
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(Color.theme.primaryButton)
                    }
                    Spacer()
                }
                .padding(.top , 10)
                
                HStack{
                    VStack(alignment: .leading , spacing: 15){
                        Text("Spain")
                            .font(.system(.title2, weight: .bold))
                            .foregroundColor(Color.theme.textPrimary)
                        
                        Text("Lettuce is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled.")
                            .font(.system(.headline, weight: .regular))
                            .foregroundColor(Color.theme.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineSpacing(3)
                    }
                    Spacer()
                    
                }
                
                .padding(.top)
                
                HStack (spacing: 16) {
                    FavoriteButton(isSet: .constant(false) )
                        .frame(width: 78, height: 56)
                    Button(action: {
                        //cartViewModel.addToCart(product)
                    }) {
                        RectangleButton(image: "cart", title: "ADD TO CART")
                    }
                    .buttonStyle(.plain)
                    
                }
                .padding(.top, 40)
                
            }
            .padding(.horizontal, 20)
            .background(
                Color.theme.background
            )
            .toolbar(.hidden, for: .tabBar)
            .cornerRadius(30)
            
        }
        .offset(y: -40)
        
    }
    
    
    
}
