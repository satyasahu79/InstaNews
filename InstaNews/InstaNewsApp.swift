//
//  InstaNewsApp.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//

import SwiftUI

@main
struct InstaNewsApp: App {
    
    @StateObject var model = Model()
    @StateObject var articleViewModel = ArticleViewModel()
    
    var body: some Scene {
        WindowGroup {
//            OnboardingView()
                        ContentView()
                .environmentObject(model)
                .environmentObject(articleViewModel)
        }
    }
}
