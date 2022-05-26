//
//  PreferenceKeys.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//

import Foundation

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
