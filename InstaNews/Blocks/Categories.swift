//
//  Categories.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 02/06/22.
//

import SwiftUI

struct Categories: View {
    
    @Environment(\.colorScheme) var colorScheme
    var text : String = ""
    
    var body: some View {
        Button(action: {}) {
            Text(text)
                .padding(.all,4)
                .opacity(colorScheme == .dark ? 0.75 : 1)
        }
        .tint(.indigo.opacity(colorScheme == .dark ? 0.25 : 0.75))
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.small)
        .disabled(true)
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}
