//
//  RectangleButton.swift
//  Delivery
//
//  Created by Sıla Murat on 20.07.2023.
//

import SwiftUI

struct RectangleButton: View {
    let image: String?
    let title: String
    var body: some View {
        
        HStack {
            if let image = image {
                Image(systemName: image)
                    .font(.headline)
            }
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
        }
        .padding()
        .foregroundColor(.white)
        .frame(height: 56)
        .frame( maxWidth: .infinity)
        .background(
            Color.theme.primaryButton
                .cornerRadius(10)
        )
        
        
    }
    
}

struct RectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButton( image: "cart", title: "ORDER")
            .previewLayout(.sizeThatFits)
        
    }
}

