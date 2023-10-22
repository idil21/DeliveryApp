//
//  Background.swift
//  Delivery
//
//  Created by Sıla Murat on 21.07.2023.
//

import SwiftUI

struct Background: View {

    var body: some View {
        ZStack{
            Color.theme.primaryPurple
            Image("BG")
                .resizable()
                .scaledToFill()
                
        }
        
        .ignoresSafeArea()
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
