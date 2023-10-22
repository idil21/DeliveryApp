//
//  ContentView.swift
//  Delivery
//
//  Created by Sıla Murat on 20.07.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var currentTab: Tab = .Home
    @StateObject var cart = CartViewModel()
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color.theme.background)
        UITabBarItem.appearance().badgeColor = UIColor(Color.theme.selectedViolet)
    }
    var body: some View {
        TabView{
            CategoryHome()
                .tabItem {
                    Label("Home", systemImage: "square.grid.2x2")
                }
                .tag(Tab.Home)
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
                .badge(cart.cartProducts.count)
                
                .tag(Tab.Cart)
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(Tab.Profile)
            
        }
        .environmentObject(cart)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}


enum Tab: String, CaseIterable {
    case Home
    case Cart
    case Profile
    
}
