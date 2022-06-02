//
//  ContentView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model : Model
    
    var body: some View {
        ZStack {
            
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                ExploreView()
            case .bookmarks:
                BookmarksView()
            case .profile:
                UserComments()
            }
            
            TabBar()
                .offset( y: model.showDetail ? 200 : 0)
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
    }
}
