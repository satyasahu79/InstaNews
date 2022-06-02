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
            
//            Image(article.image)
//                .resizable()
//                .scaledToFill()
            
            AsyncImage(url: URL(string: article.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
            } placeholder: {
                ProgressView()
            }
            
            
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
//                    Image(article.writerImage)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 22, height: 22, alignment: .center)

                    AsyncImage(url: URL(string: article.writerImage)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22, alignment: .center)
                            .clipShape(Circle())
                            
                    } placeholder: {
                        ProgressView()
                    }
                    
                    
                    
                    Text(article.writer)
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
        TrendingCard(article: articlePreviewData)
        //            .preferredColorScheme(.dark)
    }
}
