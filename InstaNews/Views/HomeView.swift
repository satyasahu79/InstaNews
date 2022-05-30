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
    
    
    
    var article : [Article] = articles
    
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
                
                SmallHeadline(title: "Trending")
                    .padding(.bottom)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment:.top , spacing: 0) {
                        ForEach(article) { item in
                            TrendingCard(article: item)
                        }
                    }
                }
                .padding(.bottom)

                SmallHeadline(title: "Newest")
                    .padding(.vertical)
                
                ForEach(article) { item in
                    ArticleCardView(article: item)
                        .padding(.horizontal)
                    Divider()
                }
                
                
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Insta News", hasScrolled: $hasScrolled)
            )
            
        }   // ZStack Ends
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






