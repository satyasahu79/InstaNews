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
            
            
            ScrollView(showsIndicators: false)  {
                
                scrollDetection
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.red)
                    .frame(width: 150, height: 1800, alignment: .center)
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
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
    }
}
