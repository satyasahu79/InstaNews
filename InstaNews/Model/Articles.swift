//
//  Articles.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 27/05/22.
//

import Foundation



typealias ArticlesData = ArticleQuery.Data.ArticleCollection

struct ArticlesColection : Decodable   {
    let articles : [Article]
    
    
    
    init(_ articlesCollection : ArticlesData?)    {
        self.articles = (articlesCollection?.articles.map({ article -> Article in
            Article(article)
        })) ?? []
    }
}

struct Article : Identifiable, Decodable    {
    let id : String
    let title : String
    let image : String
    let date : String
//    var category : [String]
    let group : String
    var isBookmarked : Bool
    let isTrending : Bool
    let writer : String
    let writerImage : String
    let writerPosition : String
    let body : String
    let articleLink : String
    
    init (_ article : ArticlesData.Article?)    {

        
        self.id = article?.sys.id ?? ""
        self.title = article?.title ?? ""
        self.image = article?.image?.url ?? ""
        self.date = article?.date ?? ""
//        self.category = article?.category
        self.group = article?.group ?? ""
        self.isBookmarked = article?.isBookmarked ?? false
        self.isTrending = article?.isTrending ?? true
        self.writer = article?.writer ?? ""
        self.writerImage = article?.writerImage?.url ?? ""
        self.writerPosition = article?.writerPosition ?? ""
        self.body = article?.body ?? ""
        self.articleLink = article?.articleLink ?? ""
    }
}


var bookmarkedArticles : [Article] = []






