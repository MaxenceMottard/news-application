//
//  Data.swift
//  github-search
//
//  Created by Maxence Mottard on 07/07/2019.
//  Copyright © 2019 Maxence Mottard. All rights reserved.
//

import Combine
import SwiftUI


final class NetworkManager: BindableObject {
    var didChange = PassthroughSubject<NetworkManager, Never>()
    
    var articles = [Article]() {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=le-monde&apiKey=a8bcdc39b76d4713b7496bef3dd4bb43") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            
            print("Try fetching data")
            guard let data = data else { return }
            
            do {
                print("Try decoding data")
                print(data)
                let articleResponse = try JSONDecoder().decode(ArticleResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.articles = articleResponse.articles
                }
                
                print("complete")
            } catch let parseError as NSError {
                print("JSON Error \(parseError.localizedDescription)")
            }
            
        }.resume()
    }
}




final class ImageLoader: BindableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(imgUrl: String) {
        guard let url = URL(string: imgUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
            
        }.resume()
    }
}
