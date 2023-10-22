//
//  NavBar.swift
//  Delivery
//
//  Created by Sıla Murat on 4.08.2023.
//

import SwiftUI

struct CustomNavBar: View {
    @Environment(\.dismiss) var dismiss
    var title: String? //= "Title"
    var body: some View {
        HStack{
            backButton
            Spacer()
            if let title = title {
                Text(title)
                    .font(.system(.body, weight: .semibold))
                    .foregroundColor(Color.theme.textPrimary)
            }
            Spacer()
            backButton
                .opacity(0)
           
        }
        .font(.subheadline)
    }
}
struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CustomNavBar()
            Spacer()
            
        }
        
    }
}
extension CustomNavBar {
    private var backButton: some View{
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "chevron.left")
                .foregroundColor(Color.theme.textPrimary)
        })
    }

}
