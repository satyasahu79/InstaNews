//
//  Articles.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 27/05/22.
//

import Foundation

struct Article : Identifiable    {
    let id = UUID()
    var title : String
    var image : String
    var date : String
    var category : [String]
    var group : String
    var views : Int
    var noOfComments : Int
    var isBookmarked : Bool
    var isTrending : Bool
    var writer : String
    var publisher : String
    var publisherImage : String
    var writerImage : String
    var writerPosition : String
    var body : String
}

struct ArticleGroups {
    
    var Education : String
    var Entertainment : String
    var Politics : String
    var Sports : String
    var Travel : String
    
}



var articles : [Article] = [
    Article(title: "The Beautiful and Largest Hawaiian Island", image: "articleImage2", date:"14 June 2021" , category: ["Travelling", "Holiday", "Trip Advice"], group: "Travel News", views: Int.random(in: 1000...9999), noOfComments: Int.random(in: 10...250), isBookmarked: false, isTrending: true, writer: "Jane Cooper", publisher: "Abstergo Ltd.", publisherImage: "publisherImage1", writerImage: "writerImage1", writerPosition: "Senior Editor, Abstergo", body: "The third largest Hawaiian island is home to the majority of Hawaii’s diverse population, a fusion of East and West cultures rooted in the values and traditions of the Native Hawaiian people.\n\nIt’s this fundamental contrast between the ancient and the modern that makes discovering Oahu — from bustling city life to laidback surf towns — so enjoyable"),
    
    Article(title: "Business Article", image: "articleImage1", date:"14 June 2021" , category: ["Travelling", "Holiday", "Trip Advice"], group: "Bussiness News", views: Int.random(in: 100...9999), noOfComments: Int.random(in: 10...250), isBookmarked: false, isTrending: true, writer: "Jane Cooper", publisher: "Abstergo Ltd.", publisherImage: "publisherImage1", writerImage: "writerImage1", writerPosition: "Senior Editor, Abstergo", body: "The third largest Hawaiian island is home to the majority of Hawaii’s diverse population, a fusion of East and West cultures rooted in the values and traditions of the Native Hawaiian people.\n\nIt’s this fundamental contrast between the ancient and the modern that makes discovering Oahu — from bustling city life to laidback surf towns — so enjoyable"),
    
    Article(title: "Business Article", image: "articleImage1", date:"14 June 2021" , category: ["Travelling", "Holiday", "Trip Advice"], group: "Bussiness News", views: Int.random(in: 100...9999), noOfComments: Int.random(in: 10...250), isBookmarked: false, isTrending: true, writer: "Jane Cooper", publisher: "Abstergo Ltd.", publisherImage: "publisherImage1", writerImage: "writerImage1", writerPosition: "Senior Editor, Abstergo", body: "The third largest Hawaiian island is home to the majority of Hawaii’s diverse population, a fusion of East and West cultures rooted in the values and traditions of the Native Hawaiian people.\n\nIt’s this fundamental contrast between the ancient and the modern that makes discovering Oahu — from bustling city life to laidback surf towns — so enjoyable"),
    
    Article(title: "Education Article", image: "articleImage1", date:"14 June 2021" , category: ["Travelling", "Holiday", "Trip Advice"], group: "Education", views: Int.random(in: 100...9999), noOfComments: Int.random(in: 10...250), isBookmarked: false, isTrending: true, writer: "Jane Cooper", publisher: "Abstergo Ltd.", publisherImage: "publisherImage1", writerImage: "writerImage1", writerPosition: "Senior Editor, Abstergo", body: "The third largest Hawaiian island is home to the majority of Hawaii’s diverse population, a fusion of East and West cultures rooted in the values and traditions of the Native Hawaiian people.\n\nIt’s this fundamental contrast between the ancient and the modern that makes discovering Oahu — from bustling city life to laidback surf towns — so enjoyable"),
    
    Article(title: "Political Article", image: "articleImage1", date:"14 June 2021" , category: ["Travelling", "Holiday", "Trip Advice"], group: "Politics", views: Int.random(in: 100...9999), noOfComments: Int.random(in: 10...250), isBookmarked: false, isTrending: true, writer: "Jane Cooper", publisher: "Abstergo Ltd.", publisherImage: "publisherImage1", writerImage: "writerImage1", writerPosition: "Senior Editor, Abstergo", body: "The third largest Hawaiian island is home to the majority of Hawaii’s diverse population, a fusion of East and West cultures rooted in the values and traditions of the Native Hawaiian people.\n\nIt’s this fundamental contrast between the ancient and the modern that makes discovering Oahu — from bustling city life to laidback surf towns — so enjoyable"),
    
    Article(title: "Entertainment Article", image: "articleImage1", date:"14 June 2021" , category: ["Travelling", "Holiday", "Trip Advice"], group: "Entertainment", views: Int.random(in: 100...9999), noOfComments: Int.random(in: 10...250), isBookmarked: false, isTrending: true, writer: "Jane Cooper", publisher: "Abstergo Ltd.", publisherImage: "publisherImage1", writerImage: "writerImage1", writerPosition: "Senior Editor, Abstergo", body: "The third largest Hawaiian island is home to the majority of Hawaii’s diverse population, a fusion of East and West cultures rooted in the values and traditions of the Native Hawaiian people.\n\nIt’s this fundamental contrast between the ancient and the modern that makes discovering Oahu — from bustling city life to laidback surf towns — so enjoyable"),
    
    Article(title: "Entertainment Article", image: "articleImage1", date:"14 June 2021" , category: ["Travelling", "Holiday", "Trip Advice"], group: "Sports", views: Int.random(in: 100...9999), noOfComments: Int.random(in: 10...250), isBookmarked: false, isTrending: true, writer: "Jane Cooper", publisher: "Abstergo Ltd.", publisherImage: "publisherImage1", writerImage: "writerImage1", writerPosition: "Senior Editor, Abstergo", body: "The third largest Hawaiian island is home to the majority of Hawaii’s diverse population, a fusion of East and West cultures rooted in the values and traditions of the Native Hawaiian people.\n\nIt’s this fundamental contrast between the ancient and the modern that makes discovering Oahu — from bustling city life to laidback surf towns — so enjoyable")
]

var travelArticles = articles.filter { article in
    article.group == "Travel"
}

var politicalArticles = articles.filter { article in
    article.group == "Politics"
}

var educationalArticles = articles.filter { article in
    article.group == "Education"
}

var entertainmentArticles = articles.filter { article in
    article.group == "Entertainment"
}

var bookmarkedArticles = articles.filter {   article in
    article.isBookmarked == true
}

var sportsArticles = articles.filter {   article in
    article.group == "Sports"
}
