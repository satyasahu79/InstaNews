//
//  ArticleDetailView.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 31/05/22.
//

import SwiftUI

struct ArticleDetailView: View {
    
    var article : Article
    var views = Int.random(in: 1000...5550)
    
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            BackgroundBlob()
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16.0) {
                    
                    
//                    Image(article.image)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(height: 200, alignment: .center)
//                        .clipped()
//                        .cornerRadius(16)
                    
                    AsyncImage(url: URL(string: article.image)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200, alignment: .center)
                            .clipped()
                            .cornerRadius(16)
                            
                    } placeholder: {
                        ProgressView()
                    }
                    
                    
                    
                    
                    VStack(alignment: .leading, spacing: 12.0) {
                        
                        HStack {
                            
                            HStack(spacing : 4){
                                Image(systemName: "eye.fill")
                                    .font(.footnote.weight(.semibold))
                                
                                Text("\(views)")
                                    .font(.footnote.weight(.semibold))
                                
                            }
                            
                            Spacer()
                            
                            Text("\(article.date)")
                                .font(.footnote.weight(.semibold))
                            
                        }.opacity(0.75)
                        
                        
                        Button {
                            print("Add to bookmark")
                        } label: {
                            Spacer()
                            Text("Add to bookmarks")
                            Spacer()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.secondary)
                        
                        
                        Divider()
                        //                            .padding(.top)
//                            .padding(.bottom)
                        
                        
                        Text(article.title)
                            .font(.title2.weight(.semibold))
//                            .padding(.top,-20)
                        
                        
                        
                      
                        
                    }
                    
                    
                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(alignment: .center, spacing: 16.0) {
//
//                            ForEach(article.category,id: \.self) { item in
//                                Categories(text: item)
//                                //                            .frame(maxWidth :200)
//                                    .lineLimit(1)
//
//
//
//                            }
//                        }
//
//
//
//                    }
                    
                    Divider()
                    //                        .padding(.top)
                    
                    Text(article.body)
                    
                    Divider()
                        .padding(.top)
                    
                    HStack {
                        //                        Spacer()
                        Text("Article by".uppercased())
                            .font(.footnote.weight(.semibold))
                            .foregroundColor(.secondary)
                        //                            .padding(.horizontal, 16)
                        //                        Spacer()
                    }
                    
                    
                    HStack(spacing: 24.0){
                        
//                        Image(article.writerImage)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 64, height: 64, alignment: .center)
                        
                        AsyncImage(url: URL(string: article.writerImage)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64, alignment: .center)
                                .clipShape(Circle())
                                
                        } placeholder: {
                            ProgressView()
                        }
                        
                        
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
            
            
            
            .navigationBarTitle(article.title, displayMode: .inline)
//            .navigationBarHidden(true)
        }
        
        
        
        
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: articlePreviewData, views: 2000)
                    .preferredColorScheme(.dark)
    }
}


