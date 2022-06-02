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
    
    @EnvironmentObject var articleViewModel : ArticleViewModel
    
    var article : [Article]
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color("Background").ignoresSafeArea()
                
                BackgroundBlob()
                
                
                ScrollView(showsIndicators: false)  {
                    
                    scrollDetection
                    
                    TextGradient(title: "Let's find the\ninportant things here.")
                    
                    SmallHeadline(title: "Trending")
                        .padding(.bottom)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment:.top , spacing: 0) {
                            ForEach(article) { item in
                                if item.isTrending {
                                    NavigationLink {
                                        ArticleDetailView(article: item)
                                    } label: {
                                        TrendingCard(article: item)
                                    }
                                    
                                    
                                    
                                }
                                
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    SmallHeadline(title: "Newest")
                        .padding(.vertical)
                    
                    ForEach(article) { item in
                        
                        NavigationLink {
                            ArticleDetailView(article: item)
                        } label: {
                            ArticleCardView(article: item)
                                .padding(.horizontal)
                                .padding(.top,4)
                        }
                        
                        
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
                .navigationBarTitle("")
                .navigationBarHidden(true)
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
        HomeView( article: [articlePreviewData])
            .environmentObject(ArticleViewModel())
        
    }
}
