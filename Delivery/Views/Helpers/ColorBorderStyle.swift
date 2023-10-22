//
//  ColorBorderStyle.swift
//  Delivery
//
//  Created by Sıla Murat on 11.08.2023.
//

import SwiftUI

struct ColorBorderStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(colorScheme == .light ? Color.theme.border : Color.white, lineWidth: 1)
            )
    }
}

extension View {
    func addColorBorderStyle() -> some View {
        modifier(ColorBorderStyle())
    }
}
