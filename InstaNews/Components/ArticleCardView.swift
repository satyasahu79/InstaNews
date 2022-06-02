//
//  ArticleCardView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 31/05/22.
//

import SwiftUI

struct ArticleCardView: View {
    
    var article : Article
    var views = Int.random(in: 1000...5550)
    var noOfComments = Int.random(in: 10...55)
    
    var body: some View {
        
        HStack(alignment : .top) {
            
            VStack(alignment: .leading, spacing: 16) {
               
                HStack {
                    Text(article.title)
                        .foregroundColor(.primary)
                        .font(.headline.weight(.semibold))
                        .lineLimit(2)
                    .frame(alignment: .leading)
                    Spacer()
                }
                
                
                HStack(spacing:16) {
                   
                    HStack(spacing : 4)  {
                        
                        
//                        Image(article.writerImage)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 22, height: 22, alignment: .center)
                    
                        AsyncImage(url: URL(string: article.writerImage)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.primary)
                                .frame(width: 22, height: 22, alignment: .center)
                                .clipShape(Circle())
                            
                                
                        } placeholder: {
                            ProgressView()
                        }
                    
                        
                        Text(article.writer)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    }
                 
                    
                    HStack(spacing : 4) {
                        Image(systemName: "eye.fill")
                        Text("\(views)")
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
               
                    HStack(spacing : 4) {
                        Image(systemName: "message.fill")
                        Text("\(noOfComments)")
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    
                    
                    
                }
                .font(.footnote)
                .opacity(0.75)
                
                
            }
            //                .frame(width: 220, alignment: .leading)
            
            Spacer()
            
            //            Image(article.image)
            //                .resizable()
            //                .scaledToFill()
            //                .frame(width: 80, height: 80)
            //                .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
            AsyncImage(url: URL(string: article.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .foregroundColor(.primary)
            } placeholder: {
                ProgressView()
            }
            
        }
        
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardView(article: articlePreviewData)
    }
}
