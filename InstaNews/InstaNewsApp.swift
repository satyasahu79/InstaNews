//
//  InstaNewsApp.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//

import SwiftUI
import FirebaseCore

@main
struct InstaNewsApp: App {
    
    @StateObject var model = Model()
    @StateObject var articleViewModel = ArticleViewModel()
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    
    init() {
          FirebaseApp.configure()
      }
    
    var body: some Scene {
        WindowGroup {
//            OnboardingView()
                        ContentView()
                .environmentObject(model)
                .environmentObject(articleViewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
