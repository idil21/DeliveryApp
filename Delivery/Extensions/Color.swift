//
//  Color.swift
//  Delivery
//
//  Created by Sıla Murat on 26.07.2023.
//

import Foundation
import SwiftUI

extension Color{
    static let theme = ColorTheme()
}

struct ColorTheme{
    let accent = Color("AccentColor")
    let background = Color("Background")
    let green = Color("Green")
    let primaryButton = Color("PrimaryButton")
    let primaryPurple = Color("PrimaryPurple")
    let selectedBgViolet = Color("SelectedBGViolet")
    let selectedViolet = Color("SelectedViolet")
    let textPrimary = Color("TextPrimary")
    let textSecondary = Color("TextSecondary")
    let border = Color("Border")
}
