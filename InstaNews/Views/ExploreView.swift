//
//  ExploreView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//

import SwiftUI

struct ExploreView: View {
    
    var article : [Article] = articles
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color("Background").ignoresSafeArea()
                BackgroundBlob()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Color.clear
                            .frame(height : 16)
                        
                        ForEach(article) { item in
                            
                            SmallHeadline(title: item.group)
                                .padding(.top,4)
                            ArticleCardView(article: item)
                                .padding(.horizontal)
                            Divider()
                            
                        }
                        
                    }
                    
                }
               
                
            }
            
            .navigationTitle("Explore")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}


