//
//  CircleIcon.swift
//  Delivery
//
//  Created by Sıla Murat on 21.07.2023.
//

import SwiftUI

struct CircleIcon: View {
    var image: Image
    var backgroundColor: Color
    var body: some View {
        
        image
            .scaledToFit()
            .padding(20)
            .background(backgroundColor)
            .clipShape(Circle())
    }
}

struct CircleIcon_Previews: PreviewProvider {
    static var previews: some View {
        CircleIcon(image: Image("Box"), backgroundColor: Color.white)
            .previewLayout(.sizeThatFits)
        
    }
}
