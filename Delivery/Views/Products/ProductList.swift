//
//  ProductList.swift
//  Delivery
//
//  Created by Sıla Murat on 27.07.2023.
//

import SwiftUI
struct ProductList: View {
    @State var searchText: String = ""
    var category: CategoryM
    @ObservedObject var productsViewModel: ProductsViewModel
    
    init(category: CategoryM){
        self.productsViewModel = ProductsViewModel(selectedCategoryId: category.id)
        self.category = category
    }
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 10){
                Text(category.name)
                    .font(.system(.largeTitle, weight: .bold))
                    .foregroundColor(Color.theme.textPrimary)
                    .padding(.leading)
                SearchBar(searchText: $searchText)
            }
            ScrollView{
                ForEach(productsViewModel.products, id: \.self) { product in
                    NavigationLink {
                        ProductDetail(product: product)
                    } label: {
                        ProductRow(product: product)
                    }
                }
               
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                CustomNavBar()
            }
        }
        .background(
            Color.theme.background
                .ignoresSafeArea()
        )
    }
}
/*
struct ProductList_Previews: PreviewProvider {
    static var categories = CategoryListViewModel().categoryList
    static var previews: some View {
        ProductList(category: categories[0])
        
    }
}*/


