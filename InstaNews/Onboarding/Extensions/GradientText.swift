//
//  GradientText.swift
//  iCloud&InAppPurchase
//
//  Created by Satya Prakash Sahu on 31/05/22.
//

import SwiftUI

struct GradientText: View {
    var text: String = "Text here"

    var body: some View {
        Text(text)
            .gradientForeground(colors: [Color("pink-gradient-1"), Color("pink-gradient-2")])
    }
}

struct GradientText_Previews: PreviewProvider {
    static var previews: some View {
        GradientText()
    }
}
