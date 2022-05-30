//
//  BookmarksView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 26/05/22.
//

import SwiftUI

struct BookmarksView: View {
    
    var article : [Article] = bookmarkedArticles
    
    var body: some View {
        NavigationView {
            ZStack  {
                
                Color("Background").ignoresSafeArea()
                
                BackgroundBlob()
                    
                    ScrollView {
                        VStack{
                            
                            if bookmarkedArticles.count == 0 {
                                VStack(alignment:.center) {
                                    Spacer()
                                    Text("There are currently no bookmarked articles.\nPlease bookmark an article to view it here.")
                                        .font(.subheadline)
//                                        .padding(.vertical)
                                    Spacer()
                                }.frame(height : 500,alignment: .center)
                                
                            }   // if Ends
                            else {
                                VStack {
                                    ForEach(article) { item in
                                        
                                        ArticleCardView(article: item)
                                        Divider()
                                        
                                        
                                    }   // For Each Ends
                                    
                                    Spacer()
                                } // VStack Ends
                                .padding()
                            
                            }   // Else Ends
                            
                           
                        }
                    }
                    .navigationTitle("Bookmarks")
                
            }
        }
        
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
    }
}
