//
//  FavoriteButton.swift
//  Delivery
//
//  Created by Sıla Murat on 26.07.2023.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .red : Color.theme.textSecondary)
        }
        .frame(minWidth: 0, maxWidth: .infinity , minHeight: 0, maxHeight: 100)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.theme.border, lineWidth: 1)
        )
        .buttonStyle(.plain)
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
