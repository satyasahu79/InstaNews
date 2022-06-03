//
//  ExploreView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//

import SwiftUI

struct ExploreView: View {
    
    var article : [Article]
    
    var articleGroups = ["Auto News","Bussiness News","Political News", "Personal Finance News","Tech News","Tech News","Travel News","Sports News"]
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color("Background").ignoresSafeArea()
                BackgroundBlob()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading) {
                        
                        Color.clear
                            .frame(height : 16)
                        
                        
                        ForEach(articleGroups,id: \.self) { articleGroup in
                            
                            SmallHeadline(title: articleGroup)
                                .padding(.top,4)
                                
                            Divider()
                                .padding(.bottom,8)
                            
                            ForEach(article) { item in
                        
                                NavigationLink {
                                    ArticleDetailView(article: item)
                                } label: {
                                    if articleGroup == item.group {
                                        ArticleCardView(article: item)
                                            .padding(.horizontal)
                                        .padding(.bottom)
                                        
                                    }
                                }.frame(alignment:.leading)

                                
//                                    else {
//                                    Text("Currently no Articles Are present in \(articleGroup)")
//                                }
//                                    .padding(.top)
    //                            Divider()
                                
                            }
                            
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
        ExploreView(article: [articlePreviewData])
    }
}


