//
//  TrendingCard.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 30/05/22.
//

import SwiftUI

struct TrendingCard: View {
    
    var article : Article
    
    
    var body: some View {
        ZStack {
            
            Image(article.image)
                .resizable()
                .scaledToFill()
            
            Rectangle()
                .fill(LinearGradient(colors: [.black.opacity(0.9),.black.opacity(0)], startPoint: .bottom, endPoint: .top))
            
            VStack(alignment: .leading, spacing: 8.0){
                
                Spacer()
                
                Text(article.date)
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.white)
                    .opacity(0.75)
                
                Text(article.title)
                    .font(.headline.weight(.semibold))
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                
                HStack{
                    Image(article.publisherImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22, alignment: .center)
                    
                    Text(article.publisher)
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(.white)
                        .opacity(0.75)
                    
                    Spacer()
                    
                    
                }
                
                
            }
            .padding()
            .frame(width: 200, height: 250)
            
            
        }   // ZStack Ends
        .frame(width: 200, height: 250, alignment: .center)
        .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .padding(.leading)
        
        
        
        
    }
}

struct TrendingCard_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCard( article: travelArticles[0])
        //            .preferredColorScheme(.dark)
    }
}
