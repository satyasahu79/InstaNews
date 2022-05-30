//
//  ArticleCardView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 31/05/22.
//

import SwiftUI

struct ArticleCardView: View {
    
    var article : Article
    
    var body: some View {
        
        HStack(alignment : .top) {
            
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.headline.weight(.semibold))
                    .lineLimit(2)
                    .frame(alignment: .leading)
                
                HStack(spacing:16) {
                   
                    
                    Text(article.publisher)
                        .fontWeight(.semibold)
                 
                       
                    
                    
                    HStack(spacing : 4) {
                        Image(systemName: "eye.fill")
                        Text("\(article.views)")
                            .fontWeight(.semibold)
                    }
               
                    HStack(spacing : 4) {
                        Image(systemName: "message.fill")
                        Text("\(article.noOfComments)")
                            .fontWeight(.semibold)
                    }
                    
                }
                .font(.footnote)
                .opacity(0.75)
                
                
            }
            //                .frame(width: 220, alignment: .leading)
            
            Spacer()
            
            Image(article.image)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
        }
        
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardView(article: articles[0])
    }
}
