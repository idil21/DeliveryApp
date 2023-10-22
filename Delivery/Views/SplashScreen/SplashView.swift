//
//  SplashView.swift
//  Delivery
//
//  Created by Sıla Murat on 24.07.2023.
//

import SwiftUI

struct SplashView: View {
    @Binding var showSplashView: Bool
    var title = "Non-Contact \n Deliveries"
    var text = "When placing an order, select the option \"Contactless delivery\" and the courier will leave your order at the door."
    var body: some View {
        ZStack{
            Background()
            HStack{
                VStack(alignment: .leading){
                    CircleIcon(image: Image("D"), backgroundColor: Color("LogoBG"))
                    Spacer()
                }
                .padding(40)
                Spacer()
            }
            VStack{
                Spacer()
                Backdrop
            }
            .ignoresSafeArea()
   
        }
       
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(showSplashView: .constant(true))
    }
}

extension SplashView {
    private var Backdrop : some View {
        VStack {
            CircleIcon(image: Image("Box"), backgroundColor: .white)
                .frame(width: 104, height: 104)
            
            Text(title)
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.theme.textPrimary)
                .padding(.bottom)
                
            Text(text)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.theme.textSecondary)
                .fixedSize(horizontal: false, vertical: true)
            
            Button(action: {
                 showSplashView = false
            }) {
                RectangleButton(image: nil, title: "ORDER NOW")
            }
            .buttonStyle(.plain)
            .padding(.top, 30)
            Button{
                
            } label:{
                Text("DISMISS")
                    .font(.subheadline)
                    .foregroundColor(Color.theme.textSecondary)
            }
            .padding(.top, 20)
            
            
        }
        .padding(40)
        .background(
            Color.theme.background
                .cornerRadius(60)
        )
        
    }
}
