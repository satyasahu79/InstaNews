//
//  AnimatableFontModifier.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//

import Foundation

import SwiftUI

struct AnimatableFontModifier: AnimatableModifier {
    var size: Double
    
    var animatableData: Double {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
//            .font(.system(size: size))
            .font(.custom("LobsterTwo-BoldItalic",size : size))
            
    }
}

extension View {
    func animatableFont(size: Double) -> some View {
        self.modifier(AnimatableFontModifier(size: size))
    }
}
