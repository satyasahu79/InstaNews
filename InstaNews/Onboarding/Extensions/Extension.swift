//
//  Extension.swift
//  iCloud&InAppPurchase
//
//  Created by Satya Prakash Sahu on 31/05/22.
//

import Foundation
import SwiftUI

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self
            .overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}
