//
//  ArticleView.swift
//  github-search
//
//  Created by Maxence Mottard on 07/07/2019.
//  Copyright © 2019 Maxence Mottard. All rights reserved.
//

import SwiftUI

struct ArticleView : View {
    
    var article: Article
    
    var body: some View {
        
        VStack {
            ImageViewWidget(imgeUrl: article.urlToImage ?? "")
            Text(article.title)
        }
        
    }
}


struct ImageViewWidget: View {
    
    @ObjectBinding var imageLoader: ImageLoader
    
    init(imgeUrl: String) {
        self.imageLoader = ImageLoader(imgUrl: imgeUrl)
    }
    
    var body: some View {
        Image(uiImage: (imageLoader.data.count > 0) ? UIImage(data: imageLoader.data)! : UIImage(named: "img")! )
            .resizable()
            .frame(width: 200, height: 200)
    }
    
}
