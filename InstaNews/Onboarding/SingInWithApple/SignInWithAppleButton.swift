//
//  SignInWithAppleButton.swift
//  iCloud&InAppPurchase
//
//  Created by Satya Prakash Sahu on 01/06/22.
//

import Foundation

import SwiftUI
import AuthenticationServices


struct SignInWithAppleButton: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton

    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
}
