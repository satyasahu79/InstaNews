//
//  TextGradient.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 31/05/22.
//

import SwiftUI

struct TextGradient: View {
    
    var title : String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text(title)
            .font(.title.weight(.bold))
            .opacity(1.8)
            .foregroundStyle(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: colorScheme == .dark ?  Color(#colorLiteral(red: 0.2666666806, green: 0.2352941185, blue: 0.6588235497, alpha: 1)) : .black, location: 0),
                    .init(color: colorScheme == .dark ? Color(#colorLiteral(red: 0.3137255012989044, green: 0.24705882370471954, blue: 0.8588235378265381, alpha: 1)) : .black.opacity(0.5), location: 1)]),
                startPoint: UnitPoint(x: 4.440892098500626e-16, y: 4.996003610813204e-16),
                endPoint: UnitPoint(x: 1.0000000000000004, y: 1.0000000000000004)))
            .frame(maxWidth : .infinity,alignment: .leading)
            .padding(.trailing)
            .padding()
    }
}

struct TextGradient_Previews: PreviewProvider {
    static var previews: some View {
        TextGradient()
    }
}
