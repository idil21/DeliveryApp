//
//  Payment.swift
//  Delivery
//
//  Created by Sıla Murat on 11.08.2023.
//

import SwiftUI


struct CardPayment {
    var holderName: String = ""
    var number: String = ""
    var expMonth: String = ""
    var expYear: String = ""
    var cvc: String = ""
}
struct Payment: View {
    @State private var cardPayment: CardPayment = CardPayment()
    var body: some View {
        VStack {
            TextField("Card Holder Name", text: $cardPayment.holderName)
                .addColorBorderStyle()
            TextField("Card Number", text: $cardPayment.number)
                .addColorBorderStyle()
            HStack {
                HStack {
                    TextField("08", text: $cardPayment.expMonth)
                    TextField("23", text: $cardPayment.expYear)
                }
                .addColorBorderStyle()
                
                TextField("CVC", text: $cardPayment.cvc)
                    .addColorBorderStyle()
            }
            
        }
        .padding()
    }
}

struct Payment_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Payment()
                .preferredColorScheme(.light)
            Payment()
                .preferredColorScheme(.dark)
        }
    }
}
