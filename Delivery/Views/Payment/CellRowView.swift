//
//  CellRowView.swift
//  Delivery
//
//  Created by Sıla Murat on 9.08.2023.
//

import SwiftUI

enum DeliveryOption: String, CaseIterable {
    case pickup = "I'll pick it up myself"
    case courier = "By courier"
    case drone = "By Drone"
    
    var iconName: String {
        switch self {
        case .pickup:
            return "figure.walk"
        case .courier:
            return "bicycle"
        case .drone:
            return "airplane"
        }
    }
}


struct CellRowView: View {
    var image: String
    var title: String
    var isSelected: Bool
    var body: some View {
        HStack (spacing: 10){
            Image(systemName: image)
                .foregroundColor(isSelected ? Color.theme.selectedViolet : .black)
                .frame(width: 24, height: 24)
            
            Text(title)
                .foregroundColor(isSelected ? Color.theme.selectedViolet : Color.theme.textSecondary)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.theme.selectedViolet)
            }
            
        }
    }
}

struct CellRowView_Previews: PreviewProvider {
    static var option: DeliveryOption = .pickup
    static var previews: some View {
        CellRowView(image: option.iconName, title: option.rawValue, isSelected: true)
    }
}
