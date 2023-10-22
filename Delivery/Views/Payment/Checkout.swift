//
//  Checkout.swift
//  Delivery
//
//  Created by Sıla Murat on 6.08.2023.
//

import SwiftUI

struct Checkout: View {
    @State private var selectedOption: DeliveryOption = .drone
    @State  var nonContactDelivery = false
    var body: some View {
        
        ScrollView{
            VStack {
                SectionView(title: "Payment method") {
                    
                    CellRowView(image: "creditcard", title: "**** **** **** 4747" , isSelected: false)
                    
                }
                SectionView(title: "Delivery address") {
                    VStack(alignment: .leading) {
                        Text("Alexandra Smith")
                            .font(.system(size: 20))
                        Text("Cesu 31 k-2 5.st, SIA Chili, Riga, LV–1012, Latvia")
                            .font(.system(size: 16))
                    }
                    .foregroundColor(Color.theme.textSecondary)
                }
                
                SectionView(title: "Delivery options") {
                    ForEach(DeliveryOption.allCases, id: \.self) { option in
                        CellRowView(image: option.iconName, title: option.rawValue,  isSelected: selectedOption == option)
                            .onTapGesture {
                                selectedOption = option
                            }
                    }
                }
                
                Toggle("Non-contact delivery", isOn: $nonContactDelivery)
                    .toggleStyle(CustomToggleStyle())
                
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .principal){
                CustomNavBar(title: "Checkout")
            }
            
        }
        .navigationBarBackButtonHidden()
        .background(Color.theme.background)
    }
    
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout()
    }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack{
            configuration.label
                .foregroundColor(Color.theme.textPrimary)
                .font(.system(.title2, weight: .bold))
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .fill(configuration.isOn ? Color.theme.selectedBgViolet : .gray.opacity(0.5))
                .overlay {
                    Text(configuration.isOn ? "Yes" : "No")
                        .font(.system(.footnote, weight: .medium))
                        .foregroundColor(configuration.isOn ? Color.theme.selectedViolet : .gray)
                        .offset(x: configuration.isOn ? -10 : 10)
                    Circle()
                        .fill(.white)
                        .padding(3)
                        .offset(x: configuration.isOn ? 20 : -20)
                    
                }
                .frame(width: 70, height: 30)
            
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
            
        }
        .padding()
        .padding(.horizontal)
    }
}


