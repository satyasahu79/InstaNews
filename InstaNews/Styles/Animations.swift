//
//  Animations.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//

import Foundation

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
}
