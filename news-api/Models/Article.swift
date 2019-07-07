//
//  Article.swift
//  github-search
//
//  Created by Maxence Mottard on 07/07/2019.
//  Copyright © 2019 Maxence Mottard. All rights reserved.
//

import SwiftUI
import Combine

struct Article: Decodable {
    
    let source: Source
    let author: String?
    let title: String
    let descritpion: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
    
}


struct ArticleResponse: Decodable {
    
    let articles: [Article]
    
}
