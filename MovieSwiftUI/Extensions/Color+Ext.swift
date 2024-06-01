//
//  Color+Ext.swift
//  MovieSwiftUI
//
//  Created by Cansu Özdizlekli on 5/8/24.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let star = Color("StarColor")
    let secondaryText = Color("SecondaryTextColor")
    let customGray = Color("CustomGrayColor")
    let splashTop = Color("SplashTop")
    let splashBottom = Color("SplashBottom")
}
