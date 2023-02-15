//
//  Color.swift
//  CryptoTracker
//
//  Created by mongy on 13/02/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accentColor = Color("AccentColor")
    let red = Color("RedColor")
    let green = Color("GreenColor")
    let background = Color("BackgroundColor")
    let secondaryColor = Color("SecondaryColor")
}
