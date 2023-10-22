//
//  CategoryHome.swift
//  Delivery
//
//  Created by Sıla Murat on 25.07.2023.
//

import SwiftUI

struct CategoryHome: View {
    @State var searchText: String = ""
    @StateObject var categoriesViewModel = CategoryListViewModel()
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    
    var body: some View {
        NavigationStack{
            VStack{
                VStack(alignment: .leading, spacing: 10){
                    Text("Categories")
                        .font(.system(.largeTitle, weight: .bold))
                        .foregroundColor(Color.theme.textPrimary)
                        .padding(.leading)
                    SearchBar(searchText: $searchText)
                }
                ScrollView{

                    LazyVGrid(
                        columns: columns,
                        alignment: .center,
                        spacing: 20 ) {
                            ForEach(categoriesViewModel.categoryList, id: \.self) { category in
                                    NavigationLink(value: category) {
                                        CategoryCard(category: category)
                                    }
                                }
                        }
                        .padding()
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: CategoryM.self, destination: { category in
                    ProductList(category: category)
                })
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        CustomNavBar()
                    }
                }
                
            }
            .background(Color.theme.background)
            
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}

