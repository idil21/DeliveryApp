//
//  DeliveryApp.swift
//  Delivery
//
//  Created by Sıla Murat on 20.07.2023.
//

import SwiftUI

@main
struct DeliveryApp: App {
    let persistenceController = PersistenceController.shared
    @State private var showSplashView = true
    init(){
        //persistenceController.addDummyData()
    }
    var body: some Scene {
        WindowGroup {
            ZStack{
                ContentView()
                ZStack{
                    if showSplashView {
                        SplashView(showSplashView: $showSplashView)
                            .transition(.move(edge: .leading))
                        
                    }
                    
                }
                .zIndex(2.0)
            }
            
            
            
        }
    }
}
