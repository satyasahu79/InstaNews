//
//  SubHeadline.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 31/05/22.
//

import SwiftUI

struct SmallHeadline: View {
    var title = ""
    
    var body: some View {
        Text(title.uppercased())
            .font(.footnote.weight(.semibold))
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
    }
}

struct SmallHeadline_Previews: PreviewProvider {
    static var previews: some View {
        SmallHeadline()
    }
}
