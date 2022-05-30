//
//  ArticleDetailView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 31/05/22.
//

import SwiftUI

struct ArticleDetailView: View {
    
    var article : Article
    
    
    
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            BackgroundBlob()
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24.0) {
                    
                    
                    Image(article.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200, alignment: .center)
                        .clipped()
                        .cornerRadius(16)
                    
                    
                    
                    VStack(alignment: .leading, spacing: 12.0) {
                        
                        HStack {
                            
                            HStack(spacing : 4){
                                Image(systemName: "eye.fill")
                                    .font(.footnote.weight(.semibold))
                                
                                Text("\(article.views)")
                                    .font(.footnote.weight(.semibold))
                                
                            }
                            
                            Spacer()
                            
                            Text("\(article.date)")
                                .font(.footnote.weight(.semibold))
                            
                        }.opacity(0.75)
                        
                        Divider()
                            .padding(.top)
                            .padding(.bottom)
                        
                        
                        
                        Text(article.title)
                            .font(.title2)
                        
                        HStack(spacing : 4){
                            Image(article.publisherImage)
                                
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18, alignment: .center)
                                .clipped()
                                
                            
                            Text(article.publisher)
                                .font(.footnote.weight(.semibold))
                                
                            
                        }.opacity(0.75)
                        
                    }
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center, spacing: 16.0) {
                            
                            ForEach(article.category,id: \.self) { item in
                                Categories(text: item)
                                //                            .frame(maxWidth :200)
                                    .lineLimit(1)
                                
                                
                                
                            }
                        }
                        
                        
                        
                    }
                    
                    Divider()
//                        .padding(.top)
                    
                    Text(article.body)
                    
                    Divider()
                        .padding(.top)
                    
                    HStack {
                        Spacer()
                        Text("Article by".uppercased())
                            .font(.footnote.weight(.semibold))
                            .foregroundColor(.secondary)
//                            .padding(.horizontal, 16)
                        Spacer()
                    }
                        
                    
                    HStack(spacing: 24.0){
                        
                        
                        Image(article.writerImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 64, alignment: .center)
                        
                        VStack(alignment: .leading, spacing: 4.0) {
                            Text(article.writer)
                                .font(.title3.weight(.semibold))
                            .opacity(0.75)
                            
                            Text(article.writerPosition)
                        }
                        
                    }
                    
                    Divider()
                        .padding(.top)
                    
                    
                    
                    
                    
                    Spacer()
                }
                .padding(.all)
            }
            
            
            
            
        }
        
        
        
        
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articles[0])
//            .preferredColorScheme(.dark)
    }
}

struct Categories: View {
    
    @Environment(\.colorScheme) var colorScheme
    var text : String
    
    var body: some View {
        Button(action: {}) {
            Text(text)
                .padding(.all,4)
                .opacity(colorScheme == .dark ? 0.75 : 1)
        }
        .tint(.indigo.opacity(colorScheme == .dark ? 0.25 : 0.75))
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.small)
    }
}
