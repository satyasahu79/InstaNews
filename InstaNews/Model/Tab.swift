//
//  Tab.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//

import Foundation

import SwiftUI



struct TabItem : Identifiable   {
    var id = UUID()
    var text : String
    var icon : String
    var tab : Tab
    var color : Color
}

var tabItems = [
    TabItem(text: "Home", icon: "house",tab: .home,color: .indigo),
    TabItem(text: "Explore", icon: "magnifyingglass",tab: .explore,color: .orange),
    TabItem(text: "Bookmarks", icon: "bookmark",tab: .bookmarks, color: .blue),
    TabItem(text: "Profile", icon: "person.crop.circle",tab: .profile, color: .green)
]


enum Tab: String {
    case home
    case explore
    case bookmarks
    case profile
}


struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
