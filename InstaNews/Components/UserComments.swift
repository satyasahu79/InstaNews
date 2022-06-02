//
//  UserComments.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 31/05/22.
//

import SwiftUI

struct UserComments: View {
    
    @State private var comment = ""
    @FocusState private var commentIsFocused: Bool
    
    var body: some View {
        VStack {
            
            HStack(spacing: 16.0) {
                ZStack {
                    TextEditor(text: $comment)
                        .keyboardType(.default)
                        .focused($commentIsFocused)
                    Text(comment).opacity(0).padding(.all, 8) // <- This will solve the issue if it is in the same ZStack
                        .font(.subheadline)
                    
                }
                .frame(height : 90)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 16, style: .continuous)
//                        .fill(Color.accentColor.opacity(0.5))
//                )
                
                Button(action: {}) {
                    Image(systemName: "message.fill")
                    .font(.body.weight(.bold))
                    .frame(width: 80, height: 90)
                    .foregroundColor(.secondary)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
                }
                //                .buttonStyle(.borderedProminent)
                
            }
        }.padding()
        
        
    }
}

struct UserComments_Previews: PreviewProvider {
    static var previews: some View {
        UserComments()
    }
}
