//
//  BackgroundBlob.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 31/05/22.
//

import SwiftUI

struct BackgroundBlob: View {
    var body: some View {
        Circle()
            .fill(Color(#colorLiteral(red: 0.2235294133424759, green: 0.07450980693101883, blue: 0.7215686440467834, alpha: 1)))
            .frame(width: 330, height: 330, alignment: .center)
            .blur(radius: 200)
            .offset(x: 150, y: -320)
    }
}

struct BackgroundBlob_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundBlob()
    }
}
