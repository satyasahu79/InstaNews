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
    var subtitle : String
    var image : String
    var category : String
    var writer : String
    var publisher : String
    var publisherImage : String
    var writerImage : String
    var body : String
}

var articles : [Article] = [
    Article(title: "This is a test", subtitle: "This is the test Subtitle", image: "illustration 1", category: "Education", writer: "Satya Prakash Sahu", publisher: "Indian Express", publisherImage: "Indian Express", writerImage: "Amrita Dev", body: "This is the body of the article.")
]
