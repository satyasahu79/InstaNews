//
//  ArticleViewModel.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 03/06/22.
//

import Foundation
import Apollo

class ArticleViewModel : ObservableObject   {
    
    @Published public private(set) var articles: [Article] = []
    
    private func queryArticles() async throws -> GraphQLResult<ArticleQuery.Data>? {
        
        return await withCheckedContinuation    { continuation in
            Network.shared.apollo.fetch(query: ArticleQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                        continuation.resume(returning: graphQLResult)
                    return
                case .failure(let error):
                    if let error = error as? Never {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
        
    }
    
    
    
    
    
    
    func fetch() async {
        do {
            let result = try await queryArticles()
            if let result = result {
                      if let articleCollection = result.data?.articleCollection {
                          self.articles = process(data: articleCollection)
                      }
                  }
        } catch {
            print("error", error)
        }
    }

    private func process(data: ArticlesData) -> [Article] {
        let content = ArticlesColection.init(data)

        return content.articles
    }




}
