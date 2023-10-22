//
//  Section.swift
//  Delivery
//
//  Created by Sıla Murat on 6.08.2023.
//

import SwiftUI

struct SectionView<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    var body: some View {
        VStack(alignment: .leading, spacing : 20) {
            HStack {
                Text(title)
                    .foregroundColor(Color.theme.textPrimary)
                    .font(.system(.title2, weight: .bold))
                   
                Spacer()
                changeButton
            }
            content
        }
        .padding()
        .cornerRadius(10)
        .padding(.horizontal)    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(title: "Title") {
            Color.theme.primaryButton
        }
    }
}

extension SectionView {
    private var changeButton : some View{
        Button(action: {}) {
            Text("CHANGE")
                .font(.system(size: 18))
                .foregroundColor(Color.theme.selectedViolet)
        }
        
    }
}
