//
//  ContentView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//


import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model : Model
    @EnvironmentObject var articleViewModel : ArticleViewModel
    
    //    @AppStorage("showOnboarding") var showOnboarding = true
    @State var showHome : Bool = false
    
    var body: some View {
        
        ZStack {
            //            if !showOnboarding{
            //                ZStack {
            //
            //                    switch selectedTab {
            //                    case .home:
            //                        HomeView( article: articleViewModel.articles)
            //                    case .explore:
            //                        ExploreView(article: articleViewModel.articles)
            //                    case .bookmarks:
            //                        BookmarksView()
            //                    case .profile:
            //                        ProfileView1()
            //                    }
            //
            //                    TabBar()
            //                        .offset( y: model.showDetail ? 200 : 0)
            //
            //                }   // Tab Bar ZStack Ends
            //                .safeAreaInset(edge: .bottom) {
            //                    Color.clear.frame(height: 44)
            //                }
            //
            //            }
            //            else {
            //                OnboardingView( showOnboarding: $showOnboarding)
            //            }
            
            
            
            
            ZStack {
                
                switch selectedTab {
                case .home:
                    HomeView( article: articleViewModel.articles)
                case .explore:
                    ExploreView(article: articleViewModel.articles)
                case .bookmarks:
                    BookmarksView(article: articleViewModel.articles)
                case .profile:
                    SignupView()
//                        .offset(y:80)
//                        .safeAreaInset(edge: .bottom) {
//                            Color.clear.frame(height: 44)
//                        }
                    
                }
                
                TabBar()
                    .offset( y: model.showDetail ? 200 : 0)
                    .zIndex(100)
                
            }   // Tab Bar ZStack Ends
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 44)
            }
            
        }
        
        .task {
            await articleViewModel.fetch()
        }
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
            .environmentObject(ArticleViewModel())
    }
}
