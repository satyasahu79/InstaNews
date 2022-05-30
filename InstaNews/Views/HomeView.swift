//
//  HomeView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var hasScrolled = false
    @State var show = false
    @State var showsStatusBar : Bool = true
    
    var body: some View {
        
        
        
        ZStack {
            
            Color("Background").ignoresSafeArea()
            
            Circle()
                .fill(Color(#colorLiteral(red: 0.2235294133424759, green: 0.07450980693101883, blue: 0.7215686440467834, alpha: 1)))
                .frame(width: 330, height: 330, alignment: .center)
                .blur(radius: 200)
                .offset(x: 150, y: -320)
            
            
            ScrollView(showsIndicators: false)  {
                
                scrollDetection

                TextGradient()
                
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Insta News", hasScrolled: $hasScrolled)
            )
        }
        .statusBar(hidden: !showsStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showsStatusBar = false
                }   else {
                    showsStatusBar = true
                }
                
            }
            
        }
        
        
        
    }
    
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            //                Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

struct TextGradient: View {
    var body: some View {
        Text("Let's find the\ninportant things here.")
            .font(.title.weight(.bold))
            .opacity(1.8)
            .foregroundStyle(LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.2666666806, green: 0.2352941185, blue: 0.6588235497, alpha: 1)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0.3137255012989044, green: 0.24705882370471954, blue: 0.8588235378265381, alpha: 1)), location: 1)]),
                startPoint: UnitPoint(x: 4.440892098500626e-16, y: 4.996003610813204e-16),
                endPoint: UnitPoint(x: 1.0000000000000004, y: 1.0000000000000004)))
            .frame(maxWidth : .infinity,alignment: .leading)
            .padding(.trailing)
            .padding()
    }
}
