//
//  Network.swift
//  InstaNews
//
//  Created by Satya Prakash Sahu on 03/06/22.
//


import Foundation
import Apollo

class Network {
  static let shared = Network()

    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.contentful.com/content/v1/spaces/lz6tmmp63afk?access_token=A4BkLU9EXvwtefnTkwNvmTxiwKAyKUI-ycIo-ufKYEs")!)
}


//"https://graphql.contentful.com/content/v1/spaces/<space_ID>?access_token=<token_ID>"
