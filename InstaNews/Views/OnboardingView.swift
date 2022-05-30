//
//  OnboardingView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 28/05/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack{
            BlurView()
                .frame(width: 390)
            
            VStack(alignment: .leading) {
                
                Text("Find thousands of intresting news every day.")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .blendMode(.overlay)
                    .padding(.top,150)
                 
                Spacer()
                
                Text("You can fill your spare time by reading thousands of the latest news that we provide.")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .blendMode( colorScheme == .dark ? .overlay :  .overlay)
                    .opacity(colorScheme == .light ? 1 : 1)
                    
                
                Spacer()
            }
            .padding(.horizontal,20)
            .frame(height : 700)
            .offset( y: -100)
        }
        
        
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .preferredColorScheme(.dark)
    }
}
